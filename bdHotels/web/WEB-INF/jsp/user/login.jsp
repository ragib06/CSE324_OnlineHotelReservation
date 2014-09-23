<%@ include file="../include/header" %>
<body>
    <div id="container">
        <div id="header">
            
            <p align="right">
                <a href="registration1.htm">Register</a>
            </p>
            <%@ include file="../include/title" %>
        </div>
        <!-- end of header -->
        <div id="banner">
            <div id="menu">
                <ul>
                    <li><a href="index.htm" class="current">Home</a></li>
                </ul>
            </div>
        </div>
        <!-- end of banner -->
        <div id="content">
            <div id="content_left">
                <div class="content_left_section">
                    <div class="content_title_01">User Login</div>
                        <div class="registration_form">
                            <form:form name="loginform" action="doLogin.htm" commandName="userlogin" method="post">

                                <table border="0" >
                                    <tbody>
                                        <tr>
                                            <td width="170" >
                                                <div class="form_row">Username:</div>
                                            </td>
                                            <td>
                                                <input type="text" name="username" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><div class="form_row">Password:</div></td>
                                            <td><input type="password" name="password" /></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td><input class="submitbutton2" type="submit" value="login"/></td>
                                        </tr>
                                    </tbody>
                                </table>

                            </form:form>
                                
                            <script language="JavaScript" type="text/javascript">
                                //You should create the validator only after the definition of the HTML form
                                var frmvalidator  = new Validator("loginform");
                                frmvalidator.addValidation("username","req","Please enter username");
                                frmvalidator.addValidation("password","req","Please enter password");

                            </script>

                        </div>
                </div>
                <!-- end of welcome -->

            </div>
            <!-- end of content left -->
            <div id="content_right">
                <div class="content_right_section">

                </div>

            </div>
            <!-- end of content right -->
            <div class="cleaner">&nbsp;</div>
        </div>
        <%@ include file="../include/footer" %>
    </div>
    <!-- end of container -->
</body>
</html>
