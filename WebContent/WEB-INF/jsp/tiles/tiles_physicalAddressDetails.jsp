<%@include file="/WEB-INF/jsp/tiles/include.jsp"%>
<%@ page pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
<title>Physical Address Details</title>
</head>
<body>
<%System.out.println("Entering tiles_physicalAddressDetails jsp"); %>
<form:form modelAttribute="physicalAddress"
		action="tiles_submitPhysicalAddress" method="POST" 
		id="tiles_physicaladdress_form">
	<div class="AddBoxTop">
		<div class="TableHeader">Address</div>
	</div>
	<div class="AddBoxMid">
		<!--AddBoxMid start-->
		<div class="InnerAddFormFieldContainer">
			<!--InnerAddFormFieldContainer start-->
			<div class="PersonLeftForm">
				<!--PersonLeftForm start-->
				<div id="personErrorDiv">
					<c:set var="errors"><form:errors path="*"/></c:set>
					<c:if test="${ not empty errors}">
						<form:errors path="*" cssClass="error"
							element="div" />
							<br>
					</c:if>
				</div>
				<div id="personMessageDiv" class="message">
					<c:if test="${ not empty messages}">
						<c:forEach items="${messages }" var="item">
							<c:out value="${item}"/><br>
						</c:forEach>
						<br>
					</c:if>
				</div>
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<!--<tr>
						<td align="left"><table width="100%" border="0"
								cellpadding="0" cellspacing="0">
								<tr>
									<td width="6%" align="left"><input name="ra2" type="radio"
										id="ra2" checked="checked" /></td>
									<td width="13%" align="left" class="NormalText">Physical</td>
								  	<td width="6%" align="left"><input type="radio" name="ra2"
										id="ra" /></td>
									<td width="75%" class="NormalText">Digital</td>
								
								</tr>
							</table></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>-->
					<tr>
						<td>
						<input type="text" 
									name="searchPhyAddrString" id="searchPhyAddrString"
									value='<c:out value="${searchPhyAddrString}"/>' maxlength="65"
									class="as_autosuggest"
									onclick="this.value='';" onfocus="this.select()"
									onblur="this.value=!this.value?'Search Address':this.value;" />
									
						<!-- <input name="textfield2" type="text" class="BEtextfield"
							id="textfield2" value="Search By Street 1"
							style="background-color: #FF9" onclick="this.value='';"
							onfocus="this.select()"
							onblur="this.value=!this.value?'Search By Street 1':this.value;" /> -->
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td class="LabelText">Street 1: <span class="mandatorySymbol"> *</span></td>
					</tr>
					<tr>
						<td>
						<form:input path="streetAddress" maxlength="255" readonly="${physicalAddress.isGALRecord}" cssClass="BEaddStreettextfield"/>
						<!-- <input name="textfield4" type="text"
							class="BEaddStreettextfield" id="textfield4" /> -->
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td class="LabelText">Street 2:</td>
					</tr>
					<tr>
						<td>
						<form:input path="address2" maxlength="255" readonly="${physicalAddress.isGALRecord}" cssClass="BEaddStreettextfield"/>
						<!-- <input name="textfield7" type="text"
							class="BEaddStreettextfield" id="textfield7" /> -->
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td class="LabelText">Street 3:</td>
					</tr>
					<tr>
						<td>
						<form:input path="address3" maxlength="255" readonly="${physicalAddress.isGALRecord}" cssClass="BEaddStreettextfield"/>
						<!-- <input name="textfield8" type="text"
							class="BEaddStreettextfield" id="textfield8" /> --></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td class="LabelText">City: <span class="mandatorySymbol"> *</span></td>
					</tr>
					<tr>
						<td>
						<form:input path="city" maxlength="255" readonly="${physicalAddress.isGALRecord}" cssClass="BEaddStreettextfield"/>
						<!-- <input name="textfield10" type="text"
							class="BEaddStreettextfield" id="textfield10" /> -->
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>
						<table width="100%" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td align="left"><span class="LabelText">Country:</span> <span class="mandatorySymbol"> *</span></td>
							<td align="left">&nbsp;</td>
							<td align="left"><span class="LabelText">Zip Code:</span> <span class="mandatorySymbol"> *</span></td>
						</tr>
						<tr>
							<td width="30%" align="left">
								<c:choose>
									<c:when test="${not empty physicalAddress.country && physicalAddress.country.id > 0}">
										<form:select path="country" items="${countries}"
											itemLabel="name" cssClass="PersonPN"/>
									</c:when>
									<c:otherwise>
										<select id="country" name="country" disabled="true"/>
									</c:otherwise>
								</c:choose>
							</td>
							<td width="6%" align="left" class="MailPhoneText">-&nbsp;</td>
							<td width="65%" align="left">
								<form:input path="postalCode" readonly="${physicalAddress.isGALRecord}" cssClass="PersonPN"/>
							</td>
						</tr>
						</table>
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td><table width="100%" border="0" cellpadding="0"
								cellspacing="0">
								<tr>
									<td class="stateAddressLabel" align="left"><span class="LabelText">State:</span> <span class="mandatorySymbol"> *</span></td>
									<!-- td align="left">&nbsp;</td>-->
									<td class="otherStateAddressLabel" align="left"><span class="LabelText">Foreign
											State or Province: </span></td>
								</tr>
								<tr>
									<td class="stateAddressBox" width="30%" align="left">
									
									<form:select id="stateAddressSelect" path="state" cssClass="PersonPN">
										<form:option value="0" label="" />
										<form:options items="${states}" itemLabel="name" />
									</form:select>
								</td>
									<!-- <td width="6%" align="center" class="NormalText">OR&nbsp;&nbsp;</td>-->
									<td class="otherStateAddressText" align="left">
									<form:input id="stateOtherId" path="stateOther" maxlength="50" readonly="${physicalAddress.isGALRecord}" cssClass="BEtextfield"/>
									<!-- <input name="textfield9"
										type="text" class="BEtextfield" id="textfield9" /> -->
									</td>
								</tr>
							</table></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>					
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>
							<div id="legendContainerM">
								<!--legendContainerM Start-->
								<fieldset>
									<legend class="legHeadH2">External References</legend>
									<div id="legenInnerContainer">
										<!--Inner legend Container Start-->
										<table id="externalRefsTable" width="100%" border="0" cellpadding="0" cellspacing="2">
											
							<c:if test="${not empty physicalAddress.crossReferences}">
							<c:forEach items="${physicalAddress.crossReferences}"
								var="crossReferences" varStatus="itrStatus">
								<tr>
								<td width="48%" align="left" valign="middle"
									class="MailPhoneText">
								<form:input id="crossRefUniqueCode${itrStatus.index}" maxlength="255" path="crossReferences[${itrStatus.index}].crossReferenceUniqueCode" cssClass="refTypeText"/>
								<form:hidden path="crossReferences[${itrStatus.index}].crossReferenceId" />
								</td>
								<td width="3%" align="left">&nbsp;</td>
								<td width="32%" align="left">
								<label>
									<form:select path="crossReferences[${itrStatus.index}].crossReferenceSystem"
													items="${crossReferenceSystems}" itemLabel="name" cssClass="refTypeSelect" />
								</label>
								</td>
								<td width="3%">&nbsp;</td>
								<td width="10%"><a href="javascript:void(0)">
												<img class="del" src="resources/images/IconMinus.jpg" border="0" />
												</a></td>
								</tr>
							</c:forEach>
							<tr>
								<td width="48%" align="left" valign="middle" class="MailPhoneText">
									<input id="crossRefUniqueCode<c:out value='${fn:length(physicalAddress.crossReferences)}'/>"
										name="crossReferences[<c:out value='${fn:length(physicalAddress.crossReferences)}'/>].crossReferenceUniqueCode" type="text"
										value="" class="refTypeText"/>
								</td>
								<td width="3%" align="left">&nbsp;</td>
								<td width="32%" align="left">
									<select id="crossReferences<c:out value='${fn:length(physicalAddress.crossReferences)}'/>.crossReferenceSystem" name="crossReferences[<c:out value='${fn:length(physicalAddress.crossReferences)}'/>].crossReferenceSystem" class="refTypeSelect">
										<c:forEach var="item" items="${crossReferenceSystems}">
											<option value="${item.id}">${item.name}</option>
										</c:forEach>
									</select>
								</td>
								<td width="3%">&nbsp;</td>
								<td width="10%"><a href="javascript:void(0)"><img class="add" src="resources/images/IconPlus.jpg" border="0"/></a></td>
							</tr>
						</c:if>
						<c:if test="${empty physicalAddress.crossReferences}">
						<tr>
							<td width="48%" align="left" valign="middle" class="MailPhoneText">
								<input id="crossRefUniqueCode0"
									name="crossReferences[0].crossReferenceUniqueCode" type="text"
									value="" class="refTypeText"/>
							</td>
							<td width="3%" align="left">&nbsp;</td>
							<td width="32%" align="left">
								<select id="crossReferences0.crossReferenceSystem" name="crossReferences[0].crossReferenceSystem" class="refTypeSelect">
										<c:forEach var="item" items="${crossReferenceSystems}">
											<option value="${item.id}">${item.name}</option>
										</c:forEach>
									</select>
							</td>
							<td width="3%">&nbsp;</td>
							<td width="10%"><a href="javascript:void(0)"><img class="add" src="resources/images/IconPlus.jpg" border="0"/></a></td>
						</tr>
						</c:if>
						</table>
						</div>
						<!--Inner legend Container End-->
						</fieldset>
						</div>
						<!--legendContainerM end-->
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td><table width="100%" border="0" cellpadding="0"
								cellspacing="0">
								<tr>
									<td width="42%" align="left">
									<c:choose>
										<c:when test="${physicalAddress.isGALRecord}">
											<a href="#modalBusEntyAddr" id="modalBusEntyAddrId" name="modal" class="disabled">
											<img id="assocBusAddrImg" src="resources/images/BtnLWBusinessDis.jpg" width="183" height="30" border="0" />
											</a>
										</c:when>
										<c:otherwise>										
											<a href="#modalBusEntyAddr" id="modalBusEntyAddrId" name="modal" >
											<img id="assocBusAddrImg" src="resources/images/BtnLWBusiness.jpg" width="183" height="30" border="0" />
											</a>
										</c:otherwise>
									</c:choose>
									</td>
									<td width="2%" align="left">&nbsp;</td>
									<td width="56%" align="left">
									<c:choose>
										<c:when test="${physicalAddress.isGALRecord}">
											<a href="#modalPersonAddr" id="modalPersonAddrId" name="modal" class="disabled"><img
											id="assocPersAddrImg" src="resources/images/BtnLWpersonDis.jpg" width="183" height="30"
											border="0" /></a>
										</c:when>
										<c:otherwise>										
											<a href="#modalPersonAddr" id="modalPersonAddrId" name="modal" ><img
											id="assocPersAddrImg" src="resources/images/BtnLWperson.jpg" width="183" height="30"
											border="0" /></a>
											</a>
										</c:otherwise>
									</c:choose>

									</td>
								</tr>
							</table></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td><table width="40%" border="0" cellpadding="0"
								cellspacing="0">
								<tr>
									<td width="25%" align="left"><a id="create_physicaladdress" name="create_physicaladdress" href="">
									<img src="resources/images/AddIcon.jpg" width="27" height="27" border="1" title="Create new Address"/></a></td>
									<c:if test="${physicalAddress.physicalAddressId gt 0 }">
										<td width="25%" align="left"><a id="update_physicaladdress" name="save_physicaladdress" href="#addressUpdateConfirmModal">
										<img src="resources/images/EditIcon.jpg" width="27" height="27" border="1" title="Update this Address"/></a></td>
											
									</c:if>
									<td width="25%" align="left"><a href="#addressDelConfirmModal" id="delete_physicaladdress"><img
											src="resources/images/DeleteIcon.jpg" width="27" height="27"
											border="1" title="Delete this Address"/></a></td>
									<td width="25%" align="left"><a href="tiles_newPhysicalAddress" id="physicaladdress_reset">
										<img src="resources/images/ResetIcon.jpg" width="27" height="27" border="1" title="Clear this Address pane" />
										</a></td>
									<td>&nbsp;</td>
								</tr>
							</table></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td height="234">&nbsp;</td>
					</tr>
					<tr>
						<td align="left">&nbsp;</td>
					</tr>
				</table>
			</div>
			<!--PersonLeftForm end-->
			<div class="ClearFloat"></div>
		</div>
		<!--InnerAddFormFieldContainer end-->

	</div>
	<!--AddBoxMid end-->
	<div class="AddBoxBot">
		<img src="resources/images/AddBoxBot.jpg" width="415" height="13" border="0" />
	</div>
	
	<form:hidden path="addressId" />
	<form:hidden path="physicalAddressId" />
	<form:hidden path="isGALRecord" />
	<form:hidden path="createdBy" />
	<form:hidden path="lastUpdatedBy" />
	<form:hidden path="lastUpdatedDateTime" />
	<form:hidden path="createdDateTime" />
	<input type="hidden" id="addressPersonRoleId" name="addressPersonRoleId" value="0"/>
	<input type="hidden" id="addressBERoleId" name="addressBERoleId" value="0"/>	
	
	
	<div id="addressConfirmboxes">	
		<%@include file="/WEB-INF/jsp/AddressDeleteConfirmBox.jsp"%>
		<%@include file="/WEB-INF/jsp/AddressUpdateConfirmBox.jsp"%>		
	</div>	
	</form:form>
	<div id="boxes">
		<%@include file="/WEB-INF/jsp/PersonAddressAssocUpdateConfirmBox.jsp"%>
		<%@include file="/WEB-INF/jsp/BEAddressAssocUpdateConfirmBox.jsp"%>
	   	<%@include file="/WEB-INF/jsp/BEAddressAssocDeleteConfirmBox.jsp"%>
	    <%@include file="/WEB-INF/jsp/BEPersonAssocDeleteConfirmBox.jsp"%>
	    <%@include file="/WEB-INF/jsp/PersonAddressAssocDeleteConfirmBox.jsp"%>
	</div>
		<a id="fakePhysicalAddressLink" href='#'></a>
		<a id="fakePersonAddressLink" href='#'></a>
		<a id="fakeBEAddressLink" href='#'></a>
		<a id="save_be_address_roles" href='#'></a>
		<a id="fakeBEPersonAssocDeleteLink" href='#'></a>
		<a id="fakeAddressDeleteLink" href='#'></a>
		<a id="fakeAddressUpdateLink" href='#'></a>
		<a id="fakeBEAddressAssocDeleteLink" href='#'></a>
		<a id="fakePersonAddressAssocDeleteLink" href='#'></a>
		<a id="fakePersonAddressAssocUpdateLink" href='#'></a>
		
</body>

<script type="text/javascript">
		
	jQuery(document).ready(function() {
			//var selectedValue = '<c:out value="${searchPhyAddrString}"/>';
			//var selectedId = '<c:out value="${selectedPhysicalAddressId}"/>';
			var url = './ajax_findPhysicalAddress?dummy=dummy';
			fnDisableAssocBELinks();
			fnDisableAssocPersonLinks();
			populatePersonAddressRole();
			populateBEAddressRole();
			fnShowStates();
			jQuery("#searchPhyAddrString").autosuggest({
			url : url,
			elementName : 'selectedPhysicalAddressId',
			//defaultId : selectedId,
			width : '300px',
			height : 225,
			//defaultValue : selectedValue,
			onValueChange : 'ajax_getPhysicalAddress()',
			minCharacters : 2
		});
			
			
			
			$('#confirmBEPersonAssocDelete').click(function (e) {
				var commentsToDeleteBEPerson = $('#commentsToDeleteBEPerson').val();
				commentsToDeleteBEPerson = $.trim(commentsToDeleteBEPerson);
				if(commentsToDeleteBEPerson == ''){
					$("#deleteBEPersonCommentsErrorMessage").css('visibility', 'visible');
					return false;
				}else{
					$("#deleteBEPersonCommentsErrorMessage").css('visibility', 'hidden');	
				}
						
				var formAction = "tiles_deleteContact";
				$("#deleteBEPersonRoleForm").attr("action", formAction);
				
				if (document.createEventObject) {
					// dispatch for IE    	
					return document.getElementById("fakeBEPersonAssocDeleteLink") 
							.fireEvent('onclick');
				} else {
					// dispatch for firefox + others
					var evt = document.createEvent("HTMLEvents");
					evt.initEvent('click', true, true); // event type,bubbling,cancelable
					return !document.getElementById("fakeBEPersonAssocDeleteLink")
							.dispatchEvent(evt);
				}
				document.getElementById("fakeBEPersonAssocDeleteLink").onClick(); 
			});	
			
			
			Spring.addDecoration(new Spring.AjaxEventDecoration({
				elementId : "fakeBEPersonAssocDeleteLink",
				formId : "deleteBEPersonRoleForm",
				event : "onclick",
				params : {
					fragments : "businessEntity",
					operation : "deleteBEPerson"
				}
			}));
			
			Spring.addDecoration(new Spring.AjaxEventDecoration({
				elementId : "fakeAddressUpdateLink",
				formId : "tiles_physicaladdress_form",
				event : "onclick",
				params : {
					fragments : "physicalAddress",
					operation : "savePhysicalAddress"
				}
			}));
			
			
			$('#save_physicaladdress').click(function (e) {
				
				var commentsToupdate = $.trim($('#commentsToUpdateAddress').val());
				if(commentsToupdate == ''){
					$("#updateAddressCommentsErrorMessage").css('visibility', 'visible');
					return false;
				}else{
					$("#updateAddressCommentsErrorMessage").css('visibility', 'hidden');	
				}
					
				var formAction = "tiles_submitPhysicalAddress";
				$("#tiles_physicaladdress_form").attr("action", formAction);
				
				if (document.createEventObject) {
					// dispatch for IE    	
					return document.getElementById("fakeAddressUpdateLink") 
							.fireEvent('onclick');
				} else {
					// dispatch for firefox + others
					var evt = document.createEvent("HTMLEvents");
					evt.initEvent('click', true, true); // event type,bubbling,cancelable
					return !document.getElementById("fakeAddressUpdateLink")
							.dispatchEvent(evt);
				}
				document.getElementById("fakeAddressUpdateLink").onClick(); 
			});	
			
			
			
			Spring.addDecoration(new Spring.AjaxEventDecoration({
				elementId : "fakePersonAddressAssocDeleteLink",
				formId : "deletePersonAddressRoleForm",
				event : "onclick",
				params : {
					fragments : "person",
					operation : "deletePersonAddress"
				}
			}));
			
			
			$('#confirmPersonAddressAssocDelete').click(function (e) {
				
				var commentsToDeletePersonAddress = $.trim($('#commentsToDeletePersonAddress').val());
				if(commentsToDeletePersonAddress == ''){
					$("#deletePersonAddressCommentsErrorMessage").css('visibility', 'visible');
					return false;
				}else{
					$("#deletePersonAddressCommentsErrorMessage").css('visibility', 'hidden');	
				}
					
				var formAction = "tiles_deletePartyAddress";
				$("#deletePersonAddressRoleForm").attr("action", formAction);
				
				if (document.createEventObject) {
					// dispatch for IE    	
					return document.getElementById("fakePersonAddressAssocDeleteLink") 
							.fireEvent('onclick');
				} else {
					// dispatch for firefox + others
					var evt = document.createEvent("HTMLEvents");
					evt.initEvent('click', true, true); // event type,bubbling,cancelable
					return !document.getElementById("fakePersonAddressAssocDeleteLink")
							.dispatchEvent(evt);
				}
				document.getElementById("fakePersonAddressAssocDeleteLink").onClick(); 
			});	
			
			
			
		$('#externalRefsTable').delegate('.add', 'click', function(e) {
				var rowCount = $('#externalRefsTable tr').length;
				var checkRow = rowCount-1;
				if($("#crossRefUniqueCode"+checkRow).val() != "")
				{
					$(this).attr('src','resources/images/IconMinus.jpg');
					$(this).attr('class','del');
		 			var newRow = '<tr><td width="48%" align="left" valign="middle" class="MailPhoneText">'
		 			+'<input id="crossRefUniqueCode'+rowCount+'" name="crossReferences['+rowCount+'].crossReferenceUniqueCode" type="text"'
		 			+'value="" class="refTypeText"/></td>'
		 			+'<td width="3%" align="left">&nbsp;</td>'
		 			+'<td width="32%" align="left">'
		 			+'<select id="crossReferences'+rowCount+'.crossReferenceSystem" name="crossReferences['+rowCount+'].crossReferenceSystem" class="refTypeSelect">'
					+' <c:forEach var="item" items="${crossReferenceSystems}">'
					+'<option value="${item.id}">${item.name}</option>'
					+' </c:forEach>'
					+'</select>'
					+'</td>'
		 			+'<td width="3%">&nbsp;</td>'
		 			+'<td width="10%"><a href="javascript:void(0)"><img class="add" src="resources/images/IconPlus.jpg" border="0"/></a>'
		 			+'</td></tr>';
					$("#externalRefsTable").append(newRow);
				}
			});
		
		$('#externalRefsTable').delegate('.del', 'click', function(e) {
				$(this).closest("tr").remove();
			});
			
			//select all the a tag with name equal to modal
				//select all the a tag with name equal to modal
		$('#modalBusEntyAddrId').click(function(e) {
			//Cancel the link behavior
			
			if($('#modalBusEntyAddrId').attr("class") == "enabled"){
				
				$('.addressRoles_checkBoxs').attr('checked',false);
				$("#payeeNumberBased").css('visibility', 'hidden');
				$('#save_be_address_role').hide();
				$('#commentsForBEAddress').hide();
				$('#assoc_addr_businessentity').show();
				//$("#addressBERoles")[0].selectedIndex = 0;
				
				e.preventDefault();
				//Get the A tag
				var id = '#modalBusEntyAddr';
			
				//Get the screen height and width
				var maskHeight = $(document).height();
				var maskWidth = $(window).width();
			
				//Set heigth and width to mask to fill up the whole screen
				$('#mask').css({'width':maskWidth,'height':maskHeight});
				
				//transition effect		
				$('#mask').fadeIn(100);	
				$('#mask').fadeTo("slow",0.8);	
			
				//Get the window height and width
				var winH = $(window).height();
				var winW = $(window).width();
		              
				//Set the popup window to center
				$(id).css('top',  winH/2-$(id).height()/2);
				$(id).css('left', winW/2-$(id).width()/2);
			
				//transition effect
				$(id).fadeIn(200); 
			}
		});
		
		$('#modalPersonAddrId').click(function(e) {
			
			if($('#modalPersonAddrId').attr("class") == "enabled"){
				
				$('#save_person_address_role').hide();
				$('#commentsToUpdateForPerAddressAssoc').hide();
				$('#commentsToUpdateForPerAddressAssocTextArea').hide();
				$("#updatePersonAddressCommentsErrorMessage").css('visibility', 'hidden');	
				$('#associate_address_person').show();
				$("#addressPersonRoles")[0].selectedIndex = 0;
			
				//Cancel the link behavior
				e.preventDefault();
				//Get the A tag
				var id = '#modalPersonAddr';
			
				//Get the screen height and width
				var maskHeight = $(document).height();
				var maskWidth = $(window).width();
			
				//Set heigth and width to mask to fill up the whole screen
				$('#mask').css({'width':maskWidth,'height':maskHeight});
				
				//transition effect		
				$('#mask').fadeIn(100);	
				$('#mask').fadeTo("slow",0.8);	
			
				//Get the window height and width
				var winH = $(window).height();
				var winW = $(window).width();
		              
				//Set the popup window to center
				$(id).css('top',  winH/2-$(id).height()/2);
				$(id).css('left', winW/2-$(id).width()/2);
			
				//transition effect
				$(id).fadeIn(200); 
			}	
		
		});


	//if close button is clicked
	$('.window .close').click(function (e) {
		//Cancel the link behavior
		e.preventDefault();
		$('#mask').hide();
		$('.window').hide();
	});		
			
	//if mask is clicked
		$('#mask').click(function () {
		$(this).hide();
		$('.window').hide();
	});
			
	$('#country').change(function(e) {
		fnShowStates();
	});
			
	 $('#mask').hide();
	$('.window').hide();
	closeMenuPopups();

	});			
		Spring.addDecoration(new Spring.AjaxEventDecoration({
			elementId : "fakePersonAddressLink",
			formId : "tiles_physicaladdress_form",
			event : "onclick",
			params : {
				fragments : "physicalAddress,person",
				operation : "assoicateAddressToParty"

			}
		}));
		
		Spring.addDecoration(new Spring.AjaxEventDecoration({
			elementId : "fakeBEAddressLink",
			formId : "tiles_physicaladdress_form",
			event : "onclick",
			params : {
				fragments : "physicalAddress,businessEntity",
				operation : "assoicateAddressToBE"
			}
		}));

		Spring.addDecoration(new Spring.AjaxEventDecoration({
			elementId : "create_physicaladdress",
			formId : "tiles_physicaladdress_form",
			event : "onclick",
			params : {
				fragments : "physicalAddress",
				operation : "createPhysicalAddress"
			}
		}));
		
		
		Spring.addDecoration(new Spring.AjaxEventDecoration({
			elementId : "fakeAddressDeleteLink",
			formId : "tiles_physicaladdress_form",
			event : "onclick",
			params : {
				fragments : "physicalAddress",
				operation : "deletePhysicalAddress"
			}
		}));
		
		$('#confirmAddressDelete').click(function (e) {
			
			var commentsToDelete = $.trim($('#commentsToDeleteAddress').val());
			if(commentsToDelete == ''){
				$("#deleteAddressCommentsErrorMessage").css('visibility', 'visible');
				return false;
			}else{
				$("#deleteAddressCommentsErrorMessage").css('visibility', 'hidden');	
			}
				
			var formAction = "tiles_submitPhysicalAddress";
			$("#tiles_physicaladdress_form").attr("action", formAction);
			
			if (document.createEventObject) {
				// dispatch for IE    	
				return document.getElementById("fakeAddressDeleteLink") 
						.fireEvent('onclick');
			} else {
				// dispatch for firefox + others
				var evt = document.createEvent("HTMLEvents");
				evt.initEvent('click', true, true); // event type,bubbling,cancelable
				return !document.getElementById("fakeAddressDeleteLink")
						.dispatchEvent(evt);
			}
			document.getElementById("fakeAddressDeleteLink").onClick(); 
		});	
		
		
		Spring.addDecoration(new Spring.AjaxEventDecoration({
			elementId : "fakeBEAddressAssocDeleteLink",
			formId : "deleteBEAddressRoleForm",
			event : "onclick",
			params : {
				fragments : "businessEntity",
				operation : "deleteBEAddress"
			}
		}));
		
		$('#confirmBusinessAddrAssocDelete').click(function (e) {
			var commentsToDeleteBEAddress = $.trim($('#commentsToDeleteBEAddress').val());
			if(commentsToDeleteBEAddress == ''){
				$("#deleteBEAddressCommentsErrorMessage").css('visibility', 'visible');
				return false;
			}else{
				$("#deleteBEAddressCommentsErrorMessage").css('visibility', 'hidden');	
			}
					
			var formAction = "tiles_deletePartyAddress";
			$("#deleteBEAddressRoleForm").attr("action", formAction);
			
			if (document.createEventObject) {
				// dispatch for IE    	
				return document.getElementById("fakeBEAddressAssocDeleteLink") 
						.fireEvent('onclick');
			} else {
				// dispatch for firefox + others
				var evt = document.createEvent("HTMLEvents");
				evt.initEvent('click', true, true); // event type,bubbling,cancelable
				return !document.getElementById("fakeBEAddressAssocDeleteLink")
						.dispatchEvent(evt);
			}
			document.getElementById("fakeBEAddressAssocDeleteLink").onClick(); 
		});	
		
		
		Spring.addDecoration(new Spring.AjaxEventDecoration({
			elementId : "fakePersonAddressAssocUpdateLink",
			formId : "editPersPartyAddressRoleForm",
			event : "onclick",
			params : {
				fragments : "person",
				operation : "editPersonAddress"
			}
		}));
		
		$('#save_person_address_role').click(function (e) {
			var commentsToEdit = $.trim($('#commentsTOUpdatePersonAddressAssoc').val());
			if(commentsToEdit == ''){
				$("#updatePersonAddressCommentsErrorMessage").css('visibility', 'visible');
				return false;
			}else{
				$("#updatePersonAddressCommentsErrorMessage").css('visibility', 'hidden');	
			}
					
			var formAction = "tiles_updatePartyAddress";
			$("#editPersPartyAddressRoleForm").attr("action", formAction);
			
			if (document.createEventObject) {
				// dispatch for IE    	
				return document.getElementById("fakePersonAddressAssocUpdateLink") 
						.fireEvent('onclick');
			} else {
				// dispatch for firefox + others
				var evt = document.createEvent("HTMLEvents");
				evt.initEvent('click', true, true); // event type,bubbling,cancelable
				return !document.getElementById("fakePersonAddressAssocUpdateLink")
						.dispatchEvent(evt);
			}
			document.getElementById("fakePersonAddressAssocUpdateLink").onClick(); 
		});
		
		
		Spring.addDecoration(new Spring.AjaxEventDecoration({
			elementId : "save_be_address_roles",
			formId : "editBEPartyAddressRoleForm",
			event : "onclick",
			params : {
				fragments : "businessEntity",
				operation : "editBEAddress"
			}
		}));

		function ajax_getPhysicalAddress() {
			var currDate = new Date();
			document.getElementById("fakePhysicalAddressLink").href = "tiles_getPhysicalAddress?physicalAddressId="
				+ $('#selectedPhysicalAddressId').val()
				+ "&searchString="
				+ encodeURIComponent($('#searchPhyAddrString').val())
				+ "&currDate="
				+ currDate.toString();
			if (document.createEventObject) {
				// dispatch for IE    	
				return document.getElementById("fakePhysicalAddressLink")
						.fireEvent('onclick');
			} else {
				// dispatch for firefox + others
				var evt = document.createEvent("HTMLEvents");
				evt.initEvent('click', true, true); // event type,bubbling,cancelable
				return !document.getElementById("fakePhysicalAddressLink")
						.dispatchEvent(evt);
			}
			document.getElementById("fakePhysicalAddressLink").onClick();
		}

		Spring.addDecoration(new Spring.AjaxEventDecoration({
			elementId : "fakePhysicalAddressLink",
			event : "onclick",
			params : {
				fragments : "physicalAddress"
			}
		}));

		Spring.addDecoration(new Spring.AjaxEventDecoration({
			elementId : "physicaladdress_reset",
			event : "onclick",
			params : {
				fragments : "physicalAddress"
			}
		}));
		
		function populatePersonAddressRole(){
			
			var e = document.getElementById("addressPersonRoles");
			var addressRoleId = e.options[e.selectedIndex].value;
			document.getElementById("addressPersonRoleId").value = e.options[e.selectedIndex].value;
		}
		
		function populateBEAddressRole(){
			
			/* var e = document.getElementById("addressBERoles");
			var addressRoleId = e.options[e.selectedIndex].value;
			document.getElementById("addressBERoleId").value = e.options[e.selectedIndex].value;  */
			
			var roles = $(".addressRoles_checkBoxs:checked");
			var addressRoles='';
			var defaultRole='';
			var isDefaultRole = false;
			
			for (var i =0; i < roles.length; i++)
			{
				if(roles[i].value != 7)
				{
					addressRoles = addressRoles.concat(roles[i].value);
					addressRoles = addressRoles.concat("A");
				}
				else
				{
					isDefaultRole = true;
					defaultRole = defaultRole.concat(roles[i].value);
					//defaultRole = defaultRole.concat("A");
				}
			}
			if(isDefaultRole)
			{
				document.getElementById("addressBERoleId").value = defaultRole;
				document.getElementById("editAddressRolesId").value = defaultRole;
			}
			else
			{
				document.getElementById("addressBERoleId").value = addressRoles;
				document.getElementById("editAddressRolesId").value = addressRoles;
			}
			
		}
		
		function populateBEAddressRole_Edit(){
			/* var e = document.getElementById("addressBERoles");
			var addressRoleId = e.options[e.selectedIndex].value;
			document.getElementById("addressBERoleId").value = e.options[e.selectedIndex].value;  */
			//alert(' enter populateBEAddressRole');
			var roles = $(".addressRoles_checkBoxs:checked");
			var addressRoles='';
			var defaultRole='';
			var isDefaultRole = false;
			for (var i =0; i < roles.length; i++){
				if(roles[i].value != 7){
					addressRoles = addressRoles.concat(roles[i].value);
					//addressRoles = addressRoles.concat("A");
				}
				else{
					isDefaultRole = true;
					defaultRole = defaultRole.concat(roles[i].value);
					//defaultRole = defaultRole.concat("A");
				}
			}
			if(isDefaultRole){	
				document.getElementById("editAddressRolesId").value = defaultRole;
			}
			else{
				document.getElementById("editAddressRolesId").value = addressRoles;
			}
			//alert(' exit populateBEAddressRole');
			
			var formAction = "tiles_updatePartyAddress";
			$("#editBEPartyAddressRoleForm").attr("action", formAction);
			
			if (document.createEventObject) {
				// dispatch for IE    	
				return document.getElementById("save_be_address_roles") 
						.fireEvent('onclick');
			} else {
				// dispatch for firefox + others
				var evt = document.createEvent("HTMLEvents");
				evt.initEvent('click', true, true); // event type,bubbling,cancelable
				return !document.getElementById("save_be_address_roles")
						.dispatchEvent(evt);
			}
			document.getElementById("save_be_address_roles").onClick();
		}
		
		function populateAddressRoleOnLoad(val)
		{	
			
			$("#addressRoleErrorMessage").css('visibility', 'hidden');
			$('.addressRoles_checkBoxs').attr('checked',false);
			
			if(val == 7)
			{
				$('.addressRoles_checkBoxs').attr('disabled',true);
				$('.addressRoles_checkBoxs').attr('checked',true);
				$('#'+val).attr('disabled',false);
			}
			else
			{
				$('#'+val).attr('checked',true);
			}
			
			if(val == 7 || val == 2)
				{
					//jQuery(".payeeNumberBased").show();
					jQuery("#payeeNumberBased").css('visibility', 'visible');
					
				}
			
		}
		function validateAddressRoles(element,val)
		{	
			if(val == 7)
			{
				if($('#'+val).is(':checked'))
					{
						$('.addressRoles_checkBoxs').attr('disabled',true);
						$('.addressRoles_checkBoxs').attr('checked',true);
						$('#'+val).attr('disabled',false);
						//$('#'+val).attr('checked',true);
					}
				else
					{
						$('.addressRoles_checkBoxs').attr('disabled',false);
						$('.addressRoles_checkBoxs').attr('checked',false);
					}
				
			}
			hideUnhidePayeeNo(element,val);
		}
		
				
		function hideUnhidePayeeNo(element, val){
			if(val == 7 || val == 2){
				if(element.checked){
					//jQuery(".payeeNumberBased").show();
					jQuery("#payeeNumberBased").css('visibility', 'visible');
				}else{
					//jQuery(".payeeNumberBased").hide();
					jQuery("#payeeNumberBased").css('visibility', 'hidden');
				}
			}
		}
		
		
		function fnShowStates(){
			if($("#country option:selected").text() == "United States"){
				$('.stateAddressLabel').show();
				$('.stateAddressBox').show();
				$('.otherStateAddressText').hide();
				$('.otherStateAddressLabel').hide();
				$('#stateAddressSelect').attr('disabled', false);
				$('#stateOtherId').attr('disabled', true);
			}else{
				$('.otherStateAddressText').show();
				$('.otherStateAddressLabel').show();
				$('.stateAddressLabel').hide();
				$('.stateAddressBox').hide();
				$('#stateAddressSelect').attr('disabled', true);
				$('#stateOtherId').attr('disabled', false);
			}
		}
		
		function linkPersonAddress() {
			
			var personId = $('#personId').val();
			var formAction = "tiles_submitPhysicalAddress?personId="+personId;
			$("#tiles_physicaladdress_form").attr("action", formAction);
			if (document.createEventObject) {
				// dispatch for IE    	
				return document.getElementById("fakePersonAddressLink") 
						.fireEvent('onclick');
			} else {
				// dispatch for firefox + others
				var evt = document.createEvent("HTMLEvents");
				evt.initEvent('click', true, true); // event type,bubbling,cancelable
				return !document.getElementById("fakePersonAddressLink")
						.dispatchEvent(evt);
			}
			document.getElementById("fakePersonAddressLink").onClick();
		}
		
		
		function validateForDefaultAddress() {
			
			var roles = $(".addressRoles_checkBoxs:checked");
			var businessEntityId = $('#businessEntityId').val();
			var physicalAddressId= $('#physicalAddressId').val();
			
			if(roles.length == 0)
				{
					$("#addressRoleErrorMessage").css('visibility', 'visible');
					return false;
				}
			else
				{
					$("#addressRoleErrorMessage").css('visibility', 'hidden');
				}
			var partyAddressId = '0';
			var flag = false;
			for (var i =0; i < roles.length; i++)
			{
				if(roles[i].value == 7)
				{
					flag = true;
				}
			}
			
			if(flag){
				jQuery.ajax({
					  type: "POST",
					  url: 'tiles_validateForDefaultAddress',
					  data: { businessEntityID: businessEntityId ,addressID: physicalAddressId,partyAddressID:partyAddressId},
					  success: function(data) {
					    //$('.result').html(data);
					    
					    if(data)
					    	{
					    		var answer = confirm("A different address is set as the default address for this business entity. You can remove that address's default designation, or select a non-default role for the current selection.");
					    		if(answer)
					    			{
					    				linkBEAddress();
					    			}
					    	}
					    else
					    	{
					    		linkBEAddress();
					    	}
					  }
					});
			}
			else
			{
				linkBEAddress();
			}
		}
		
	function validateForDefaultAddress_Edit() {
			
			var roles = $(".addressRoles_checkBoxs:checked");
			var businessEntityId = $('#businessEntityId').val();
			var physicalAddressId= '0';
			
			if(roles.length == 0)
			{
				$("#addressRoleErrorMessage").css('visibility', 'visible');
				return false;
			}
			else
			{
				$("#addressRoleErrorMessage").css('visibility', 'hidden');	
			}
			//validation for comments
			if($('#commentsForBEAddressAssoc').val() == ''){
				$("#addressRoleCommentsErrorMessage").css('visibility', 'visible');
				return false;
			}else{
				$("#addressRoleCommentsErrorMessage").css('visibility', 'hidden');	
			}
			var partyAddressId = $('#editBEPartyAddressId').val();
			var flag = false;
			for (var i =0; i < roles.length; i++)
			{
				if(roles[i].value == 7)
				{
					flag = true;
				}
			}
					
					if(flag)
						{
							jQuery.ajax({
		  						  type: "POST",
								  url: 'tiles_validateForDefaultAddress',
								  data: { businessEntityID: businessEntityId ,addressID: physicalAddressId,partyAddressID:partyAddressId},
								  success: function(data) {
								    //$('.result').html(data);
								    
								    if(data)
								    	{
								    		var answer = confirm("Business Entity can have only one Default Address do you want to replace the OLD one?");
								    		if(answer)
								    			{
								    				populateBEAddressRole_Edit();
								    			}
								    	}
								     else
								    	{
								    		populateBEAddressRole_Edit();
								    	} 
								  }
								});
						}
					else
						{
							populateBEAddressRole_Edit();
						}
				}
		
		function linkBEAddress() {
			populateBEAddressRole();
			var businessEntityId = $('#businessEntityId').val();
			var sapPayeeNo = $(".sapPayeeNo").val();
			//alert(sapPayeeNo);
			var formAction = "tiles_submitPhysicalAddress?businessEntityId="+businessEntityId+"&sapPayeeNo="+encodeURIComponent(sapPayeeNo);
			//alert("formAction-->"+formAction);
			$("#tiles_physicaladdress_form").attr("action", formAction);
			if (document.createEventObject) {
				// dispatch for IE    	
				return document.getElementById("fakeBEAddressLink")
						.fireEvent('onclick');
			} else {
				// dispatch for firefox + others
				var evt = document.createEvent("HTMLEvents");
				evt.initEvent('click', true, true); // event type,bubbling,cancelable
				return !document.getElementById("fakeBEAddressLink")
						.dispatchEvent(evt);
			}
			document.getElementById("fakeBEAddressLink").onClick();
			
		}
		
		$('#delete_physicaladdress').click(function(e) {

			if($('#physicalAddressId').val()!='0'){
				//Cancel the link behavior
				e.preventDefault();
				//Get the A tag
				var id = '#addressDelConfirmModal';
			
				//Get the screen height and width
				var maskHeight = $(document).height();
				var maskWidth = $(window).width();
			
				//Set heigth and width to mask to fill up the whole screen
				$('#mask').css({'width':maskWidth,'height':maskHeight});
				
				//transition effect		
				$('#mask').fadeIn(100);	
				$('#mask').fadeTo("slow",0.8);	
			
				//Get the window height and width
				var winH = $(window).height();
				var winW = $(window).width();
		              
				//Set the popup window to center
				$(id).css('top',  winH/2-$(id).height()/2);
				$(id).css('left', winW/2-$(id).width()/2);
			
				//transition effect
				$(id).fadeIn(100);
			}
		});
		
		$('#update_physicaladdress').click(function(e) {

			if($('#physicalAddressId').val()!='0'){
				//Cancel the link behavior
				e.preventDefault();
				//Get the A tag
				var id = '#addressUpdateConfirmModal';
			
				//Get the screen height and width
				var maskHeight = $(document).height();
				var maskWidth = $(window).width();
			
				//Set heigth and width to mask to fill up the whole screen
				$('#mask').css({'width':maskWidth,'height':maskHeight});
				
				//transition effect		
				$('#mask').fadeIn(100);	
				$('#mask').fadeTo("slow",0.8);	
			
				//Get the window height and width
				var winH = $(window).height();
				var winW = $(window).width();
		              
				//Set the popup window to center
				$(id).css('top',  winH/2-$(id).height()/2);
				$(id).css('left', winW/2-$(id).width()/2);
			
				//transition effect
				$(id).fadeIn(100);
			}
		});

		$('#cancelAddressDelete').click(function (e) {
			//Cancel the link behavior
			e.preventDefault();
			
			$('#mask').hide();
			$('.window').hide();
		});	
		
		$('#cancelAddressUpdate').click(function (e) {
			//Cancel the link behavior
			e.preventDefault();
			
			$('#mask').hide();
			$('.window').hide();
		});	
		
		$('#cancelBEAddressDelete').click(function (e) {
			//Cancel the link behavior
			e.preventDefault();
			
			$('#mask').hide();
			$('.window').hide();
		});	
		
		$('#cancelBEPersonDelete').click(function (e) {
			//Cancel the link behavior
			e.preventDefault();
			
			$('#mask').hide();
			$('.window').hide();
		});
		
		$('#cancelPersonAddressDelete').click(function (e) {
			//Cancel the link behavior
			e.preventDefault();
			
			$('#mask').hide();
			$('.window').hide();
		});
		
		
		
	</script>
	<%System.out.println("Exiting tiles_physicalAddressDetails jsp"); %>
</html>
