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
                    <li><a href="index.htl" >Home</a></li>
                    <li><a href="branches.htl">Branch</a></li>
                    <li><a href="booking.htl">Bookings</a></li>
                    <li><a href="rooms.htl">Rooms</a></li>
                    <li><a href="services.htl">Service</a></li>
                    <li><a href="facilities.htl">Facilities</a></li>
                    <li><a href="advertise.htl">Advertise</a></li>
                    <li><a href="travelguide.htl">Travel Guide</a></li>
                    <li><a href="offers.htl">Offers</a></li>
                </ul>
            </div>
        </div>
        <!-- end of banner -->
        <div id="content">
            <div id="content_left">
                <div class="content_left_section">
                    <div class="content_title_01">Title Here ...</div>
                    <form:form action="login.htl" commandName="hotellogin" method="post">
                        <div class="form_row">
<!--                            Username: <input type="text" name="username" />-->
                        </div>
                        <div class="form_row">
<!--                            Password: <input type="password" name="password" />-->
                        </div>
                        <div class="form_row">
<!--                            <input class="submitbutton" type="submit" value="login"/>-->
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
