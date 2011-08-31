<!doctype html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">


        <g:layoutHead/>

        <g:javascript library="jquery"/>
        <r:layoutResources/>

        <jqui:resources themeCss="${resource(dir: 'css/themes/redmond', file: 'jquery-ui-1.8.11.custom.css')}"/>
        %{--<jqui:resources/>--}%
        <link rel="stylesheet" href="${resource(dir:'css',file:'ui.jqgrid.css')}" />

        <jqueryui:javascript />
        <g:javascript src="i18n/grid.locale-en.js"/>
        <g:javascript src="jquery.jqGrid.min.js"/>
</head>
<body>
<div id=top_border></div>
<div role="banner" id="banner" style="overflow: hidden;">
        <div style="float: left;"><a href="http://www.promed.co.za" id="logo"><img src="${resource(dir: 'images', file: 'logo.png')}" alt="Logo"/></a></div>
        <div id="userDetails">
            <sec:ifLoggedIn>
                Welcome,<br/> <b><sec:loggedInUserInfo field="fullName"/></b><br/>
                <g:link controller='logout'>logout</g:link>
            </sec:ifLoggedIn>
        </div>
</div>
<g:layoutBody/>
%{--<div class="footer" role="contentinfo"></div>--}%
<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>



	</body>
</html>