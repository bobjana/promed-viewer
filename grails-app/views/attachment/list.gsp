<!doctype html>
<html>
<body>

<table>
    <thead>
    <tr>
        <th>${message(code: 'attachment.name.heading.label', default: 'Name')}</th>
        <th>${message(code: 'attachment.description.heading.label', default: 'Description')}</th>
    </tr>
    </thead>
    <tbody>

    <g:each in="${attachments}" status="i" var="attachmentInstance">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
            <td><g:link controller="attachment" action="download" params="[id:attachmentInstance.id]">${attachmentInstance.name}</g:link></td>
            <td>${fieldValue(bean: attachmentInstance, field: "description")}</td>
        </tr>
    </g:each>
    </tbody>
</table>
</body>
</html>
