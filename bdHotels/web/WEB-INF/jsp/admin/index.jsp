<%@ include file="../include/header" %>
<%
                if(session.getAttribute("adminlogininfo") != null)
                    response.sendRedirect("home.adm");
            %>
<body>
    <div id="container">
        <div id="header">
            <%@ include file="../include/title" %>
        </div>
        <!-- end of header -->
        <div id="banner">
            <div id="menu">
                <ul>
                    <li><a href="index.adm" class="current">Home</a></li>
                </ul>
            </div>
        </div>
        <!-- end of banner -->
        <div id="content">
            <div id="content_left">
                <div class="content_left_section">
                    <div class="content_title_01">Admin Login</div>
                    
                    <div class="registration_form">
                        <form:form action="login.adm" commandName="adminlogin" method="post">

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
                                        <td><input type="submit" value="login"/></td>
                                    </tr>
                                </tbody>
                            </table>

                        </form:form>
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
