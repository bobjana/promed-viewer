

<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'incidentLog.label', default: 'IncidentLog')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-incidentLog" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-incidentLog" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>

						<g:sortableColumn property="date" title="${message(code: 'incidentLog.date.label', default: 'Date')}" />

						<g:sortableColumn property="resolution" title="${message(code: 'incidentLog.resolution.label', default: 'Resolution')}" />

					</tr>
				</thead>
				<tbody>
				<g:each in="${incidentLogInstanceList}" status="i" var="incidentLogInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

						<td><g:link action="show" id="${incidentLogInstance.id}">${fieldValue(bean: incidentLogInstance, field: "date")}</g:link></td>

						<td>${fieldValue(bean: incidentLogInstance, field: "resolution")}</td>

					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${incidentLogInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
