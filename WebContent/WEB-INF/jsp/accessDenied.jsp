<%@include file="/WEB-INF/jsp/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Exception occurred in Application</title>
</head>
<body>
	<div id="MainContainer">
		<!--MainContainer start-->
		<div id="InnerMainContainer">
			<!--InnerMainContainer start-->
			<div class="InnerFormMainContainer">
				<!--InnerFormMainContainer start-->

				<div class="AdminMainLeft">
					<!--EntryMainLeft start-->


					<div class="AdminInnerFormBoxContainer">
						<!--Business Entity InnerFormBoxContainer start-->
						<div class="AdminBoxTop">
							<div class="TableHeader">Application Exception</div>
						</div>
						<div class="AdminBoxMid">
							<!--BoxMid start-->
							<div class="AdminInnerFormFieldContainer">
								<!--InnerFormFieldContainer start-->

								<div id="beErrorDiv">
									<c:if test="${ not empty errors}">
										<form:errors path="*" cssClass="error" element="div" />
										<br>
									</c:if>
								</div>
								<div id="tag_exception">
									<table width="100%" border="0" cellpadding="2" cellspacing="1"
										style="table-layout: fixed;">
										<thead>
											<tr><th width="100%">&nbsp;</th></tr>
											<tr class="exception_TR">
												<th width="100%">You do not have sufficient privilege to access this page.</th>
											</tr>
											<tr><th width="100%">&nbsp;</th></tr>
										</thead>
									</table>
								</div>
							</div>
							<!--InnerFormFieldContainer end-->
						</div>
						<div class="AdminBoxBot"></div>
					</div>


				</div>
				<!--EntryMainLeft end-->

				<!--EntryMainRight end-->

				<div class="ClearFloat"></div>
				<div class="BotHeight"></div>
			</div>
			<!--InnerFormMainContainer end-->
		</div>
		<!--InnerMainContainer end-->
	</div>
</body>
</html>