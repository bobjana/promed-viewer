



<div class="fieldcontain ${hasErrors(bean: incidentInstance, field: 'agent', 'error')} ">
	<label for="agent">
		<g:message code="incident.agent.label" default="Agent" />
		
	</label>
	<g:textField name="agent" value="${incidentInstance?.agent}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: incidentInstance, field: 'createdOn', 'error')} required">
	<label for="createdOn">
		<g:message code="incident.createdOn.label" default="Created On" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="createdOn" precision="day" value="${incidentInstance?.createdOn}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: incidentInstance, field: 'customer', 'error')} ">
	<label for="customer">
		<g:message code="incident.customer.label" default="Customer" />
		
	</label>
	<g:textField name="customer" value="${incidentInstance?.customer}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: incidentInstance, field: 'dueBy', 'error')} required">
	<label for="dueBy">
		<g:message code="incident.dueBy.label" default="Due By" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dueBy" precision="day" value="${incidentInstance?.dueBy}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: incidentInstance, field: 'incidentType', 'error')} ">
	<label for="incidentType">
		<g:message code="incident.incidentType.label" default="Incident Type" />
		
	</label>
	<g:textField name="incidentType" value="${incidentInstance?.incidentType}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: incidentInstance, field: 'outline', 'error')} ">
	<label for="outline">
		<g:message code="incident.outline.label" default="Outline" />
		
	</label>
	<g:textField name="outline" value="${incidentInstance?.outline}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: incidentInstance, field: 'priority', 'error')} ">
	<label for="priority">
		<g:message code="incident.priority.label" default="Priority" />
		
	</label>
	<g:textField name="priority" value="${incidentInstance?.priority}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: incidentInstance, field: 'reference', 'error')} ">
	<label for="reference">
		<g:message code="incident.reference.label" default="Reference" />
		
	</label>
	<g:textField name="reference" value="${incidentInstance?.reference}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: incidentInstance, field: 'statusDescription', 'error')} ">
	<label for="statusDescription">
		<g:message code="incident.statusDescription.label" default="Status Description" />
		
	</label>
	<g:textField name="statusDescription" value="${incidentInstance?.statusDescription}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: incidentInstance, field: 'statusId', 'error')} ">
	<label for="statusId">
		<g:message code="incident.statusId.label" default="Status Id" />
		
	</label>
	<g:textField name="statusId" value="${incidentInstance?.statusId}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: incidentInstance, field: 'worker', 'error')} ">
	<label for="worker">
		<g:message code="incident.worker.label" default="Worker" />
		
	</label>
	<g:textField name="worker" value="${incidentInstance?.worker}"/>
</div>

