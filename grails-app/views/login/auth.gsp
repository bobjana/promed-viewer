<head>
    <meta name='layout' content='main'/>
    <title><g:message code="springSecurity.login.title"/></title>
    <style type="text/css">

    #loginContainer {
        width: 350px;
        margin: 16px auto;
    }

    #innerContainer {
        font-size: 14px;
        border-left: 1px solid #CCCCCC;
        border-right: 1px solid #CCCCCC;
        margin-top: 30px;
    }

    </style>
</head>

<body>
<div id="loginContainer">
    <div id="innerContainer">
        <div class="nav">&nbsp;</div>
        <form action='${postUrl}' method='POST' id='loginForm' class='cssform' autocomplete='off'>
            <g:if test='${flash.message}'>
                <div class="errors">${flash.message}</div>
            </g:if>
            <table>
                <tr>
                    <td><label for='username'>Username</label></td>
                    <td><input type='text' class='text_' name='j_username' id='username'/></td>
                </tr>
                <tr>
                    <td><label for='password'>Password</label></td>
                    <td><input type='password' class='text_' name='j_password' id='password'/></td>
                </tr>
                <tr>
                    <td><label for='remember_me'>Remember me</label></td>
                    <td><input type='checkbox' class='chk' name='${rememberMeParameter}' id='remember_me'
                               <g:if test='${hasCookie}'>checked='checked'</g:if>/></td>
                </tr>
            </table>

            <div class="buttons">
                <input type='submit' value='Login'/>
            </div>
        </form>
    </div>
</div>
<script type='text/javascript'>
    <!--
    (function() {
        document.forms['loginForm'].elements['j_username'].focus();
    })();
    // -->
</script>
</body>