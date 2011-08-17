<div class="fieldcontain ${hasErrors(bean: incidentLogInstance, field: 'date', 'error')} required">
    <label for="date">
        <g:message code="incidentLog.date.label" default="Date"/>
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="date" precision="day" value="${incidentLogInstance?.date}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: incidentLogInstance, field: 'resolution', 'error')} ">
    <label for="resolution">
        <g:message code="incidentLog.resolution.label" default="Resolution"/>

    </label>
    <g:textField name="resolution" value="${incidentLogInstance?.resolution}"/>
</div>

