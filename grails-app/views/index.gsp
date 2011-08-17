<!doctype html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
    <sec:ifNotLoggedIn>
		<meta http-equiv="Refresh" content="0; URL=login"/>
    </sec:ifNotLoggedIn>
	<sec:ifLoggedIn>
		<meta http-equiv="Refresh" content="0; URL=incident/list"/>
	</sec:ifLoggedIn>
</head>
</html>
