<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'incidentLog.label', default: 'IncidentLog')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-incidentLog" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                  default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="show-incidentLog" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list incidentLog">

        <g:if test="${incidentLogInstance?.date}">
            <li class="fieldcontain">
                <span id="date-label" class="property-label"><g:message code="incidentLog.date.label"
                                                                        default="Date"/></span>

                <span class="property-value" aria-labelledby="date-label"><g:formatDate
                        date="${incidentLogInstance?.date}"/></span>

            </li>
        </g:if>

        <g:if test="${incidentLogInstance?.resolution}">
            <li class="fieldcontain">
                <span id="resolution-label" class="property-label"><g:message code="incidentLog.resolution.label"
                                                                              default="Resolution"/></span>

                <span class="property-value" aria-labelledby="resolution-label"><g:fieldValue
                        bean="${incidentLogInstance}" field="resolution"/></span>

            </li>
        </g:if>

    </ol>
    <g:form>
        <fieldset class="buttons">
            <g:hiddenField name="id" value="${incidentLogInstance?.id}"/>
            <g:link class="edit" action="edit" id="${incidentLogInstance?.id}"><g:message
                    code="default.button.edit.label" default="Edit"/></g:link>
            <g:actionSubmit class="delete" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
