<%@include file="/WEB-INF/jsp/tiles/include.jsp"%>
<%@ page pageEncoding="UTF-8"%>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<head>
<title>Person Details</title>
</head>

<body>
<%System.out.println("Entering tiles_personDetails jsp"); %>
<form:form modelAttribute="person" action="tiles_submitPerson" method="POST" id="tiles_person_form" >
	<div class="BoxTop">
		<div class="TableHeader">Person</div>
	</div>
	<div class="BoxMid">
		<!--BoxMid start-->
		<div class="InnerFormFieldContainer">
			<!--InnerFormFieldContainer start-->
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
				<table width="98%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td align="left"><table width="100%" border="0"
								cellpadding="0" cellspacing="0">
								<tr>
									<td width="68%" align="left" nowrap="nowrap">
									<input type="text" 
									name="searchString" id="searchString"
									value='<c:out value="${searchString}"/>' 
									maxlength="65"
									class="as_autosuggest"
									onclick="this.value='';" onfocus="this.select()"
									onblur="this.value=!this.value?'Search Person':this.value;"/>
									</td>
									<td width="2%">&nbsp;</td>
									<td width="6%" align="left"><label>
									<input type="checkbox" name="searchGAL" id="searchGAL" 
									<%String searchGAL = (String) request.getAttribute("searchGAL");
									if("on".equals(searchGAL) || "true".equals(searchGAL)){ %>
										checked="checked"
									<%}%>
									/>	
									</label></td>
									<td width="25%" align="left"  class="NormalText">Search the GAL</td>
								</tr>
							</table></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td class="LabelText">First Name: <span class="mandatorySymbol"> *</span></td>
					</tr>
					<tr>
						<td>
						<form:input path="firstName" maxlength="255" readonly="${person.isGALRecord}" cssClass="BEtextfield"/>
						<!-- <input name="textfield2" type="text" class="BEtextfield"
							id="textfield2" /> -->
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td class="LabelText">Last Name: <span class="mandatorySymbol"> *</span></td>
					</tr>
					<tr>
						<td><form:input path="lastName" maxlength="255" readonly="${person.isGALRecord}" cssClass="BEtextfield"/></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>
							<div id="legendContainerM">
								<!--legendContainerM Start-->
								<fieldset>
									<legend class="legHeadH2">Phone Numbers</legend>
									<div id="legenInnerContainer">
										<!--Inner legend Container Start-->
										<table id="personPhonesTable" width="100%" border="0" cellpadding="0" cellspacing="2">
										<c:if test="${not empty person.phones}">
												<c:forEach items="${person.phones}" var="phones"
													varStatus="itrStatus">
								
								<tr>
												<td width="48%" align="left" valign="middle">
												<form:input id="persphonenumber${itrStatus.index}" path="phones[${itrStatus.index}].phoneNumber" maxlength="20"  readonly="${phones.isGALRecord}" cssClass="refTypeText"/>
												<form:hidden path="phones[${itrStatus.index}].phoneId" />
												</td>
												<td width="3%" align="left">&nbsp;</td>
												<td width="32%" align="left">
												<label> 
												<form:select path="phones[${itrStatus.index}].phoneType" items="${personPhoneTypes}" itemLabel="name" cssClass="refTypeSelect" />
												</label>
												<form:hidden path="phones[${itrStatus.index}].isGALRecord"/>
												</td>
												<td width="3%">&nbsp;</td>
												<td width="10%">
												<c:if test="${!phones.isGALRecord}">
													<a href="javascript:void(0)"><img class="del"
														src="resources/images/IconMinus.jpg" border="0" /></a>
												</c:if>
												</td>
											</tr>
							</c:forEach>
								<tr>
									<td width="48%" align="left" valign="middle">
									<input id="persphonenumber<c:out value='${fn:length(person.phones)}'/>" name="phones[<c:out value='${fn:length(person.phones)}'/>].phoneNumber" maxlength="20"  type="text" value="" class="refTypeText"/></td>
									<td width="3%" align="left">&nbsp;</td>
									<td width="32%" align="left">
									<label>
									<select id="phones0.phoneType" name="phones[<c:out value='${fn:length(person.phones)}'/>].phoneType" class="refTypeSelect">
										<c:forEach var="item" items="${personPhoneTypes}">
											<option value="${item.id}">${item.name}</option>
										</c:forEach>
									</select>
									</label>
									</td>
									<td width="3%">&nbsp;</td>
									<td width="10%">
									<a href="javascript:void(0)"><img class="add" src="resources/images/IconPlus.jpg" border="0" />
									</a>									
									</td>
								</tr>
						</c:if> 
						<c:if test="${empty person.phones}">
						<tr>
								<td width="48%" align="left" valign="middle">
								<input id="persphonenumber0" name="phones[0].phoneNumber" maxlength="20"  type="text" value="" class="refTypeText"/>
								</td>
								<td width="3%" align="left">&nbsp;</td>
								<td width="32%" align="left">
								<label> 
									<select id="phones0.phoneType" name="phones[0].phoneType" class="refTypeSelect">
										<c:forEach var="item" items="${personPhoneTypes}">
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
						</div>
						<!--legendContainerM end-->
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td><div id="legendContainerM">
								<!--legendContainerM Start-->
								<fieldset>
									<legend class="legHeadH2">Email Addresses</legend>
									<div id="legenInnerContainer">
										<!--Inner legend Container Start-->
										<table id="personEmailsTable" width="100%" border="0" cellpadding="0" cellspacing="2">
											<c:if test="${not empty person.emails}">
							<c:forEach items="${person.emails}" var="emails" 
								varStatus="itrStatus">
										<tr>
												<td width="40%" align="left" valign="middle">
													<form:input id="personemails${itrStatus.index}" path="emails[${itrStatus.index}].emailAddress" maxlength="100"  readonly="${emails.isGALRecord}" cssClass="refTypeText"/> 
													<form:hidden path="emails[${itrStatus.index}].emailId" />
												</td>
												<td width="3%" align="left">&nbsp;</td>
												<td width="33%" align="left"><label> 
													<form:select path="emails[${itrStatus.index}].emailType" items="${emailTypes}" itemLabel="name" cssClass="refTypeSelect" />
													<form:hidden path="emails[${itrStatus.index}].isGALRecord"/>
												</label></td>
												<td width="6%">&nbsp;</td>
												<td width="18%">
												<c:if test="${!emails.isGALRecord}">
												<a href="javascript:void(0)">												
												<img class="del" src="resources/images/IconMinus.jpg" border="0" />
												</a>
												</c:if>
												</td>
											</tr>
							</c:forEach>
							<tr><td width="40%" align="left" valign="middle">
									<input id="personemails<c:out value='${fn:length(person.emails)}'/>" name="emails[<c:out value='${fn:length(person.emails)}'/>].emailAddress" maxlength="100"  type="text" value="" class="refTypeText"/>
									</td><td width="3%" align="left">&nbsp;</td>
									<td width="33%" align="left"><label>
									<select id="emails'<c:out value='${fn:length(person.emails)}'/>.emailType" name="emails[<c:out value='${fn:length(person.emails)}'/>].emailType" class="refTypeSelect">
									<c:forEach var="item" items="${emailTypes}">
									<option value="${item.id}">${item.name}</option>
									</c:forEach>
									</select>
									</label></td><td width="6%">&nbsp;</td>
									<td width="18%"><a href="javascript:void(0)"><img class="add" src="resources/images/IconPlus.jpg" border="0"/></a></td>
							</tr>
						</c:if>
						<c:if test="${empty person.emails}">
							<tr>
									<td width="40%" align="left" valign="middle">
										<input id="personemails0"
										name="emails[0].emailAddress" maxlength="100"  type="text" value="" class="refTypeText"/>
									</td>
									<td width="3%" align="left">&nbsp;</td>
									<td width="33%" align="left"><label> 
										<select id="emails0.emailType" name="emails[0].emailType" class="refTypeSelect">
											<c:forEach var="item" items="${emailTypes}">
												<option value="${item.id}">${item.name}</option>
											</c:forEach>
										</select>
								</label></td>
								<td width="6%">&nbsp;</td>
								<td width="18%"><a href="javascript:void(0)"><img class="add"
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
						<td><a href="#" id="assoc_person_businessentity" onClick="javascript:linkBEPerson()"><img id="assocPerBusImg" src="resources/images/BtnLWBusiness.jpg"
								width="183" height="30" border="0" /></a></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td align="left"><table width="40%" border="0"
								cellpadding="0" cellspacing="0">
								<tr>
									<td width="25%" align="left"><a href="" id="create_person"><img
											src="resources/images/AddIcon.jpg" width="27" height="27" border="1" title="Create new Person"/></a></td>
									<c:if test="${person.personId gt 0 }">
										<td width="25%" align="left"><a href="#personUpdateConfirmModal" id="update_person"><img
											src="resources/images/EditIcon.jpg" width="27" height="27" border="1" title="Update this Person"/></a></td>
											
									</c:if>
									<td width="25%" align="left"><a href="#personDelConfirmModal" id="delete_person"><img
											src="resources/images/DeleteIcon.jpg" width="27" height="27"
											border="1" title="Delete this Person" /></a></td>
									<td width="25%" align="left"><a href="tiles_newPerson" id="person_reset"><img src="resources/images/ResetIcon.jpg"
											width="27" height="27" border="1" title="Clear this Person pane"/></a></td>
									<td>&nbsp;</td>
								</tr>
							</table></td>
					</tr>
				</table>
			</div>
			<!--PersonLeftForm end-->
			<div class="PersonBoxContainer">
				<!--PersonBoxContainer start-->
				<div class="BEpeopleHeight"></div>
				<div class="PersonpeopleIconList">
					<!--PersonpeopleIconList start-->
					
					<table width="100%" border="0" cellpadding="0" cellspacing="0">
					
					<c:choose>
							<c:when test="${not empty person.partyPhysicalAddresses}">								
								<c:forEach var="partyAddress"
									items="${person.partyPhysicalAddresses}"
									varStatus="item">
						<tr>
							<td align="center">
								<a id="personAddressLinks<c:out value="${item.index }"/>"
												href='javascript:void(0)' 
													onclick="javascript:displayAssocMenu('actionsDiv',event,'personAddressAssocAction',<c:out value="${partyAddress.address.addressId}"/>,<c:out value="${partyAddress.partyAddressId}"/>,<c:out value="${person.personId}"/>,<c:out value="${partyAddress.addressRole.id}"/>,'<c:out value="${person.sso}"/>','<c:out value="${item.index}"/>');">
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
	$("#personAddressLinks<c:out value="${item.index }"/>").attr('title', '<c:out value="${partyAddress.address.streetAddress}"/> <c:out value="${partyAddress.address.address2}"/> \n<c:out value="${partyAddress.address.address3}"/> <c:out value="${partyAddress.address.city}" /> <c:choose><c:when test="${ not empty partyAddress.address.state}"><c:out value="${partyAddress.address.state.name}"/></c:when><c:otherwise><c:out value="${partyAddress.address.stateOther}"/></c:otherwise></c:choose>-<c:out value="${partyAddress.address.postalCode}"/> \n<c:if test="${ not empty partyAddress.address.country}"><c:out value="${partyAddress.address.country.name}"/></c:if>');
</script>
								</span>
							</td>
						</tr>
						<tr>
							<td align="center">&nbsp;</td>
						</tr>
						</c:forEach>
						</c:when>
						</c:choose>
					</table>
				</div>
				<!--PersonpeopleIconList end-->
			</div>
			<!--PersonBoxContainer end-->
			<div class="ClearFloat"></div>
		</div>
		<!--InnerFormFieldContainer end-->

	</div>
	<!--BoxMid end-->
	<div class="BoxBot">
		<img src="resources/images/TableBot.jpg" width="522" height="13" border="0" />
	</div>
	<form:hidden path="personId" /> 
	<form:hidden path="partyId" />
	<form:hidden path="sso" /> 
	<form:hidden path="isGALRecord" />
	<form:hidden path="createdBy" />
	<form:hidden path="lastUpdatedBy" />
	<form:hidden path="lastUpdatedDateTime" />
	<form:hidden path="createdDateTime" />
	
	<a id="personFakeLink" href='#'></a>
	<a id="fakeBEPersonLink" href='#'></a>
	
	
	<div id="personConfirmboxes">	
		<%@include file="/WEB-INF/jsp/PersonDeleteConfirmBox.jsp"%>
		<%@include file="/WEB-INF/jsp/PersonUpdateConfirmBox.jsp"%>
	</div>
</form:form>
<a id="fakePersonDeleteLink" href='#'></a>
<a id="fakePersonUpdateLink" href='#'></a>

</body>
<script type="text/javascript">
	jQuery(document).ready(function() {
		$('personId').val(<c:out value="${person.personId}"/>);
		fnDisableAssocPersonLinks();
		fnDisableAssocBELinks();
		var selectedValue = '<c:out value="${searchString}"/>';
		var selectedId = '<c:out value="${selectedId}"/>';
		var url = './ajax_findPerson?dummy=dummy';
		jQuery("#searchString").autosuggest({
			url : url,
			elementName : 'selectedId',
			//defaultId : selectedId,
			width : '250px',
			height : 170,
			//defaultValue : selectedValue,
			onValueChange : 'ajax_getPerson()',
			minCharacters : 2
		});
		
		Spring.addDecoration(new Spring.AjaxEventDecoration({
			elementId : "fakePersonUpdateLink",
			formId : "tiles_person_form",
			event : "onclick",
			params : {
				fragments : "person",
				operation : "savePerson"
			}
		}));
		
		$('#save_person').click(function (e) {
			
			var commentsToUpdatePerson = $.trim($('#commentsToUpdatePerson').val());
			if(commentsToUpdatePerson == ''){
				$("#updatePersonCommentsErrorMessage").css('visibility', 'visible');
				return false;
			}else{
				$("#updatePersonCommentsErrorMessage").css('visibility', 'hidden');	
			}
				
			var formAction = "tiles_submitPerson";
			$("#tiles_person_form").attr("action", formAction);
			
			if (document.createEventObject) {
				// dispatch for IE    	
				return document.getElementById("fakePersonUpdateLink") 
						.fireEvent('onclick');
			} else {
				// dispatch for firefox + others
				var evt = document.createEvent("HTMLEvents");
				evt.initEvent('click', true, true); // event type,bubbling,cancelable
				return !document.getElementById("fakePersonUpdateLink")
						.dispatchEvent(evt);
			}
			document.getElementById("fakePersonUpdateLink").onClick(); 
		});	
		
		$('#personPhonesTable').delegate('.add', 'click', function(e) {
			var rowCount = $('#personPhonesTable tr').length;
			var checkRow = rowCount-1;
			if($("#persphonenumber"+checkRow).val() != "")
			{	
				$(this).attr('src','resources/images/IconMinus.jpg');
				$(this).attr('class','del');
	 			var newRow = '<tr><td width="48%" align="left" valign="middle">'
					+'<input id="persphonenumber'+rowCount+'" name="phones['+rowCount+'].phoneNumber" maxlength="20"  type="text" value="" class="refTypeText"/></td>'
					+'<td width="3%" align="left">&nbsp;</td>'
					+'<td width="32%" align="left"><label>'
					+'<select id="phones'+rowCount+'.phoneType" name="phones['+rowCount+'].phoneType" class="refTypeSelect">'
					+'<c:forEach var="item" items="${personPhoneTypes}">'
					+'<option value="${item.id}">${item.name}</option> </c:forEach>'
					+'</select></label></td>'
					+'<td width="3%">&nbsp;</td>'
					+'<td width="10%"><a href="javascript:void(0)"><img class="add" src="resources/images/IconPlus.jpg" border="0" /></a></td></tr>';
				$("#personPhonesTable").append(newRow);
			}
		});
	
		$('#personPhonesTable').delegate('.del', 'click', function(e) {
			$(this).closest("tr").remove();
		});
		
		$('#personEmailsTable').delegate('.add', 'click', function(e) {
			var rowCount = $('#personEmailsTable tr').length;
			var checkRow = rowCount-1;
			if($("#personemails"+checkRow).val() != "")
			{
				$(this).attr('src','resources/images/IconMinus.jpg');
				$(this).attr('class','del');
				var newRow = '<tr><td width="40%" align="left" valign="middle">'
						+'<input id="personemails'+rowCount+'" name="emails['+rowCount+'].emailAddress" maxlength="100"  type="text" value="" class="refTypeText"/>'
						+'</td><td width="3%" align="left">&nbsp;</td>'
						+'<td width="33%" align="left"><label>'
						+'<select id="emails'+rowCount+'.emailType" name="emails['+rowCount+'].emailType" class="refTypeSelect">'
						+' <c:forEach var="item" items="${emailTypes}">'
						+'<option value="${item.id}">${item.name}</option>'
						+' </c:forEach>'
						+'</select>'
						+'</label></td><td width="6%">&nbsp;</td>'
						+'<td width="18%"><a href="javascript:void(0)"><img class="add" src="resources/images/IconPlus.jpg" border="0"/></a></td></tr>';
				$("#personEmailsTable").append(newRow);
			}
		});

		$('#personEmailsTable').delegate('.del', 'click', function(e) {
			$(this).closest("tr").remove();
		});
	
		document.onclick = function(){
			closeMenuPopups();
		}
		$('#mask').hide();
		$('.window').hide();
		closeMenuPopups();
	});
	/*
	 function ajax_getPerson() {
	 $.getJSON("ajax_getPerson", {personId : $('#personId1').val()},
	 function (data) {
	 $('#personId').val(data.personId);
	 $('#partyId').val(data.personId);
	 $('#firstName').val(data.firstName);
	 $('#lastName').val(data.lastName);
	 $('#createdBy').val(data.createdBy);
	 $('#sso').val(data.sso);
	 $('#person1').html("<table><tr><td>"+data.firstName+"</td><td>"+data.lastName+"</td></tr></table>");
	 }
	 )
	 .error(function(){alert("error");});
	 }
	 */
	Spring.addDecoration(new Spring.AjaxEventDecoration({
		elementId : "create_person",
		formId : "tiles_person_form",
		event : "onclick",
		params : {
			fragments : "person",
			operation : "createPerson"
		}
	}));
	 

	 
	Spring.addDecoration(new Spring.AjaxEventDecoration({
		elementId : "fakeBEPersonLink",
		formId : "tiles_person_form",
		event : "onclick",
		params : {
			fragments : "person,businessEntity",
			operation : "assoicatePersonToBusinessEntity"
		}
	}));
	
	Spring.addDecoration(new Spring.AjaxEventDecoration({
		elementId : "fakePersonDeleteLink",
		formId : "tiles_person_form",
		event : "onclick",
		params : {
			fragments : "person",
			operation : "deletePerson"
		}
	}));
	
	$('#confirmPersonDelete').click(function (e) {
		
		var commentsToDeletePerson = $.trim($('#commentsToDeletePerson').val());
		if(commentsToDeletePerson == ''){
			$("#deletePersonCommentsErrorMessage").css('visibility', 'visible');
			return false;
		}else{
			$("#deletePersonCommentsErrorMessage").css('visibility', 'hidden');	
		}
			
		var formAction = "tiles_submitPerson";
		$("#tiles_person_form").attr("action", formAction);
		
		if (document.createEventObject) {
			// dispatch for IE    	
			return document.getElementById("fakePersonDeleteLink") 
					.fireEvent('onclick');
		} else {
			// dispatch for firefox + others
			var evt = document.createEvent("HTMLEvents");
			evt.initEvent('click', true, true); // event type,bubbling,cancelable
			return !document.getElementById("fakePersonDeleteLink")
					.dispatchEvent(evt);
		}
		document.getElementById("fakePersonDeleteLink").onClick(); 
	});	
	

	function ajax_getPerson() {
		var currDate = new Date();
		if($('#searchGAL').is(':checked')){
			document.getElementById("personFakeLink").href = "tiles_getPerson?sso="
				+ $('#selectedId').val()
				+ "&searchString="
				+ encodeURIComponent($('#searchString').val())
				+"&searchGAL=true"
				+ "&currDate="
				+ currDate.toString();
		}else{
		document.getElementById("personFakeLink").href = "tiles_getPerson?personId="
				+ $('#selectedId').val()
				+ "&searchString="
				+ encodeURIComponent($('#searchString').val())
				+"&searchGAL=false"
				+ "&currDate="
				+ currDate.toString();
		}
			
		if (document.createEventObject) {
			// dispatch for IE    	
			return document.getElementById("personFakeLink").fireEvent(
					'onclick');
		} else {
			// dispatch for firefox + others
			var evt = document.createEvent("HTMLEvents");
			evt.initEvent('click', true, true); // event type,bubbling,cancelable
			return !document.getElementById("personFakeLink")
					.dispatchEvent(evt);
		}
		document.getElementById("personFakeLink").onClick();
	}

	Spring.addDecoration(new Spring.AjaxEventDecoration({
		elementId : "personFakeLink",
		event : "onclick",
		params : {
			fragments : "person"
		}
	}));

	Spring.addDecoration(new Spring.AjaxEventDecoration({
		elementId : "person_reset",
		event : "onclick",
		params : {
			fragments : "person"
		}
	}));
	
	function fnDisableAssocPersonLinks(){
		if($('#personId').val()=='0' ){
			$('#assocPersAddrImg').attr('src','resources/images/BtnLWpersonDis.jpg');
			$('#modalPersonAddrId').attr('class','disabled');
		}else{
			if($('#personId').val() !='0' ){
				$('#assocPersAddrImg').attr('src','resources/images/BtnLWperson.jpg');
				$('#modalPersonAddrId').attr('class','enabled'); 
			}
		}
	}
	
	function displayAssocMenu(divId,event,action,objId,assocId,partyId,roleId,sso,index,payeeNo) {
		document.getElementById(divId).innerHTML = getDivContent(action,objId,assocId,partyId,roleId,sso,index,payeeNo);   
		executeJavaScripts(divId);
		getRelativeDivPosition(divId,event);
		displayPopup(divId); 
	}

	function getDivContent(action,objId,assocId,partyId,roleId,sso,index,payeeNo) {
		if(action == "personAddressAssocAction") {
			return getPerAddrAssocActionContent(objId,assocId,partyId,roleId,sso,index);
		}else if(action == "beAddressAssocAction"){
			return getBEAddrAssocActionContent(objId,assocId,partyId,roleId,index,payeeNo);
		}else if(action == "bePersonAssocAction"){
			return getBEPersonAssocActionContent(objId,assocId,partyId,index);	
		}
	 }

	function getRelativeDivPosition(id,event) {
		var cursor = {x:0, y:0};
		cursor = getPosition(id,event,cursor);
		jQuery("#"+id).css({'top': cursor.y, 'left': cursor.x});
	 }

	 function getPosition(id,e,cursor) {
		e = e || window.event;
		if (e.pageX || e.pageY) {
    		cursor.x = e.pageX;
   			cursor.y = e.pageY;
		} 
		else {
			var de = document.documentElement;
			var b = document.body;
			cursor.x = e.clientX + (de.scrollLeft || b.scrollLeft) - (de.clientLeft || 0);
			cursor.y = e.clientY + (de.scrollTop || b.scrollTop) - (de.clientTop || 0);
		}
	return cursor;
	}

	function displayPopup(id) {
		popUpLinkClicked = 'true';
		document.getElementById(id).style.visibility = 'visible';
		id ='#'+id;
		jQuery(id).show("slow"); 
	 }

	 function getPerAddrAssocActionContent(objId,assocId,partyId,roleId,sso,index) {
			var str =  "<div id=\"highlight\"><table><tr><td nowrap style=\"padding: 0px 5px;\"><a id =\"viewPhysicalAddress"+index+"\" href=\"./tiles_getPhysicalAddress?physicalAddressId="+objId+"&sso="+sso+"\" style=\"text-decoration:none\">View Address</a></td></tr>";
			str=str+'<script type="text/javascript">';
			str=str+'Spring.addDecoration(new Spring.AjaxEventDecoration({';
			str=str+'elementId : "viewPhysicalAddress'+index+'",';
			str=str+'event : "onclick",';
			str=str+'params : {fragments : "physicalAddress",operationType :"deletePersonAddress"}}));<\/script>';	
			str=str+ "<tr><td nowrap style=\"padding: 0px 5px;\"><a id =\"deletePersonAddress"+index+"\" href=\"javascript:void(0)\" style=\"text-decoration:none\" >Delete</a></td></tr>";
			
			str=str+'<script type="text/javascript">';
			str=str+"$('#deletePersonAddress"+index+"').click(function(e) {";
			str=str+" closeMenuPopups();";
			str=str+"$('#personAddressId').val('"+assocId+"');";
			str=str+"$('#partyPersonId').val('"+partyId+"');";
			str=str+"e.preventDefault();";
			str=str+"var id = '#modalPersonAddressAssocDelete';";
			str=str+"var maskHeight = $(document).height();";
			str=str+"var maskWidth = $(window).width();";
			str=str+"$('#mask').css({'width':maskWidth,'height':maskHeight});";
			str=str+"$('#mask').fadeIn(1000);"	;
			str=str+"$('#mask').fadeTo(\"slow\",0.8);";	
			str=str+"var winH = $(window).height();";
			str=str+"var winW = $(window).width();";
			str=str+"$(id).css('top',  winH/2-$(id).height()/2);";
			str=str+"$(id).css('left', winW/2-$(id).width()/2);";
			str=str+"$(id).fadeIn(2000);";
			str=str+"});<\/script>";
			
			str=str+ "<tr><td nowrap style=\"padding: 0px 5px;\"><a href=\"javascript:void(0)\" id=\"editPersonAddressAssoc"+index+"\"  style=\"text-decoration:none\">Edit Role</a></td></tr>";
			str=str+'<script type="text/javascript">';
			str=str+"$('#editPersonAddressAssoc"+index+"').click(function(e) {";
			str=str+" closeMenuPopups();";
			str=str+"$('#addressPersonRoles').val("+roleId+");";
			str=str+"$('#associate_address_person').hide();";
			str=str+"$('#save_person_address_role').show();";
			str=str+"$('#commentsToUpdateForPerAddressAssoc').show();";
			str=str+"$('#commentsToUpdateForPerAddressAssocTextArea').show();";
			//alert("show");
			str=str+"$('#editPersPartyAddressId').val('"+assocId+"');";
			str=str+"$('#editPersPartyId').val('"+partyId+"');";
			str=str+"e.preventDefault();";
			str=str+"var id = '#modalPersonAddr';";
			str=str+"var maskHeight = $(document).height();";
			str=str+"var maskWidth = $(window).width();";
			str=str+"$('#mask').css({'width':maskWidth,'height':maskHeight});";
			str=str+"$('#mask').fadeIn(1000);"	;
			str=str+"$('#mask').fadeTo(\"slow\",0.8);";	
			str=str+"var winH = $(window).height();";
			str=str+"var winW = $(window).width();";
			str=str+"$(id).css('top',  winH/2-$(id).height()/2);";
			str=str+"$(id).css('left', winW/2-$(id).width()/2);";
			str=str+"$(id).fadeIn(2000);";
			str=str+"});<\/script>";
			str=str+"</table></div>";
			return str;
		}
	 
		 function getBEAddrAssocActionContent(objId,assocId,partyId,roleId,index,payeeNo) {
			 var str =  "<div id=\"highlight\"><table><tr><td nowrap style=\"padding: 0px 5px;\"><a id =\"viewPhysicalAddress"+index+"\" href=\"./tiles_getPhysicalAddress?physicalAddressId="+objId+"\" style=\"text-decoration:none\">View Address</a></td></tr>";
				str=str+'<script type="text/javascript">';
				str=str+'Spring.addDecoration(new Spring.AjaxEventDecoration({';
				str=str+'elementId : "viewPhysicalAddress'+index+'",';
				str=str+'event : "onclick",';
				str=str+'params : {fragments : "physicalAddress"}}));<\/script>';	
				str=str+ "<tr><td nowrap style=\"padding: 0px 5px;\"><a id =\"deleteBEAddress"+index+"\" href=\"javascript:void(0)\" style=\"text-decoration:none\" >Delete</a></td></tr>";
				
				str=str+'<script type="text/javascript">';
				str=str+"$('#deleteBEAddress"+index+"').click(function(e) {";
				/* str=str+" alert('"+assocId+"');";
				str=str+" alert('"+partyId+"');"; */
				str=str+" closeMenuPopups();";
				str=str+"$('#bePartyAddressId').val('"+assocId+"');";
				str=str+"$('#bePartyId').val('"+partyId+"');";
				str=str+"e.preventDefault();";
				str=str+"var id = '#modalBusinessAddrAssocDelete';";
				str=str+"var maskHeight = $(document).height();";
				str=str+"var maskWidth = $(window).width();";
				str=str+"$('#mask').css({'width':maskWidth,'height':maskHeight});";
				str=str+"$('#mask').fadeIn(1000);"	;
				str=str+"$('#mask').fadeTo(\"slow\",0.8);";	
				str=str+"var winH = $(window).height();";
				str=str+"var winW = $(window).width();";
				str=str+"$(id).css('top',  winH/2-$(id).height()/2);";
				str=str+"$(id).css('left', winW/2-$(id).width()/2);";
				str=str+"$(id).fadeIn(2000);";
				str=str+"});<\/script>";
								
				str=str+ "<tr><td nowrap style=\"padding: 0px 5px;\"><a href=\"javascript:void(0)\" id=\"editBEAddressAssoc"+index+"\"  style=\"text-decoration:none\">Edit Role</a></td></tr>";
				str=str+'<script type="text/javascript">';
				str=str+"$('#editBEAddressAssoc"+index+"').click(function(e) {";
				str=str+" closeMenuPopups();";
				str=str+" populateAddressRoleOnLoad("+roleId+");";
				str=str+"$('#editAddressRolesId').val("+roleId+");";
				str=str+"$('#assoc_addr_businessentity').hide();";
				str=str+"$('#save_be_address_role').show();";
				str=str+"$('#commentsForBEAddress').show();";
				str=str+"$('#editBEPartyAddressId').val('"+assocId+"');";
				str=str+"$('#editBEPartyId').val('"+partyId+"');";
				str=str+"$('#sapPayeeNo').val('"+payeeNo+"');";
				
				
				str=str+"e.preventDefault();";
				str=str+"var id = '#modalBusEntyAddr';";
				str=str+"var maskHeight = $(document).height();";
				str=str+"var maskWidth = $(window).width();";
				str=str+"$('#mask').css({'width':maskWidth,'height':maskHeight});";
				str=str+"$('#mask').fadeIn(1000);"	;
				str=str+"$('#mask').fadeTo(\"slow\",0.8);";	
				str=str+"var winH = $(window).height();";
				str=str+"var winW = $(window).width();";
				str=str+"$(id).css('top',  winH/2-$(id).height()/2);";
				str=str+"$(id).css('left', winW/2-$(id).width()/2);";
				str=str+"$(id).fadeIn(2000);";
				str=str+"});<\/script>";
				str=str+"</table></div>";
				return str; 
			}
	 
		 
		 function getBEPersonAssocActionContent(objId,assocId,partyId,index) {
				var str =  "<div id=\"highlight\"><table><tr><td nowrap style=\"padding: 0px 5px;\"><a id =\"viewPerson"+index+"\" href=\"./tiles_getPerson?personId="+objId+"\" style=\"text-decoration:none\">View Person</a></td></tr>";
				str=str+'<script type="text/javascript">';
				str=str+'Spring.addDecoration(new Spring.AjaxEventDecoration({';
				str=str+'elementId : "viewPerson'+index+'",';
				str=str+'event : "onclick",';
				str=str+'params : {fragments : "person"}}));<\/script>';	
				str=str+ "<tr><td nowrap style=\"padding: 0px 5px;\"><a id =\"deleteBEPerson"+index+"\" href=\"javascript:void(0)\" style=\"text-decoration:none\" >Delete</a></td></tr>";
				
				str=str+'<script type="text/javascript">';
				str=str+"$('#deleteBEPerson"+index+"').click(function(e) {";
				/* str=str+" alert('"+partyId+"');";
				str=str+" alert('"+assocId+"');";  */
				str=str+" closeMenuPopups();";
				str=str+"$('#beDeleteID').val('"+partyId+"');";
				str=str+"$('#contactId').val('"+assocId+"');";
				str=str+"e.preventDefault();";
				str=str+"var id = '#modalBEPersonAssocDelete';";
				str=str+"var maskHeight = $(document).height();";
				str=str+"var maskWidth = $(window).width();";
				str=str+"$('#mask').css({'width':maskWidth,'height':maskHeight});";
				str=str+"$('#mask').fadeIn(1000);"	;
				str=str+"$('#mask').fadeTo(\"slow\",0.8);";	
				str=str+"var winH = $(window).height();";
				str=str+"var winW = $(window).width();";
				str=str+"$(id).css('top',  winH/2-$(id).height()/2);";
				str=str+"$(id).css('left', winW/2-$(id).width()/2);";
				str=str+"$(id).fadeIn(2000);";
				str=str+"});<\/script>";
				
				str=str+"</table></div>";
				return str;
			}
		 
	    function executeJavaScripts(divId) {  
			 var div = document.getElementById(divId);
			 if(div)
			 {
				var x = div.getElementsByTagName("script");
				for( var i=0; i < x.length; i++) {  
				eval(x[i].text); 
			 }
			 }
		}
	    
		var popUpLinkClicked  = 'true';
		function closeMenuPopups(){
			if(popUpLinkClicked == 'false')
			{
				jQuery(".divPopup").hide(1000);
				popUpLinkClicked  = 'true';
			}
			else if(popUpLinkClicked == 'true')	
			{
				popUpLinkClicked = 'false';
			}
		}
		
		function linkBEPerson () {
			var businessEntityId = $('#businessEntityId').val();
			if(businessEntityId != '0')
			{
				var formAction = "tiles_submitPerson?businessEntityId="+businessEntityId;
				$("#tiles_person_form").attr("action", formAction);
				if (document.createEventObject) {
					// dispatch for IE    	
					return document.getElementById("fakeBEPersonLink")
							.fireEvent('onclick');
				} else {
					// dispatch for firefox + others
					var evt = document.createEvent("HTMLEvents");
					evt.initEvent('click', true, true); // event type,bubbling,cancelable
					return !document.getElementById("fakeBEPersonLink")
							.dispatchEvent(evt);
				}
				document.getElementById("fakeBEPersonLink").onClick();
			}
		}
		
		$('#delete_person').click(function(e) {

			if($('#personId').val()!='0'){
				//Cancel the link behavior
				e.preventDefault();
				//Get the A tag
				var id = '#personDelConfirmModal';
			
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
		
		$('#update_person').click(function(e) {

			if($('#personId').val()!='0'){
				//Cancel the link behavior
				e.preventDefault();
				//Get the A tag
				var id = '#personUpdateConfirmModal';
			
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

		$('#cancelPersonDelete').click(function (e) {
			//Cancel the link behavior
			e.preventDefault();
			
			$('#mask').hide();
			$('.window').hide();
		});	
		
		$('#cancelPersonUpdate').click(function (e) {
			//Cancel the link behavior
			e.preventDefault();
			
			$('#mask').hide();
			$('.window').hide();
		});	
	
</script>
<%System.out.println("Exiting tiles_personDetails jsp"); %>
</html>
