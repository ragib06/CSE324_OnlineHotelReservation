<%@ include file="../include/header" %>
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
                    <li><a href="hotels.adm" class="current">Hotels</a></li>
                </ul>
            </div>
        </div>
        <!-- end of banner -->
        <div id="content">
            <div id="content_left">
                <div class="content_left_section">
                    <div class="content_title_01">Title here ...</div>
                    <form:form action="login.adm" commandName="adminlogin" method="post">
                        <div class="form_row">
                            Username: <input type="text" name="username" />
                        </div>
                        <div class="form_row">
                            Password: <input type="password" name="password" />
                        </div>
                        <div class="form_row">
                            <input class="submitbutton" type="submit" value="login"/>
                        </div>
                    </form:form>
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
