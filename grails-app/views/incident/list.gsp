<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'incident.label', default: 'Incident')}" />
		<title>Promed Incidents Viewer</title>

        <script>

            function load(id) {
                $('#dialogDiv').load("logs",
                     {
                       incidentId:id
                     },
                     function(data) {
                       $('#dialogDiv').html(data);
                       $('#dialogDiv').dialog('open')
                     }
                );
            }

            function toggleShowAll(){
               parent.location='toggleShowAll'
            }
        </script>
    </head>

	<body>
		<a href="#list-incident" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><g:checkBox name="showAll" checked="${session.showAll}" onclick="toggleShowAll()" value="Show All"/> Show All</li>
			</ul>
		</div>
		<div id="list-incident" class="content scaffold-list" role="main">
			<g:if test="${flash.message}">
			    <div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="reference" title="${message(code: 'incident.reference.label', default: 'Reference')}" />
                        <g:sortableColumn style="min-width:8em;" property="createdOn" title="${message(code: 'incident.createdOn.label', default: 'Created On')}"/>
                        <g:sortableColumn style="min-width:8em;" property="dueBy" title="${message(code: 'incident.dueBy.label', default: 'Due By')}" />

                        <g:sortableColumn property="incidentType" title="${message(code: 'incident.incidentType.label', default: 'Type')}" />
                        <g:sortableColumn style="min-width:50em;" property="outline" title="${message(code: 'incident.outline.label', default: 'Outline')}" />
                        %{--<g:sortableColumn property="statusId" title="${message(code: 'incident.statusId.label', default: 'Status ID')}" />--}%
                        <g:sortableColumn style="min-width:8em;" property="statusDescription" title="${message(code: 'incident.statusDescription.label', default: 'Status')}" />

                        <g:sortableColumn style="min-width:8em;" property="priority" title="${message(code: 'incident.priority.label', default: 'Priority')}" />
                        <g:sortableColumn style="min-width:15em;" property="customer" title="${message(code: 'incident.customer.label', default: 'Customer')}" />
                        <g:sortableColumn style="min-width:8em;"  property="agent" title="${message(code: 'incident.agent.label', default: 'Agent')}" />
                        <g:if test="${session.showAll}">
                            <g:sortableColumn style="min-width:8em;" property="worker" title="${message(code: 'incident.worker.label', default: 'Worker')}" />
                        </g:if>

					</tr>
				</thead>
				<tbody>
				<g:each in="${incidentInstanceList}" status="i" var="incidentInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                        <td><a onclick="load(${incidentInstance.id})">${fieldValue(bean: incidentInstance, field: "reference")}</a></td>

                        <td><g:formatDate date="${incidentInstance.createdOn}" /></td>
                        <td><g:formatDate date="${incidentInstance.dueBy}" /></td>

                        <td>${fieldValue(bean: incidentInstance, field: "incidentType")}</td>
                        <td>${fieldValue(bean: incidentInstance, field: "outline")}</td>
                        %{--<td>${fieldValue(bean: incidentInstance, field: "statusId")}</td>--}%
                        <td>${fieldValue(bean: incidentInstance, field: "statusDescription")}</td>

                        <td>${fieldValue(bean: incidentInstance, field: "priority")}</td>
                        <td>${fieldValue(bean: incidentInstance, field: "customer")}</td>
                        <td>${fieldValue(bean: incidentInstance, field: "agent")}</td>
                        <g:if test="${session.showAll}">
                            <td>${fieldValue(bean: incidentInstance, field: "worker")}</td>
                        </g:if>

					</tr>
				</g:each>
				</tbody>
			</table>
        </div>
         <div class="pagination">
            <g:paginate total="${incidentInstanceTotal}" />
        </div>

        <div id="dialogDiv" title="Logs"></div>
         <jqueryui:jquiDialog
            id="dialogDiv"
            dialog="grails.jqueryui.components"
            config="${[
                    modal : true ,
                    buttons: [Ok: '@window.modalOK_Click'],
                    autoOpen: false,
                    minWidth: 700,
                    maxHeight: 300
                    ]}"/>

	</body>
</html>
