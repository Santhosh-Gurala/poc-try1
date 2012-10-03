<%@include file="/WEB-INF/jsp/tiles/include.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Approval Queue</title>
</head>

<body>
	<form:form modelAttribute="approvalRequests"
		id="tiles_approve_Request_form" action="approvalRequest" method="POST">

		<div class="AdminBoxTop">
			<div class="TableHeader">Approval Queue</div>
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
				<div id="personMessageDiv" class="message">
					<c:if test="${ not empty messages}">
						<c:forEach items="${messages }" var="item">
							<c:out value="${item}"/><br>
						</c:forEach>
						<br>
					</c:if>
				</div>
				<div id="personMessageDiv" class="error">
					<c:if test="${ not empty errorMessages}">
						<c:forEach items="${errorMessages }" var="item">
							<c:out value="${item}"/><br>
						</c:forEach>
						<br>
					</c:if>
				</div>
				
				<div>
					<table width="100%" border="0" cellpadding="2" cellspacing="1"
						style="table-layout: fixed;">
						<thead>
							<tr class="header_TR">
								<th width="2%"><input id="approvalCheckAll"
									name="approvalCheckAll" class="approlaQueue_header_checkBox"
									type="checkbox" checked="checked" /></th>
								<th width="6%">Category</th>
								<th width="2%">&Delta;</th>
								<th width="7%">Context</th>
								<th width="6%">Old Values</th>
								<th width="7%">Comments</th>
								<th width="7%">Requester</th>
								<th width="7%">Requested On</th>
								<th width="9%">Name/Street</th>
								<!-- <th width="8%">Business Type</th> -->
								<th width="6%">Phone #</th>
								<th width="7%">Email</th>
								<th width="5%">Street2</th>
								<th width="4%">City</th>
								<th width="5%">State</th>
								<th width="4%">Zip</th>
								<th width="5%">Country</th>
								<th width="6%">Address Role</th>
								<th width="5%">Vendor #</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${not empty approvalRequests.approvalRequests}">
								<c:forEach items="${approvalRequests.approvalRequests}"
									var="approvalRequest" varStatus="itrStatus">

									<form:hidden
										path="approvalRequests[${itrStatus.index}].rejectRequest.requesterEmail" />
									<form:hidden
										path="approvalRequests[${itrStatus.index}].rejectRequest.rejecterEmail" />

									<tr class="TrRow${itrStatus.index%2}">
										<td align="center"><form:checkbox
												cssClass="approlaQueue_checkBoxs"
												path="approvalRequests[${itrStatus.index}].uniqueQualifier"
												value="${approvalRequest.uniqueQualifier}" />
										</td>
										<td>${approvalRequest.changeCategory} <c:if
												test="${approvalRequest.changeCategory eq 'BE'}">
												<c:choose>
													<c:when
														test="${approvalRequest.isVendor && approvalRequest.isClient}">
													(Vendor, Client)
													</c:when>
													<c:when
														test="${approvalRequest.isVendor&&!approvalRequest.isClient}">
													(Vendor)
													</c:when>
													<c:when
														test="${approvalRequest.isClient&&!approvalRequest.isVendor}">
													(Client)
													</c:when>
												</c:choose>
											</c:if>
										</td>
										<td align="center"><c:if
												test="${not empty approvalRequest.changeType}">
												<c:choose>
													<c:when test="${approvalRequest.changeType eq 'ADD'}">
														<div align="center">
															<img class="add" src="resources/images/IconPlus.jpg"
																border="0" />
														</div>
													</c:when>
													<c:when test="${approvalRequest.changeType eq 'UPDATE'}">
														<div align="center">
															<img class="add" src="resources/images/Edit-icon.png"
																border="0" />
														</div>
													</c:when>
													<c:when test="${approvalRequest.changeType eq 'DELETE'}">
														<div align="center">
															<img class="add" src="resources/images/IconMinus.jpg"
																border="0" />
														</div>
													</c:when>
												</c:choose>
											</c:if>
										</td>
										<c:choose>
											<c:when test="${approvalRequest.changeCategory eq 'BE'}">
												<td class='wordwrap'>${approvalRequest.businessEntityName}</td>
											</c:when>
											<c:when test="${approvalRequest.changeCategory eq 'PERSON'}">
												<td class='wordwrap'>${approvalRequest.personName}</td>
											</c:when>
											<c:when test="${approvalRequest.changeCategory eq 'ADDRESS'}">
												<td class='wordwrap'>${approvalRequest.streetAddress}</td>
											</c:when>
											<c:otherwise>
												<td class='wordwrap'></td>
											</c:otherwise>
										</c:choose>

										<td class='wordwrap'>${approvalRequest.approvedValue}</td>

										<td class='wordwrap'>${approvalRequest.comments}</td>

										<c:choose>
											<c:when test="${ not empty approvalRequest.requesterEmail}">
		<td class='wordwrap'><a href="mailto:${approvalRequest.requesterEmail}">${approvalRequest.requesterFirstName} ${approvalRequest.requesterLastName}</a>${approvalRequest.requesterPhone}</td>
											</c:when>
											<c:otherwise>
		<td class='wordwrap'>${approvalRequest.requesterFirstName} ${approvalRequest.requesterLastName}${approvalRequest.requesterPhone}</td>
											</c:otherwise>
										</c:choose>
										<td class='wordwrap'>${approvalRequest.requestedOn}</td>
										
										<c:choose>
											<c:when
												test="${approvalRequest.changeCategory eq 'BE-PERSON (link)'}">
												<td class='wordwrap'>${approvalRequest.businessEntityName} &#x21C4; ${approvalRequest.personName}</td>
											</c:when>
											<c:when
												test="${approvalRequest.changeCategory eq 'BE-ADDRESS (link)'}">
												<td class='wordwrap'>${approvalRequest.businessEntityName} &#x21C4; ${approvalRequest.streetAddress}</td>
											</c:when>
											<c:when
												test="${approvalRequest.changeCategory eq 'PERSON-ADDRESS (link)'}">
												<td class='wordwrap'>${approvalRequest.personName} &#x21C4; ${approvalRequest.streetAddress}</td>
											</c:when>
											<c:otherwise>
												<td class='wordwrap'>${approvalRequest.parentContext}</td>
											</c:otherwise>
										</c:choose>

										<td class='wordwrap'>${fn:replace(approvalRequest.phoneNumbers,
											",", ", ")}</td>
										<td class='wordwrap'>${fn:replace(approvalRequest.emailAddresses,",",
											", ")}</td>
										<td class='wordwrap'>${approvalRequest.street2}</td>
										<td class='wordwrap'>${approvalRequest.city}</td>
										<c:choose>
											<c:when test="${ not empty approvalRequest.state}">
												<td class='wordwrap'>${approvalRequest.state}</td>
											</c:when>
											<c:otherwise>
												<td class='wordwrap'>${approvalRequest.stateOther}</td>
											</c:otherwise>
										</c:choose>
										<td class='wordwrap'>${approvalRequest.postalCode}</td>
										<td class='wordwrap' align="center">${approvalRequest.country}</td>
										<td class='wordwrap' align="center">${approvalRequest.addressRole}</td>
										<td class='wordwrap' align="center">${approvalRequest.vendorName}</td>
									</tr>
								</c:forEach>
							</c:if>
						</tbody>
					</table>
				</div>
			</div>
			<!--InnerFormFieldContainer end-->
		</div>
		<div class="AdminBoxBot"></div>
		<div class="ClearFloat"></div>
		<div class="ApproveBtn">
			<a id="ApprovalButtonLink" href="#"> <img
				src="/addressbook/resources/images/BtnApprove.jpg"> </a>
		</div>
		<div class="ApproveBtn">
			<a id="emailPopupForReject" href="#rejectModal"> <img
				src="/addressbook/resources/images/reject.jpg"> </a>
		</div>
		<div class="BotHeight"></div>

		<div id="rejectEmailboxes">
			<div id="rejectModal" class="window">
				<div class="AddInnerFormBoxContainer">
					<!--AddInnerFormBoxContainer start-->
					<div class="AddBoxTop">
						<div class="TableHeader">Confirm Reject</div>
					</div>
					<div class="AddBoxMid">
						<!--AddBoxMid start-->
						<div class="InnerAddFormFieldContainer">
							<!--InnerAddFormFieldContainer start-->
							<div class="ApprovalLeftForm">
								<!--PersonLeftForm start-->
								<table width="100%" border="0" cellpadding="0" cellspacing="0">
									<tr>
										<td align="center" colspan="2" class="ConfirmText">Do you
											want to Reject ?</td>
									</tr>
									<tr>
										<td colspan="2">&nbsp;</td>
									</tr>
									<tr>
										<td colspan="2">To:&nbsp;&nbsp; <input type="text"
											class="RejectConfirmtextfield" readonly name="requesterEmail"
											id="requesterEmail"
											value='<c:out value="${requesterEmail}"/>' maxlength="255" />
										</td>
									</tr>
									<tr>
										<td colspan="2">&nbsp;</td>
									</tr>
									<tr>
										<td colspan="2">Cc:&nbsp; <input type="text"
											class="RejectConfirmtextfield" readonly name="rejectorEmail"
											id="rejectorEmail" value='<c:out value="${rejectorEmail}"/>'
											maxlength="255" /></td>
									</tr>
									<tr>
										<td colspan="2">&nbsp;</td>
									</tr>
									<tr align="left">
									<td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Reject Reason:
									</td>
									</tr>
									<tr>
									<td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<textarea class="RejectConfirmtextfield" name="rejectComment" id="rejectComment" maxlength="4000"
												rows="10" cols="42"></textarea></td>
									</tr>
									<tr>
										<td colspan="2">&nbsp;</td>
									</tr>
									<tr>
										<td width="108"></td>
										<td align="center"><span><a href="#"
												class="button" id="RejectButtonLink"><span>Reject & Send</span> </a>
												<a href="#" class="button" id="cancelReject"><span>Cancel</span>
											</a> </span>
										</td>
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
						<img src="resources/images/AddBoxBot.jpg" width="415" height="13"
							border="0" />
					</div>
				</div>
				<!--AddInnerFormBoxContainer end-->
			</div>
		</div>

	</form:form>
	<a id="beFakeLink" href='#'></a>
	<a id="fakeRejectLink" href='#'></a>
</body>

<script type="text/javascript">
	$(document).ready(function() {
		$(".approlaQueue_checkBoxs").attr("checked", false);
		$(".approlaQueue_header_checkBox").attr("checked", false);
	});
	
	function imposeMaxLength(Event, Object, MaxLen)
	{
	    return (Object.value.length <= MaxLen)||(Event.keyCode == 8 ||Event.keyCode==46||(Event.keyCode>=35 && Event.keyCode<=40))
	}

	Spring.addDecoration(new Spring.AjaxEventDecoration({
		elementId : "ApprovalButtonLink",
		formId : "tiles_approve_Request_form",
		event : "onclick",
		params : {
			fragments : "approval"
		}
	}));

	Spring.addDecoration(new Spring.AjaxEventDecoration({
		elementId : "fakeRejectLink",
		formId : "tiles_approve_Request_form",
		event : "onclick",
		params : {
			fragments : "approval",
			operation : "reject"
		}
	}));
	
	
	$('#RejectButtonLink').click(function (e) {
		var rejectComment = $.trim($('#rejectComment').val());
		rejectComment = rejectComment.replace(/\n/g, "<br />");
		$('#rejectComment').val(rejectComment);
		var formAction = "approvalRequest";
		$("#tiles_approve_Request_form").attr("action", formAction);
		
		if (document.createEventObject) {
			// dispatch for IE    	
			return document.getElementById("fakeRejectLink") 
					.fireEvent('onclick');
		} else {
			// dispatch for firefox + others
			var evt = document.createEvent("HTMLEvents");
			evt.initEvent('click', true, true); // event type,bubbling,cancelable
			return !document.getElementById("fakeRejectLink")
					.dispatchEvent(evt);
		}
		document.getElementById("fakeRejectLink").onClick(); 
	});
	
	

	$('#approvalCheckAll').click(function(e) {
		var chkBoxes = $('[id^=approvalRequests]');
		for ( var i = 0; i < chkBoxes.length; i++) {
			chkBoxes[i].checked = this.checked;
		}
	});

	$('#emailPopupForReject')
			.click(
					function(e) {

						var selectedApprovalRequests = $(".approlaQueue_checkBoxs:checked");
						if (selectedApprovalRequests.length > 1) {
							alert("Please select any one request from the queue");
							return false;
						} else if (selectedApprovalRequests.length < 1) {
							alert("Please select at least one row to process your request");
							return false;
						}
						var index = selectedApprovalRequests[0].value
								.charAt(selectedApprovalRequests[0].value.length - 1);
						index = index - 1;
						$("#requesterEmail").val(document.getElementById("approvalRequests"
						+index+ ".rejectRequest.requesterEmail").value);
						$("#rejectorEmail").val(document.getElementById("approvalRequests"
						+index+".rejectRequest.rejecterEmail").value);
						e.preventDefault();
						//Get the A tag
						var id = '#rejectModal';

						//Get the screen height and width
						var maskHeight = $(document).height();
						var maskWidth = $(window).width();

						//Set heigth and width to mask to fill up the whole screen
						$('#mask').css({
							'width' : maskWidth,
							'height' : maskHeight
						});
						//transition effect		
						$('#mask').fadeIn(100);
						$('#mask').fadeTo("slow", 0.8);

						//Get the window height and width
						var winH = $(window).height();
						var winW = $(window).width();

						//Set the popup window to center
						$(id).css('top', winH / 2 - $(id).height() / 2);
						$(id).css('left', winW / 2 - $(id).width() / 2);

						//transition effect
						$(id).fadeIn(100);

					});

	$('#cancelReject').click(function(e) {
		//Cancel the link behavior
		e.preventDefault();

		$('#mask').hide();
		$('.window').hide();
	});
</script>

<div id="mask"></div>
</html>