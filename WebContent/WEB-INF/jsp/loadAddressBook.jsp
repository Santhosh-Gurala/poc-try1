<%@include file="/WEB-INF/jsp/include.jsp"%>
<%@include file="/WEB-INF/jsp/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Address Book Home</title>
</head>
<body>
	<form>
		<table
			style="font-style: normal; font-size: 14px; font-family: Verdana, Arial, Sans-Serif; font-weight: normal">
			<tr>
				<td><b><fmt:message key="addressbook.welcomenote" /></b></td>
			</tr>
			<tr>
				<td><a href="./findPerson">Find Person</a></td>
			</tr>
			<tr>
				<td><a href="./findBusinessEntity">Find Business Entity</a></td>
			</tr>
			<tr>
				<td><a href="./newPerson">Add Person</a></td>
			</tr>
			<tr>
				<td><a href="./newBusinessEntity">Add Business Entity</a></td>
			</tr>
			<tr>
				<td><a href="./newPhysicalAddress">Add Physical Address</a></td>
			</tr>
			<tr>
				<td><a href="./findPhysicalAddress">Find Physical Address</a></td>
			</tr>
			<tr>
				<td><a href="./helloAjax">Test Simple AJAX Using Spring - JQuery</a></td>
			</tr>
		</table>
	</form>
</body>
</html>