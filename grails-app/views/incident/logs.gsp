<!doctype html>
<html>
<body>

<table>
    <thead>
    <tr>
        <th style="width:10em">${message(code: 'incidentLog.date.label', default: 'Date')}</th>
        <th>${message(code: 'incidentLog.resolution.label', default: 'Resolution')}</th>
    </tr>
    </thead>
    <tbody>

    <g:each in="${incidentLogInstanceList}" status="i" var="incidentLogInstance">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
            <td><g:formatDate date="${incidentLogInstance.date}" /></td>
            <td>${fieldValue(bean: incidentLogInstance, field: "resolution")}</td>
        </tr>
    </g:each>
    </tbody>
</table>
</body>
</html>
