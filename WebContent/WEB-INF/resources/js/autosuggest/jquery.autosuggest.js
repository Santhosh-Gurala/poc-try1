/*
 * 
 * AutoSuggest 1.0 - Generic AutoSuggest/AutoCompletion!
 * @requires jQuery v1.2.6
 * 
 * 
 */
/**
 *
 * @description Create a autosuggest enabled text box
 * 
 * @example $('textbox').autosuggest();
 * @example
 * $("#vendor").autosuggest({url:'http://www.abc.com/auto',elementName:'vendorId',readonly:false,defaultId:'123',defaultValue:'Delux',
 * 	 onValueReset:function(){
 * 			alert('sending new request to server');			 	
 * 	 },
 * 	 onValueSet:function(){
 * 	 		alert('option selected');
 * 	 }
 * 	});
 * @desc Create a simple autosuggest enabled test box.
 *
 */

 
(function($) {
  $.extend({
    autosuggest: new function() {
	//Default Parameters
     this.defaults = {
		url: '',
		elementName: '',
		minCharacters: 1,
		maxCount:100,
		showCount:true,
		showIndicator:true,
		showError:true,
		//defaultId:'',
		//defaultValue:'',
		readonly:false,
		disabled:false,
		onValueSet:null,
		onValueReset:null,
		onValueChange:null,
		width:'200px',
		height:106,
		ajaxFunctionName:''
	};

    //Makes ajax call to fetch results,displays results
	function loadSuggestValues(textelem, results, loadSpan, errorSpan, hiddenField, urlVal, maxCount, onValueSet, onValueReset, showIndicator, showError, showCount, onValueChange, previousValue, dropdownHeight,minCharacters, keyUp,resId,ajaxFunctionName){
		//var urlVal=autoconfig.url;
		//var minCharacters=autoconfig.minCharacters;
		//var maxCount=autoconfig.maxCount;		
		$(hiddenField).val("");
		if ($(results).is(":visible")) {
			$(results).hide();
		}
		

		var searchString=$(textelem).val();
		searchString=$.trim(searchString);
		//If the user wipes out the text completely,set the previous value to empty
		if(searchString.length==0 && keyUp){
			$(previousValue).val("");
			if (onValueReset) {
			 onValueReset();
			}
			
		}
	   if(searchString.length >= minCharacters && searchString==$.trim($(textelem).val())){
	      urlVal = urlVal +"&searchText="+encodeURIComponent(searchString)+"&maxCount="+maxCount;
		  jQuery.ajax({
            type: "POST",
            url: urlVal, 
            cache: false,
						data: jQuery('form').serialize(),
						dataType: "xml",
						beforeSend: function() {
							if(showIndicator)
							beforeRequestSend(loadSpan)
   					}, 
		  			success: function(message)  {
							onSuccess(searchString,message,textelem,results,loadSpan,errorSpan,hiddenField, maxCount,onValueSet,showError,showCount,onValueChange, previousValue,dropdownHeight,resId,ajaxFunctionName);
						},
      			error: function(XMLHttpRequest, textStatus, errorThrown){
							var errorMessage = "Failed to submit your request";
							if(textStatus == 'parsererror')
								errorMessage="Failed to display results";
							else if(textStatus == 'timeout')
								errorMessage="Request timed out";
							onError(errorMessage, errorSpan, textelem,hiddenField,results, showError, previousValue);
      			}
        });
	  } else{
		   $(loadSpan).empty();
	  }  
  }

 //Showing the load indicator while processing the request
  function beforeRequestSend(loadSpan){
	  $(loadSpan).empty().append("&nbsp;");
	  $(loadSpan).removeClass("as_error");
	  $(loadSpan).addClass("as_loading");
  }

  //Show results on success or error message on failure
  function onSuccess(searchString, message, textelem, results, loadSpan, errorSpan, hiddenField, maxCount,onValueSet,showError,showCount,onValueChange, previousValue, dropdownHeight,resId,ajaxFunctionName){
	  var maxCount=maxCount;
      var errorMessage=jQuery(message).find('ErrorMessage').text();
	  //alert("errorMessage"+errorMessage);
	  if(searchString!=$.trim($(textelem).val())){
		  $(loadSpan).removeClass("as_loading");
	  }
	  else if(errorMessage!=null && errorMessage!=""){
		onError(errorMessage, errorSpan, textelem, hiddenField, results,showError, previousValue)	
	  }
	  else{
		var resultCount=jQuery(message).find('ResultsCount').text();
		if(showCount)
			showcount(message, loadSpan, maxCount);
		  var resultCount=jQuery(message).find('ResultsCount').text();
		message=createList(message, textelem, results, hiddenField, loadSpan,onValueSet,onValueChange, previousValue,ajaxFunctionName);
		
		//if(resultCount > 0){
			showResults(message,textelem,results,resultCount,dropdownHeight,resId);
		//}
		$(loadSpan).removeClass("as_loading");
		
		
	  }
  }
  
  //Display error message
  function onError(errorMessage, errorSpan, textelem, hiddenField, results, showError, previousValue){
	  $(errorSpan).removeClass("as_loading");
	  if(showError){
		$(errorSpan).addClass("as_error");
	    $(errorSpan).empty().append(errorMessage);
	  }
	  $(textelem).val("");
	  $(hiddenField).val("");
	  hideResults(results, textelem, hiddenField, previousValue, true)
  }

  //Show count of results
  function showcount(message, loadSpan, maxCount){
	  var resultCount=jQuery(message).find('ResultsCount').text();
	  var countDisplay="";
	  if(maxCount <= resultCount){
		  countDisplay=maxCount+"/"+resultCount;
	  }
	  else{
		  countDisplay=resultCount+"/"+resultCount;
	  }
	  $(loadSpan).removeClass("as_error");
	  $(loadSpan).removeClass("as_loading");
	  $(loadSpan).empty().append(countDisplay);
  }


  //Parsing through the xml and creating list to be displayed in the drop down
  function createList(message,textelem,results, hiddenField, loadSpan, onValueSet,onValueChange, previousValue,ajaxFunctionName) {
	 var ul = document.createElement("ul");
	 $(ul).addClass("as_ul");
	   if ($.browser.msie) {
		   var iWidth =  $(textelem).width();
		   $(ul).css("width",parseInt(iWidth) - parseInt(13) + "px");
	 }
	 jQuery('AutoComplete Option',message).each(function(index){
	  	var li = document.createElement("li");
		$(li).addClass("as_li");
		if(index%2!=0){
		$(li).addClass("as_li_odd");
		}
		li.innerHTML = $.trim(jQuery(this).find('Value').text());
		li.id=jQuery(this).find('Id').text();
		ul.appendChild(li);
		$(li).hover(
				function() { $(".as_li", ul).removeClass("as_over"); $(this).addClass("as_over");},
				function() { $(this).addClass("as_over"); }
			).click(function(e) { e.preventDefault(); e.stopPropagation(); selectItem(this, textelem, results, hiddenField, onValueSet, loadSpan, onValueChange, previousValue,ajaxFunctionName) });
		
		if(index==0){
			$(li).addClass('as_over');
		}
      }); 
	  return ul;
  };

  //Display the results div based on the text box position and width
  function showResults(message,textelem,results,resultCount, dropdownHeight,resId) {
		var pos = findPos(textelem);
		//var resultCount=jQuery(message).find('ResultsCount').text();
		var iWidth =  $(textelem).width();
		if(resultCount > 10){
			$(results).css({
			width: parseInt(iWidth) + parseInt(5) + "px",
			top: (pos.y + textelem.offsetHeight) + "px",
			left: pos.x + "px"
				
			}).show();
			
		}
		else{
			$(results).css({
			width: parseInt(iWidth) + parseInt(5) + "px",
			top: (pos.y + textelem.offsetHeight) + "px",
			left: pos.x + "px"
			
			}).show();
		}
		
		$(results).empty();
        if ($.browser.msie) {
			$(results).append('<iframe class="as_iframe" scrolling="no" frameborder="0"  ></iframe>');
		}
        $(results).append(message);
		$(results).css("height", "auto"); 
		$(".as_iframe").css("height","auto");
		//alert(resId);
		if($(results).height()>=dropdownHeight){
			$(results).css("height",dropdownHeight);
			$('#'+resId).css("overflow-y",'auto');
			$('#'+resId).css("overflow-x",'hidden');
			$(".as_iframe").css("height",dropdownHeight);
		}else{
			$(results).css("height", "auto"); 
			$(".as_iframe").css("height","auto");
			$('#'+resId).css("overflow-y",'hidden');
			$('#'+resId).css("overflow-x",'hidden');
		}
  };
	
  //Finding the test box position
  function findPos(obj) {	  
		var curleft = obj.offsetLeft || 0;
		var curtop = obj.offsetTop || 0;
		while (obj = obj.offsetParent) {
			curleft += obj.offsetLeft
			curtop += obj.offsetTop
		}
		return {x:curleft,y:curtop};
	}

   //This hides the results div after a delay
   function hideResultsAfterDelay(e,results, textelem, hiddenField, previousValue, hideOrUnhide) {
	  if(e.pageY || e.pageX){
		   var yNewPos = e.pageY;
		   var xNewPos = e.pageX;
		   var pos = findPos(results);
		   var xpos=pos.x;
		   var ypos=pos.y;
			if ((xNewPos <=xpos || xNewPos >=(xpos+$(results).width())) || (yNewPos <=ypos || yNewPos >=(ypos+$(results).height()))) {
				//timeout = setTimeout(function(){hideResults(results, textelem, hiddenField,previousValue, true);}, 500);
				hideResults(results, textelem, hiddenField,previousValue, true);
		
			}else{
			$(results).blur(function(e) {
					//timeout = setTimeout(function(){hideResults(results, textelem, hiddenField,previousValue, true);}, 500);
					if(!hideOrUnhide){
						hideResults(results, textelem, hiddenField,previousValue, true);
					}
			});}
			
	   }
	   else	if(!hideOrUnhide){
			 hideResults(results, textelem, hiddenField,previousValue, true);
			//timeout = setTimeout(function(){hideResults(results, textelem, hiddenField,previousValue, true);}, 500);
		}
	};

	


	
	//This hides the results div immediately
	function hideResults(results, textelem, hiddenField, previousValue,setToPrev ) {
		if ($(results).is(":visible")) {
			$(results).hide();
			if($(hiddenField).val()==""){
				$(textelem).val("");
			}
		}
		//Added to set the values to previous values if the user does not select any value
		if(setToPrev && $(previousValue).val()!=null && $.trim($(previousValue).val())!=""){
				var values=$(previousValue).val().split("___");
				$(textelem).val(values[0]);
				$(hiddenField).val(values[1]);
			
		}
	}

   //Populate the test box with value and hidden varialble with id of the selected option
	function selectItem(li,textelem,results, hiddenField, onValueSet, loadSpan, onValueChange, previousValue,ajaxFunctionName) {		
		var value = $.trim(li.innerHTML);
		var id=$.trim(li.id);
		$(results).html("");
		$(textelem).val(replaceEscapeSequence(value));		
		$(hiddenField).val(id);
		if(onValueSet){
			onValueSet();
		};
		//calling method on value change		
		if(onValueChange){
			eval(onValueChange);
		};
		//eval('ajax_getPerson()');
		var values=$(previousValue).val().split("___");
		/*if($(hiddenField).val()!=values[1] && $.trim(values[1])!=""){
			if(onValueChange){
				onValueChange();
			};
		}*/
		$(previousValue).val($(textelem).val()+"___"+$(hiddenField).val());
		
		hideResults(results, textelem, hiddenField, previousValue, false);
		$(loadSpan).empty();	
		
	};

	function replaceEscapeSequence(value){
		var returnString = value.replace(/\&amp;/g,'&');
		returnString = returnString.replace(/\&lt;/g, '<');
		returnString = returnString.replace(/\&gt;/g, '>');
		return returnString;
	}
	 
	    
	function checkKeyCode(e,results,textelem, hiddenField,onValueSet, loadSpan, onValueChange, previousValue,dropdownHeight,ajaxFunctionName){
		
		var keyCode=e.keyCode;		
		switch(keyCode) {
			case 38: // up
				onKeyUpAndDown(keyCode,results,dropdownHeight);
				return false;
			case 40: // down
				onKeyUpAndDown(keyCode,results,dropdownHeight);
				return false;
			case 37: // left
				return false;
			case 27: // esc
				hideResults(results, textelem, hiddenField,previousValue, true) 
				return false;
			case 39: // right
				return false;
			case 9: //tab
				return false;
			case 13: // return
				onEnter(results, textelem, hiddenField,onValueSet, loadSpan, onValueChange, previousValue,ajaxFunctionName);
				return false;
			case 18: // alt
				return false;
			case 20: // caps
				return false;
			case 33: // Page Up
				return false;
			case 34: // Page Down
				return false;
			case 35: //End
				return false;
			case 45: // insert
				return false;
			case 36: // home
				return false;
			case 16: // shift
				return false;
			case 17: // shift
				return false;
			default:
				return true;
		}
	}
var scrollHeight = 0;
function onKeyUpAndDown(keyCode,results,dropdownHeight){
		var selected=false;
		$('.as_ul',results).each(function(index){
			var lastIndex = $('.as_li',this).length;
			$('.as_li',this).each(function(i){
				if($(this).hasClass('as_over') && selected==false){
					selected=true;
					switch(keyCode) {
					case 38: // up
						{
							$('.as_li').removeClass("as_over");
							jQuery(this).prev().addClass('as_over');
							//Prevent the scroll from disappearing on click of up arrow, on the first row
							if(i == 0){
								jQuery(this).addClass('as_over');
							}
							//Find out the scroll height
							scrollHeight = jQuery(results).scrollTop();
							//Calculate the height of the prev li
							var jHeight = jQuery(this).prev().height();
							if(jHeight == null || jHeight == "undefined")
								jHeight = 0;
							//Subtract it from the actual scroll height
							jHeight = parseInt(scrollHeight) - parseInt(jHeight);
							//Set the scroll bar to the accurate height
							jQuery(results).scrollTop(jHeight);
							break;
						}
					case 40: // down
						{
							$('.as_li').removeClass("as_over");
							$(this).next().addClass('as_over');
							//Prevent the scroll from disappearing on click of down arrow, on the last row
							if(i == (lastIndex-1)){
								jQuery(this).addClass('as_over');
							}
							//Find out the scroll height
							scrollHeight = $(results).scrollTop();
							//Calculate the height of the next li
							var jHeight = $(this).next().height();
							if(jHeight == null || jHeight == "undefined")
								jHeight = 0;
							//Add it from the actual scroll height
							jHeight = parseInt(scrollHeight) + parseInt(jHeight);
							//Set the scroll bar to the accurate height
							$(results).scrollTop(jHeight);
							break;
						}
					}
				}
			});
		});
	}


	function onEnter(results, textelem, hiddenField, onValueSet, loadSpan, onValueChange, previousValue,ajaxFunctionName){		
		$('.as_ul',results).each(function(index){
			$('.as_li',this).each(function(i){
				if($(this).hasClass('as_over')){
						var li=this;						
						 selectItem(li,textelem,results, hiddenField, onValueSet, loadSpan, onValueChange, previousValue,ajaxFunctionName);
						
				}
			});
		});
		return false;
		
	}

  /* Main method:Creates space for load indicator,error message and hidden variable beside test box ,Creates results div and
  makes calls to other methods*/
  this.construct = function(settings, callbackOnSet, callbackOnReset) {
 		return this.each(function() {
			this.autoconfig = {};
			autoconfig = $.extend(this.autoconfig, $.autosuggest.defaults, settings);
			var textName=this.name;
			var textId=this.id;
			//Getting and setting names
			var elementName=autoconfig.elementName;
			if(elementName==null || elementName==''){
				elementName = textName+"_value";
			}
			

			var divId=elementName+"_div";
			var spanId=elementName+"_span";
			var prevVal=elementName+"_prev";
			var textBoxWidth=autoconfig.width;	
			var dropdownHeight = autoconfig.height;
			var fontSize=jQuery(this).css("font-size");
			var textElementValue=this.value;
			//alert(textElementValue);
			var hiddenFieldValue=document.getElementById(elementName)?document.getElementById(elementName).value:'';
			//Creating the autosuggest elements and setting default values			
			//jQuery(this).replaceWith('<input type=" text" name="'+textName+'" id="'+textId+'" class="as_autosuggest" autocomplete="off" style="width:'+textBoxWidth+';font-size:'+fontSize+'"><span id="'+spanId+'" class="as_count"></span><input type="hidden" value="" id="'+elementName+'" name="'+elementName+'"><input type="hidden" value="" id="'+prevVal+'" name="'+prevVal+'">');
			jQuery(this).replaceWith('<input type=" text" name="'+textName+'" id="'+textId+'" value="'+textElementValue+'" class="as_autosuggest" autocomplete="off" style="width:'+textBoxWidth+';font-size:'+fontSize+'"><span id="'+spanId+'" class="as_count"></span><input type="hidden" id="'+elementName+'" value="'+hiddenFieldValue+'" name="'+elementName+'"><input type="hidden" value="" id="'+prevVal+'" name="'+prevVal+'">');
			//jQuery(this).after('<span id="'+spanId+'"></span><input type="hidden" value="" id="'+elementName+'" name="'+elementName+'">');
			var textelem=document.getElementById(textId);
			//READONLY OR DISABLED
			if(autoconfig.disabled){
				$(textelem).attr("disabled",autoconfig.disabled); 
			}
			if(autoconfig.readonly){
				$(textelem).attr("readonly",autoconfig.readonly); 
			}
			var hiddenField=document.getElementById(elementName);
			var previousValue=document.getElementById(prevVal);
			var loadSpan=document.getElementById(spanId);
			var errorSpan=document.getElementById(spanId);

			//Setting the default values
			/*if(autoconfig.defaultId!=null && autoconfig.defaultId!='' && autoconfig.defaultValue!=null && autoconfig.defaultValue!=''){
				$(textelem).val(autoconfig.defaultValue);
				$(hiddenField).val(autoconfig.defaultId);
				$(previousValue).val(autoconfig.defaultValue+"___"+autoconfig.defaultId);
			}*/
			//Setting the input values
			var urlVal=autoconfig.url;
			var maxCount=autoconfig.maxCount;
			var onValueReset=autoconfig.onValueReset;
			var onValueSet=autoconfig.onValueSet;
			var onValueChange=autoconfig.onValueChange;
			var showIndicator=autoconfig.showIndicator;
			var showError=autoconfig.showError;
			var showCount=autoconfig.showCount;
			var minCharacters=autoconfig.minCharacters;
			var ajaxFunctionName=autoconfig.ajaxFunctionName;
			//alert("1:"+ajaxfunctionname);
			var config = {
				mouseDownOnSelect: false
			
			};
			
			
			//Only if the text box is readonly we need to add the results elements and call the methods
            if(!autoconfig.readonly){
				//Creating div to display results
				var resId = "resultsDiv_"+textId;
				var results = document.createElement("div");
				$results = $(results);
				$results.attr("id",resId);
				$results.hide().addClass("as_results").css("position", "absolute");
				$results.css("width", jQuery(textelem).css("width"));
				$("#"+elementName).after(results);
				
				//If application is net scape then no need to execute load auto suggest on key press. Key up will handle it. Else, the statement gets excecuted twice. 
				if ($.browser.msie) {
					//Calling the load method on keypress
					$('#'+textId).bind("keypress",function(e) {
						if(checkKeyCode(e,results,textelem,hiddenField,onValueSet, loadSpan, onValueChange, previousValue,dropdownHeight,ajaxFunctionName))
						 loadSuggestValues(textelem, results, loadSpan, errorSpan, hiddenField, urlVal, maxCount,onValueSet,onValueReset,showIndicator,showError,showCount,onValueChange, previousValue, dropdownHeight,minCharacters,false,resId,ajaxFunctionName);
						if(e.keyCode == 13)
							return false;						
					});
				}
				
				//Calling the load method on keyup				  		 
				$('#'+textId).bind("keyup",function(e) {
					if(checkKeyCode(e,results,textelem,hiddenField,onValueSet, loadSpan,onValueChange,dropdownHeight,ajaxFunctionName))
					loadSuggestValues(textelem, results, loadSpan, errorSpan, hiddenField, urlVal, maxCount,onValueSet,onValueReset,showIndicator,showError,showCount,onValueChange, previousValue, dropdownHeight,minCharacters,true,resId,ajaxFunctionName);
					if(e.keyCode == 13)
						return false;
				});
				//Hide results on blur
				$(document.getElementById(textId)).blur(function(e) {
					hideResultsAfterDelay(e,results, textelem, hiddenField,previousValue,config.mouseDownOnSelect);
					setTimeout(function(){$(loadSpan).empty();}, 300);			
				});
				$(results).mousedown(function() {
					//alert('mousedown config.mouseDownOnSelect'+config.mouseDownOnSelect);
					config.mouseDownOnSelect = true;
				});
				$(results).mouseup(function() {
					config.mouseDownOnSelect = false;
					$(document.getElementById(textId)).focus();
				});
				$(results).mouseout(function(e) {
					config.mouseDownOnSelect = false;
					$(document.getElementById(textId)).focus();
				});
			 }
		});
    };

   }
 });

 $.fn.extend({
       autosuggest: $.autosuggest.construct
 });
 
})(jQuery);