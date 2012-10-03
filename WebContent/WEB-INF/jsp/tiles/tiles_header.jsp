<%@include file="/WEB-INF/jsp/tiles/include.jsp"%>

<html>

<body>
	<div class="TopLogoTitleContainer">
		<!--TopLogoTitleContainer start-->
		<div class="TopLeftLogo">
			<img src="resources/images/NBCUlogo.jpg" border="0" />
		</div>
		<div class="ClearFloat"></div>
	</div>
	<!--TopLogoTitleContainer end-->
	<div class="TopLoginContainer">
		<!--TopLoginContainer start-->		
			<div class="Logout">
				<a href="<c:url value="logout"/>" class="LogLink">Logout</a>
			</div>		
	</div>
	<!--TopLoginContainer end-->
	<div class="ClearFloat"></div>
	<div id="mask"></div>
</body>
<script type="text/javascript">
	jQuery(document).ready(function() {
		dojo.connect(Spring.RemotingHandler.prototype, 'handleResponse', null, 'handlingResponse');
		dojo.connect(Spring.RemotingHandler.prototype, 'handleError', null, 'handlingError');
	});
function handlingResponse(data){
		/* var temp = data.indexOf('exception_div');
		var temp_302 = null//dojo.query("302",data);
		alert ('Contains Exception === > '+ temp + ' -- Contains 302 ===> '+temp_302);
		console.log(data);
		if(temp!=null){
			alert('dojo.query(exception_div,data)');
			top.location="/addressbook-services/WEB-INF/jsp/error.jsp";
		}else{
			alert ('no exception ');
		} */
		//alert('inside handlingResponse : '+data);
		var strData = data.toString();
		//alert('strData.indexOf(exception_div)' + strData.indexOf('exception_div'));
		if(strData.indexOf('tag_exception')>=0){
			//alert('Exception Occured - ${pageContext.request.contextPath}');
			window.location.href="${pageContext.request.contextPath}/WEB-INF/jsp/error.jsp";
		}else {
			var redirectToLogin = false; 
			//status:403 : received authorization exception, status:302 : received URL moved to different location , status:0 invalid status 
			redirectToLogin = strData.indexOf('status:403')>=0||strData.indexOf('status:302')>=0||strData.indexOf('status:0')>=0;
			if(!redirectToLogin){
				redirectToLogin = strData.indexOf('document.AUTOSUBMIT.submit()')>=0 || strData.indexOf('SMPostPreserve')>=0;
			}
			if(redirectToLogin){
				//alert('inside strData.indexOf 403, 302, 0');
				//alert(strData.indexOf('status:403') +strData.indexOf('status:302')+ strData.indexOf('status:0') );
				window.location.href="${pageContext.request.contextPath}";
			}
		}
	}
	
	function handlingError(data){
		//alert('inside handlingError - '+data);
		//var temp = dojo.query("#exception_div",data);
		//var temp_302 = null;//dojo.query("302",data);
		//alert ('Contains Exception === > '+ temp + ' -- Contains 302 ===> '+temp_302);
		//console.log(data);
		var strData = data.toString();
	//	alert(' 403 = ' + strData.indexOf('status:403')+' ~ 302 = ' + strData.indexOf('status:302')+ ' ~ 0 = ' + strData.indexOf('status:0'));
		if(strData.indexOf('status:403')>=0||strData.indexOf('status:302')>=0||strData.indexOf('status:0')>=0){
			//alert('sesion expired - ${pageContext.request.contextPath}');
			window.location.href="${pageContext.request.contextPath}";
		}
	}
</script>
</html>