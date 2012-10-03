<%@ page pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/tiles/include.jsp"%>
<html>
<body>
	<div class="TopTabContainer">
		<!--TopTabContainer start-->
		<c:set var="url" value="${pageContext.request.requestURL}" />
		<c:choose>
		<c:when test="${fn:contains(url, '/tiles_template')}">
		<div class="EntryTab">
			<a href="tiles_loadAddressBook"><img src="resources/images/EntryTabOn.jpg" border="0" /></a>
		</div>
		</c:when>
		<c:otherwise>
		<div class="EntryTab">
			<a href="tiles_loadAddressBook"><img src="resources/images/EntryTabOff.jpg" border="0" /></a>
		</div>
		</c:otherwise>
		</c:choose>
		<sec:authorize  access="hasRole('ADDRESS_BOOK_ADMIN')">
		<c:choose>
		<c:when test="${fn:contains(url, '/approval_tiles_template')}">
		<div class="AdminTab">
			<a href="approval_queue"><img src="resources/images/AdminTabOn.jpg"
				border="0" /></a>
		</div>
		</c:when>
		<c:otherwise>
		<div class="AdminTab">
			<a href="approval_queue"><img src="resources/images/AdminTabOff.jpg"
				border="0" /></a>
		</div>
		</c:otherwise>
		</c:choose>
		</sec:authorize>
		
	<div  class="EntryTabUser">
	<sec:authorize access="hasRole('ADDRESS_BOOK_USER')">
	Welcome&nbsp;<sec:authentication property="principal.firstName" />
	<sec:authentication property="principal.lastName" />
	&nbsp;
	</sec:authorize>
	</div> 
<div class="ClearFloat"></div>	
	</div>
	<!--TopTabContainer end-->
</body>
</html>