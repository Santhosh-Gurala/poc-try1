<%@include file="/WEB-INF/jsp/tiles/include.jsp"%>
<%@ page pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Business Entity Details</title>
</head>

<body>
<form:form modelAttribute="businessEntity"
		action="tiles_submitBusinessEntity" method="POST"
		id="tiles_businessentity_form">
	<div class="BoxTop">
		<div class="TableHeader">Business Entity</div>
	</div>
	<div class="BoxMid">
		<!--BoxMid start-->
		<div class="InnerFormFieldContainer">
			<!--InnerFormFieldContainer start-->
			<div class="BussinessLeftForm">
				<!--BussinessLeftForm start-->
		
				<div id="beErrorDiv">
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
					<tr>
						<td>
						<label>
							<input type="text"
									name="searchBEString" id="searchBEString"
									value='<c:out value="${searchBEString}"/>' maxlength="65"
									class="as_autosuggest"
									onclick="this.value='';" onfocus="this.select()"
									onblur="this.value=!this.value?'Search Businesses':this.value;" />
						</label>
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td class="LabelText">Entity Name: <span class="mandatorySymbol"> *</span></td>
					</tr>
					<tr>
						<td>
						<form:input path="name" maxlength="255" cssClass="BEtextfield"/>
						<!-- <input name="textfield2" type="text" class="BEtextfield"
							id="textfield2" /> -->
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td><table width="100%" border="0" cellpadding="0"
								cellspacing="0">
								<tr>
									<td width="8%" align="left">
									<form:checkbox path="isVendor" />
									<!-- <input type="checkbox"
										name="checkbox2" id="checkbox2" checked="checked" /> -->
									</td>
									<td width="92%" align="left" class="NormalText">Vendor</td>
								</tr>
							</table></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td><table width="100%" border="0" cellpadding="0"
								cellspacing="0">
								<tr>
									<td width="8%" align="left">
									<form:checkbox path="isClient" />
									<!-- <input type="checkbox"
										name="checkbox3" id="checkbox3" /> --></td>
									<td width="92%" align="left"  class="NormalText">Client</td>
								</tr>
							</table></td>
					</tr>
					<tr>
						<td class="LabelText">&nbsp;</td>
					</tr>
					<tr>
						<td class="LabelText">Vendor Number:</td>
					</tr>
					<tr>
						<td>
						<form:input path="sapVendorNumber" maxlength="100" cssClass="BEtextfield"/>
						<!-- <input name="textfield3" type="text" class="BEtextfield"
							id="textfield3" /> -->
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td align="left"><div id="legendContainerM2">
								<!--legendContainerM Start-->
								<fieldset>
									<legend class="legHeadH2">Phone Numbers</legend>
									<div id="legenInnerContainer2">
										<!--Inner legend Container Start-->
										<table id="bePhonesTable" width="100%" border="0" cellpadding="0" cellspacing="2">
										<c:if test="${not empty businessEntity.phones}">
											<c:forEach items="${businessEntity.phones}" var="phones"
												varStatus="itrStatus">
												<tr>
												<td width="48%" align="left" valign="middle">
												<form:input id="bephones${itrStatus.index}" path="phones[${itrStatus.index}].phoneNumber" maxlength="20"  cssClass="refTypeText"/>
												<form:hidden path="phones[${itrStatus.index}].phoneId" />
												</td>
												<td width="3%" align="left">&nbsp;</td>
												<td width="32%" align="left">
												<label> 
												<form:select path="phones[${itrStatus.index}].phoneType"
													items="${bePhoneTypes}" itemLabel="name" cssClass="refTypeSelect" />
												</label>
												</td>
												<td width="3%">&nbsp;</td>
												<td width="10%"><a href="javascript:void(0)"><img class="del"
														src="resources/images/IconMinus.jpg" border="0" /></a></td>
												</tr>
											</c:forEach>
											<tr>
												<td width="48%" align="left" valign="middle">
												<input id="bephones<c:out value='${fn:length(businessEntity.phones)}'/>" name="phones[<c:out value='${fn:length(businessEntity.phones)}'/>].phoneNumber" maxlength="20"  type="text" value="" class="refTypeText"/></td>
												<td width="3%" align="left">&nbsp;</td>
												<td width="32%" align="left">
												<label>
												<select id="phones0.phoneType" name="phones[<c:out value='${fn:length(businessEntity.phones)}'/>].phoneType" class="refTypeSelect">
													<c:forEach var="item" items="${bePhoneTypes}">
														<option value="${item.id}">${item.name}</option>
													</c:forEach>
												</select>
												</label>
												</td>
												<td width="3%">&nbsp;</td>
												<td width="10%"><a href="javascript:void(0)"><img class="add" src="resources/images/IconPlus.jpg" border="0" /></a></td>
											</tr>
										</c:if>
										<c:if test="${empty businessEntity.phones}">
											<tr>
												<td width="48%" align="left" valign="middle">
												<input id="bephones0" name="phones[0].phoneNumber" maxlength="20"  type="text" value="" class="refTypeText"/>
												</td>
												<td width="3%" align="left">&nbsp;</td>
												<td width="32%" align="left">
												<label> 
													<select id="phones0.phoneType" name="phones[0].phoneType" class="refTypeSelect">
														<c:forEach var="item" items="${bePhoneTypes}">
															<option value="${item.id}">${item.name}</option>
														</c:forEach>
													</select>
												</label></td>
												<td width="3%">&nbsp;</td>
												<td width="10%"><a href="javascript:void(0)"><img class="add"
														src="resources/images/IconPlus.jpg" border="0" /></a></td>
											</tr>	
										</c:if>
						</table>
						</div>
						<!--Inner legend Container End-->
						</fieldset>
						</div></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td><div id="legendContainerM3">
								<!--legendContainerM Start-->
								<fieldset>
									<legend class="legHeadH2">Email Addresses</legend>
									<div id="legenInnerContainer3">
										<!--Inner legend Container Start-->
										<table id="beEmailsTable" width="100%" border="0" cellpadding="0" cellspacing="2">
							<c:if test="${not empty businessEntity.emails}">
							<c:forEach items="${businessEntity.emails}" var="emails"
								varStatus="itrStatus">
											<tr>
												<td width="48%" align="left" valign="middle">
													<form:input id="beemails${itrStatus.index}" path="emails[${itrStatus.index}].emailAddress" maxlength="100"  cssClass="refTypeText"/> 
													<form:hidden path="emails[${itrStatus.index}].emailId" />
												</td>
												<td width="3%" align="left">&nbsp;</td>
												<td width="32%" align="left"><label> 
												<form:select path="emails[${itrStatus.index}].emailType"
													items="${emailTypes}" itemLabel="name" cssClass="refTypeSelect"/>
												</label></td>
												<td width="3%">&nbsp;</td>
												<td width="10%"><a href="javascript:void(0)"><img
														src="resources/images/IconMinus.jpg" border="0" class="del"/></a></td>
											</tr>
							</c:forEach>
							<tr><td width="48%" align="left" valign="middle">
								<input id="beemails<c:out value='${fn:length(businessEntity.emails)}'/>" name="emails[<c:out value='${fn:length(businessEntity.emails)}'/>].emailAddress" maxlength="100"  type="text" value="" class="refTypeText"/>
								</td><td width="3%" align="left">&nbsp;</td>
								<td width="32%" align="left"><label>
								<select id="emails'<c:out value='${fn:length(businessEntity.emails)}'/>.emailType" name="emails[<c:out value='${fn:length(businessEntity.emails)}'/>].emailType" class="refTypeSelect">
								<c:forEach var="item" items="${emailTypes}">
								<option value="${item.id}">${item.name}</option>
								</c:forEach>
								</select>
								</label></td>
								<td width="3%">&nbsp;</td>
								<td width="10%"><a href="javascript:void(0)"><img class="add" src="resources/images/IconPlus.jpg" border="0"/></a></td>
							</tr>
						</c:if>
						<c:if test="${empty businessEntity.emails}">
							<tr>
								<td width="48%" align="left" valign="middle">
										<input id="beemails0"
										name="emails[0].emailAddress" maxlength="100"  type="text" value="" class="refTypeText"/>
								</td>
								<td width="3%" align="left">&nbsp;</td>
								<td width="32%" align="left"><label> 
									<select id="emails0.emailType" name="emails[0].emailType" class="refTypeSelect">
										<c:forEach var="item" items="${emailTypes}">
											<option value="${item.id}">${item.name}</option>
										</c:forEach>
									</select>
								</label></td>
								<td width="3%">&nbsp;</td>
								<td width="10%"><a href="javascript:void(0)"><img class="add"
								src="resources/images/IconPlus.jpg" border="0" /></a></td>
							</tr>
						</c:if>		
						</table>
					</div>
					<!--Inner legend Container End-->
				</fieldset>
			</div></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td align="left"><table width="60%" border="0"
								cellpadding="0" cellspacing="0">
								<tr>
									<td width="25%" align="left"><a href="" id="create_business_entity"><img
											src="resources/images/AddIcon.jpg" width="27" height="27" border="1" title="Create new Business Entity"/></a></td>
									<c:if test="${businessEntity.businessEntityId gt 0 }">
										<td width="25%" align="left"><a href="#beUpdateConfirmModal" id="update_business_entity"><img
											src="resources/images/EditIcon.jpg" width="27" height="27" border="1" title="Update this Business Entity"/></a></td>
											
									</c:if>
									<td width="25%" align="left"><a href="#beDelConfirmModal" id="delete_businessentity"><img
											src="resources/images/DeleteIcon.jpg" width="27" height="27"
											border="1" title="Delete this Business Entity"/></a></td>
									<td width="25%" align="left"><a href="tiles_newBusinessEntity" id="be_reset"><img src="resources/images/ResetIcon.jpg"
											width="27" height="27" border="1" title="Clear this Business Entity pane"/></a></td>
									<td>&nbsp;</td>
								</tr>
							</table></td>
					</tr>
				</table>
			</div>
			<!--BussinessLeftForm end-->
			<div class="BEpeopleBoxContainer">
				<!--BEpeopleBoxContainer start-->
				<div class="BEpeopleHeight"></div>
				<div class="BEpeopleIconList">
					<!--BEpeopleIconList start-->
					<table width="100%" border="0" cellpadding="0" cellspacing="0">
						
						<c:choose>
							<c:when test="${not empty businessEntity.contacts}">								
								<c:forEach var="person" items="${businessEntity.contacts}"
									varStatus="item">								
						
						<tr>
							<td align="center">
								<a id="beContactLinks<c:out value="${item.index }"/>" href='javascript:void(0)' onclick="javascript:displayAssocMenu('actionsDiv',event,'bePersonAssocAction',<c:out value="${person.personId}"/>,<c:out value="${person.contactId}"/>,<c:out value="${businessEntity.businessEntityId}"/>,0,'<c:out value="${item.index}"/>');">
									<img src="resources/images/UserIcon.jpg" border="1" />
								</a>
							</td>
						</tr>
						<tr>
							<td align="center">
								<span class="IconText">
									<c:out value="${person.firstName}" />&nbsp;<c:out value="${person.lastName}" />,
<form:hidden path="contacts[${item.index}].firstName" />
<form:hidden path="contacts[${item.index}].lastName" />
<form:hidden path="contacts[${item.index}].personId" />
<form:hidden path="contacts[${item.index}].contactId" />
								</span>
						</td>
						</tr>
						<tr>
							<td width="40" align="center">&nbsp;</td>
						</tr>
						</c:forEach>
						</c:when>
						</c:choose>
					</table>
				</div>
				<!--BEpeopleIconList end-->
			</div>
			<!--BEpeopleBoxContainer end-->
			<div class="BEaddBoxContainer">
				<!--BEaddBoxContainer start-->
				<div class="BEpeopleHeight"></div>
				<div class="BEpeopleIconList">
					<!--BEpeopleIconList start-->
					<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<c:choose>
							<c:when test="${not empty businessEntity.partyPhysicalAddresses}">
								<c:forEach var="partyAddress"
									items="${businessEntity.partyPhysicalAddresses}"
									varStatus="item">
						<tr>
							<td align="center">
								<a id="beAddressLinks<c:out value="${item.index }"/>"
												href='javascript:void(0)' onclick="javascript:displayAssocMenu('actionsDiv',event,'beAddressAssocAction',<c:out value="${partyAddress.address.addressId}"/>,<c:out value="${partyAddress.partyAddressId}"/>,<c:out value="${businessEntity.businessEntityId}"/>,<c:out value="${partyAddress.addressRole.id}"/>,'','<c:out value="${item.index}"/>','<c:out value="${partyAddress.payeeNo}"/>');">
									<img src="resources/images/BuildingIcon.jpg" border="1" />
								</a>
							</td>
						</tr>
						<tr>
							<td align="center">
								<span class="IconText">
									<c:out value="${partyAddress.address.streetAddress}" />
									<c:out value="${partyAddress.address.address2}" /><br>
									(<c:out value="${partyAddress.addressRole.name}" />)
									
<form:hidden path="partyPhysicalAddresses[${item.index}].address.streetAddress" />
<form:hidden path="partyPhysicalAddresses[${item.index}].address.address2" />
<form:hidden path="partyPhysicalAddresses[${item.index}].address.address3" />
<form:hidden path="partyPhysicalAddresses[${item.index}].address.addressId" />
<form:hidden path="partyPhysicalAddresses[${item.index}].addressRole.id" />
<form:hidden path="partyPhysicalAddresses[${item.index}].addressRole.name" />
<form:hidden path="partyPhysicalAddresses[${item.index}].partyAddressId" />

<form:hidden path="partyPhysicalAddresses[${item.index}].address.city" />
<form:hidden path="partyPhysicalAddresses[${item.index}].address.postalCode" />
<form:hidden path="partyPhysicalAddresses[${item.index}].address.country.name" />
<c:choose>
	<c:when test="${ not empty partyAddress.address.state}">
		<form:hidden path="partyPhysicalAddresses[${item.index}].address.state.name" />
	</c:when>
	<c:otherwise>
		<form:hidden path="partyPhysicalAddresses[${item.index}].address.stateOther" />
	</c:otherwise>
</c:choose>
<script type="text/javascript">
	$("#beAddressLinks<c:out value="${item.index }"/>").attr('title', '<c:out value="${partyAddress.address.streetAddress}"/> <c:out value="${partyAddress.address.address2}"/> \n<c:out value="${partyAddress.address.address3}"/> <c:out value="${partyAddress.address.city}" /> <c:choose><c:when test="${ not empty partyAddress.address.state}"><c:out value="${partyAddress.address.state.name}"/></c:when><c:otherwise><c:out value="${partyAddress.address.stateOther}"/></c:otherwise></c:choose>-<c:out value="${partyAddress.address.postalCode}"/> \n<c:if test="${ not empty partyAddress.address.country}"><c:out value="${partyAddress.address.country.name}"/></c:if>');
</script>
								</span>
							</td>
						</tr>
						<tr>
							<td width="40" align="center">&nbsp;</td>
						</tr>				
						</c:forEach>
						</c:when>
						</c:choose>
					</table>
				</div>
				<!--BEpeopleIconList end-->
			</div>
			<!--BEaddBoxContainer end-->
			<div class="ClearFloat"></div>
		</div>
		<!--InnerFormFieldContainer end-->

	</div>
	<!--BoxMid end-->
	<div class="BoxBot">
		<img src="resources/images/TableBot.jpg" width="522" height="13" border="0" />
	</div>
	
	<!-- Audit Hidden field Mappings -->
		<form:hidden path="businessEntityId" />
		<form:hidden path="partyId" />
		<form:hidden path="createdBy" />
		<form:hidden path="lastUpdatedBy" />
		<form:hidden path="lastUpdatedDateTime" />
		<form:hidden path="createdDateTime" />
	
	<a id="beFakeLink" href='#'></a>
	<div id="beConfirmboxes">
		<%@include file="/WEB-INF/jsp/BEDeleteConfirmBox.jsp"%>
		<%@include file="/WEB-INF/jsp/BEUpdateConfirmBox.jsp"%>
	</div>	
	</form:form>	
	<a id="fakeBEUpdateLink" href='#'></a>
	<a id="fakeBEDeleteLink" href='#'></a>
</body>

<script type="text/javascript">
	jQuery(document).ready(function() {
		$('businessEntityId').val($('#businessEntityId').val());
		fnDisableAssocBELinks();
		var selectedBEValue = '<c:out value="${searchBEString}"/>';
		var selectedBEId = '<c:out value="${selectedBEId}"/>';
		var url = './ajax_findBusinessEntity?dummy=dummy';
		jQuery("#searchBEString").autosuggest({
			url : url,
			elementName : 'selectedBEId',
			//defaultId : selectedBEId,
			width : '250px',
			height : 170,
			//defaultValue : selectedBEValue,
			onValueChange : 'ajax_getBusinessEntity()',
			minCharacters : 2
		});
		
			$('#bePhonesTable').delegate('.add', 'click', function(e) {
				var rowCount = $('#bePhonesTable tr').length;
				var checkRow = rowCount-1;
				if($("#bephones"+checkRow).val() != "")
				{	
					$(this).attr('src','resources/images/IconMinus.jpg');
					$(this).attr('class','del');
		 			var newRow = '<tr><td width="48%" align="left" valign="middle">'
						+'<input id="bephones'+rowCount+'" name="phones['+rowCount+'].phoneNumber" maxlength="20"  type="text" value="" class="refTypeText"/></td>'
						+'<td width="3%" align="left">&nbsp;</td>'
						+'<td width="32%" align="left"><label>'
						+'<select id="phones'+rowCount+'.phoneType" name="phones['+rowCount+'].phoneType" class="refTypeSelect">'
						+'<c:forEach var="item" items="${bePhoneTypes}">'
						+'<option value="${item.id}">${item.name}</option> </c:forEach>'
						+'</select></label></td>'
						+'<td width="3%">&nbsp;</td>'
						+'<td width="10%"><a href="javascript:void(0)"><img class="add" src="resources/images/IconPlus.jpg" border="0" /></a></td></tr>';
					$("#bePhonesTable").append(newRow);
				}
			});
		
			$('#bePhonesTable').delegate('.del', 'click', function(e) {
				$(this).closest("tr").remove();
			});
			
			$('#beEmailsTable').delegate('.add', 'click', function(e) {
				var rowCount = $('#beEmailsTable tr').length;
				var checkRow = rowCount-1;
				if($("#beemails"+checkRow).val() != "")
				{	
					$(this).attr('src','resources/images/IconMinus.jpg');
					$(this).attr('class','del');
					var newRow = '<tr><td width="48%" align="left" valign="middle">'
							+'<input id="beemails'+rowCount+'" name="emails['+rowCount+'].emailAddress" maxlength="100"  type="text" value="" class="refTypeText"/>'
							+'</td><td width="3%" align="left">&nbsp;</td>'
							+'<td width="32%" align="left"><label>'
							+'<select id="emails'+rowCount+'.emailType" name="emails['+rowCount+'].emailType" class="refTypeSelect">'
							+' <c:forEach var="item" items="${emailTypes}">'
							+'<option value="${item.id}">${item.name}</option>'
							+' </c:forEach>'
							+'</select>'
							+'</label></td><td width="3%">&nbsp;</td>'
							+'<td width="10%"><a href="javascript:void(0)"><img class="add" src="resources/images/IconPlus.jpg" border="0"/></a></td></tr>';
					$("#beEmailsTable").append(newRow);
				}
		});
	
		$('#beEmailsTable').delegate('.del', 'click', function(e) {
			$(this).closest("tr").remove();
		});
		
		$('#mask').hide();
		$('.window').hide();
		closeMenuPopups();
	
	});
	
	
	Spring.addDecoration(new Spring.AjaxEventDecoration({
		elementId : "fakeBEUpdateLink",
		formId : "tiles_businessentity_form",
		event : "onclick",
		params : {
			fragments : "businessEntity",
			operation : "saveBusinessEntity"
		}
	}));
	
	$('#save_business_entity').click(function (e) {
		var commentsToUpdate = $.trim($('#commentsToUpdate').val());
		if(commentsToUpdate == ''){
			$("#beupdateCommentsErrorMessage").css('visibility', 'visible');
			return false;
		}else{
			$("#beupdateCommentsErrorMessage").css('visibility', 'hidden');	
		}
				
		var formAction = "tiles_submitBusinessEntity";
		$("#tiles_businessentity_form").attr("action", formAction);
		
		if (document.createEventObject) {
			// dispatch for IE    	
			return document.getElementById("fakeBEUpdateLink") 
					.fireEvent('onclick');
		} else {
			// dispatch for firefox + others
			var evt = document.createEvent("HTMLEvents");
			evt.initEvent('click', true, true); // event type,bubbling,cancelable
			return !document.getElementById("fakeBEUpdateLink")
					.dispatchEvent(evt);
		}
		document.getElementById("fakeBEUpdateLink").onClick(); 
	});	
	
	
	

	function ajax_getBusinessEntity() {
		var currDate = new Date();
		document.getElementById("beFakeLink").href = "tiles_getBusinessEntity?businessEntityId="
				+ $('#selectedBEId').val()
				+ "&searchBEString="
				+ encodeURIComponent($('#searchBEString').val())
				+ "&currDate="
				+ currDate.toString();
		if (document.createEventObject) {
			// dispatch for IE
			return document.getElementById("beFakeLink").fireEvent('onclick');
		} else {
			// dispatch for firefox + others
			var evt = document.createEvent("HTMLEvents");
			evt.initEvent('click', true, true); // event type,bubbling,cancelable
			return !document.getElementById("beFakeLink").dispatchEvent(evt);
		}
		document.getElementById("beFakeLink").onClick();
	}

	Spring.addDecoration(new Spring.AjaxEventDecoration({
		elementId : "beFakeLink",
		event : "onclick",
		params : {
			fragments : "businessEntity"
		}
	}));

	Spring.addDecoration(new Spring.AjaxEventDecoration({
		elementId : "create_business_entity",
		formId : "tiles_businessentity_form",
		event : "onclick",
		params : {
			fragments : "businessEntity",
			operation : "createBusinessEntity"
		}
	}));
	
	Spring.addDecoration(new Spring.AjaxEventDecoration({
		elementId : "fakeBEDeleteLink",
		formId : "tiles_businessentity_form",
		event : "onclick",
		params : {
			fragments : "businessEntity",
			operation : "deleteBusinessEntity"
		}
	}));
	
	$('#confirmBEDelete').click(function (e) {
		var commentsToDelete = $.trim($('#commentsToDelete').val());
		if(commentsToDelete == ''){
			$("#deleteBECommentsErrorMessage").css('visibility', 'visible');
			return false;
		}else{
			$("#deleteBECommentsErrorMessage").css('visibility', 'hidden');	
		}
				
		var formAction = "tiles_submitBusinessEntity";
		$("#tiles_businessentity_form").attr("action", formAction);
		
		if (document.createEventObject) {
			// dispatch for IE    	
			return document.getElementById("fakeBEDeleteLink") 
					.fireEvent('onclick');
		} else {
			// dispatch for firefox + others
			var evt = document.createEvent("HTMLEvents");
			evt.initEvent('click', true, true); // event type,bubbling,cancelable
			return !document.getElementById("fakeBEDeleteLink")
					.dispatchEvent(evt);
		}
		document.getElementById("fakeBEDeleteLink").onClick(); 
	});	
	

	Spring.addDecoration(new Spring.AjaxEventDecoration({
		elementId : "be_reset",
		event : "onclick",
		params : {
			fragments : "businessEntity"
		}
	}));
	
	function fnDisableAssocBELinks(){

		if($('#businessEntityId').val()=='0'){
			$('#assocBusAddrImg').attr('src','resources/images/BtnLWBusinessDis.jpg');
			$('#modalBusEntyAddrId').attr('class','disabled');
		}
		else if($('#businessEntityId').val() !='0'){
				$('#assocBusAddrImg').attr('src','resources/images/BtnLWBusiness.jpg');
				$('#modalBusEntyAddrId').attr('class','enabled');
		}

		if($('#businessEntityId').val() =='0' ){
				$('#assocPerBusImg').attr('src','resources/images/BtnLWBusinessDis.jpg');
/* 				if($('#assoc_person_businessentity')){
					$('#assoc_person_businessentity').attr('id','assoc_person_businessentity_dis');
				} */
		}else if($('#businessEntityId').val() !='0' ){
					$('#assocPerBusImg').attr('src','resources/images/BtnLWBusiness.jpg');
/* 					if($('#assoc_person_businessentity_dis')){
						$('#assoc_person_businessentity_dis').attr('id','assoc_person_businessentity');
					}
 */		}
	}
	
	$('#delete_businessentity').click(function(e) {

		if($('#businessEntityId').val()!='0'){
			//Cancel the link behavior
			e.preventDefault();
			//Get the A tag
			var id = '#beDelConfirmModal';
		
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
	
	
	$('#update_business_entity').click(function(e) {

		if($('#businessEntityId').val()!='0'){
			//Cancel the link behavior
			e.preventDefault();
			//Get the A tag
			var id = '#beUpdateConfirmModal';
		
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
	

	$('#cancelBEDelete').click(function (e) {
		//Cancel the link behavior
		e.preventDefault();
		
		$('#mask').hide();
		$('.window').hide();
	});	
	
	$('#cancelBEUpdate').click(function (e) {
		//Cancel the link behavior
		e.preventDefault();
		
		$('#mask').hide();
		$('.window').hide();
	});	

</script>
<%System.out.println("Exiting tiles_businessEntityDetails jsp"); %>
</html>
