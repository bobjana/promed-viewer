<head>
    <meta name='layout' content='main'/>
    <title>Promed Incident Viewer</title>
    <style type="text/css">

    #loginContainer {
        width: 350px;
        margin: 16px auto;
        background: #fff;
    }

    .content {
        background-repeat: no-repeat;
        background-image: -moz-linear-gradient(center top, #DBEEFC, #FFF);
        background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0, #DBEEFC), color-stop(1, #fff));
        filter: progid:DXImageTransform.Microsoft.gradient(startColorstr = '#DBEEFC', endColorstr = '#FFFFFF');
        padding-top: 15px;
        min-height: 100%;
    }

    .viewerDialog {
        font-size: 0.8em;
    }

    .viewerDialog td {
        padding-top: 2px;
    }

    .ui-dialog-title {
        padding: 5px;
    }

        #loginTable{
            outline: solid 1px #C5DBEC;
            padding-top: 10px;
        }

    </style>
</head>

<body>
<div class="nav"><div class="navContent"></div></div>

<div class="content">

    <div id="loginContainer" class="viewerDialog">
        <div class="ui-dialog-titlebar ui-widget-header ui-corner-all ui-helper-clearfix">
            <div class="ui-dialog-title">Login</div>
        </div>

        <form action='${postUrl}' method='POST' id='loginForm' class='cssform' autocomplete='off'>
            <g:if test='${flash.message}'>
                <div class="errors">${flash.message}</div>
            </g:if>
            <table id="loginTable">
                <tbody>
                <tr>
                    <td><label for='username'>Username</label></td>
                    <td><input type='text' class='text_' name='j_username' id='username'/></td>
                </tr>
                <tr>
                    <td><label for='password'>Password</label></td>
                    <td><input type='password' name='j_password'
                               id='password'/></td>
                </tr>
                <tr>
                    <td><label for='remember_me'>Remember me</label></td>
                    <td><input type='checkbox' class='chk' name='${rememberMeParameter}' id='remember_me'
                               <g:if test='${hasCookie}'>checked='checked'</g:if>/></td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: right;">
                        <input type='submit' value='Login'/>
                    </td>
                </tr>
                </tbody>
            </table>
        </form>
    </div>
    %{--<script type="text/javascript">--}%
    %{--$('#loginContainer').dialog({ autoOpen: true, bgiframe: true, resizable: false, title: 'Login', width: 320, height: 220});--}%
    %{--</script>--}%


    <script type='text/javascript'>
        <!--
        (function() {
            document.forms['loginForm'].elements['j_username'].focus();
        })();

        $(document).ready(function() {
            $("input:submit, button").button();
        });
        // -->
    </script>

</div>

</body>