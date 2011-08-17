

<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'incident.label', default: 'Incident')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-incident" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-incident" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list incident">
			
				<g:if test="${incidentInstance?.agent}">
				<li class="fieldcontain">
					<span id="agent-label" class="property-label"><g:message code="incident.agent.label" default="Agent" /></span>
					
						<span class="property-value" aria-labelledby="agent-label"><g:fieldValue bean="${incidentInstance}" field="agent"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${incidentInstance?.createdOn}">
				<li class="fieldcontain">
					<span id="createdOn-label" class="property-label"><g:message code="incident.createdOn.label" default="Created On" /></span>
					
						<span class="property-value" aria-labelledby="createdOn-label"><g:formatDate date="${incidentInstance?.createdOn}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${incidentInstance?.customer}">
				<li class="fieldcontain">
					<span id="customer-label" class="property-label"><g:message code="incident.customer.label" default="Customer" /></span>
					
						<span class="property-value" aria-labelledby="customer-label"><g:fieldValue bean="${incidentInstance}" field="customer"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${incidentInstance?.dueBy}">
				<li class="fieldcontain">
					<span id="dueBy-label" class="property-label"><g:message code="incident.dueBy.label" default="Due By" /></span>
					
						<span class="property-value" aria-labelledby="dueBy-label"><g:formatDate date="${incidentInstance?.dueBy}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${incidentInstance?.incidentType}">
				<li class="fieldcontain">
					<span id="incidentType-label" class="property-label"><g:message code="incident.incidentType.label" default="Incident Type" /></span>
					
						<span class="property-value" aria-labelledby="incidentType-label"><g:fieldValue bean="${incidentInstance}" field="incidentType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${incidentInstance?.outline}">
				<li class="fieldcontain">
					<span id="outline-label" class="property-label"><g:message code="incident.outline.label" default="Outline" /></span>
					
						<span class="property-value" aria-labelledby="outline-label"><g:fieldValue bean="${incidentInstance}" field="outline"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${incidentInstance?.priority}">
				<li class="fieldcontain">
					<span id="priority-label" class="property-label"><g:message code="incident.priority.label" default="Priority" /></span>
					
						<span class="property-value" aria-labelledby="priority-label"><g:fieldValue bean="${incidentInstance}" field="priority"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${incidentInstance?.reference}">
				<li class="fieldcontain">
					<span id="reference-label" class="property-label"><g:message code="incident.reference.label" default="Reference" /></span>
					
						<span class="property-value" aria-labelledby="reference-label"><g:fieldValue bean="${incidentInstance}" field="reference"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${incidentInstance?.statusDescription}">
				<li class="fieldcontain">
					<span id="statusDescription-label" class="property-label"><g:message code="incident.statusDescription.label" default="Status Description" /></span>
					
						<span class="property-value" aria-labelledby="statusDescription-label"><g:fieldValue bean="${incidentInstance}" field="statusDescription"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${incidentInstance?.statusId}">
				<li class="fieldcontain">
					<span id="statusId-label" class="property-label"><g:message code="incident.statusId.label" default="Status Id" /></span>
					
						<span class="property-value" aria-labelledby="statusId-label"><g:fieldValue bean="${incidentInstance}" field="statusId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${incidentInstance?.worker}">
				<li class="fieldcontain">
					<span id="worker-label" class="property-label"><g:message code="incident.worker.label" default="Worker" /></span>
					
						<span class="property-value" aria-labelledby="worker-label"><g:fieldValue bean="${incidentInstance}" field="worker"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${incidentInstance?.id}" />
					<g:link class="edit" action="edit" id="${incidentInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
