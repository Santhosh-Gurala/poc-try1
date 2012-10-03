<%@include file="include.jsp"%>
<html>
<head>
<link href="<c:url value="/resources/css/addressBook.css"/>"
	rel="stylesheet" type="text/css" />
<style type="text/css">
body {
	background-color: #FFFFFF;
	background-image: url(/addressbook/resources/images/bg.jpg);
	background-repeat: repeat-x;
}
</style>
</head>
<body>
	<div class="TopBannerBgContainer">
		<div class="TopLogoTitleContainer">
			<!--TopLogoTitleContainer start-->
			<div class="TopLeftLogo">
				<img src="<c:url value="/resources/images/NBCUlogo.jpg"/>" border="0" />
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
	</div>
</body>
</html>