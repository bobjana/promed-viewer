<!doctype html>
<html>
	<head>
		<title>Grails Runtime Exception</title>
		<meta name="layout" content="main">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'errors.css')}" type="text/css">
	</head>
	<body>
	    <dl class="error-details">
            <dt>Message</dt><dd>${exception.message?.encodeAsHTML()}</dd>
        </dl>

	</body>
</html>