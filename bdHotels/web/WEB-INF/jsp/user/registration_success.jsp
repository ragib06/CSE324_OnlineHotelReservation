<%@ include file="../include/header" %>
<body>
    <div id="container">
        <div id="header">
            <p align="right"><a href="registration.htm">Register</a></p>
            <%@ include file="../include/title" %>
        </div>
        <!-- end of header -->
        <div id="banner">
            <div id="menu">
                <ul>
                    <li><a href="index.htm">Home</a></li>
                    <li><a href="advancesearch.htm">Bookings</a></li>
                    <li><a href="showhotels.htm">Hotels</a></li>
                </ul>
            </div>
        </div>
        <!-- end of banner -->
        <div id="content">
            <div id="content_left">
                <div class="content_title_01">User Registration</div>
                <div class="content_left_section">
                    <font size="3">
                        Your registration is Successful: <h2>Mr. ${user.firstname}!</h2>
                        here is your registration info:<br><br>
                        <table border="0" cellspacing="1" cellpadding="1">
                            <thead>
                                <tr>
                                    <th width="170"></th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Username:</td>
                                    <td><font color="red"> ${user.username}</font></td>
                                </tr>
                                <tr>
                                    <td>Password:</td>
                                    <td><font color="red">${user.password}</font></td>
                                </tr>
                                <tr>
                                    <td>Firstname:</td>
                                    <td><font color="green">${user.firstname}</font></td>
                                </tr>
                                <tr>
                                    <td>Middlename:</td>
                                    <td><font color="green">${user.middlename}</font></td>
                                </tr>
                                <tr>
                                    <td>Lastname:</td>
                                    <td><font color="green">${user.lastname}</font></td>
                                </tr>
                                <tr>
                                    <td>ApartmentNo:</td>
                                    <td><font color="green">${user.apartmentno}</font></td>
                                </tr>
                                <tr>
                                    <td>StreetNo:</td>
                                    <td><font color="green">${user.streetno}</font></td>
                                </tr>
                                <tr>
                                    <td>StreetName:</td>
                                    <td><font color="green">${user.streetname}</font></td>
                                </tr>
                                <tr>
                                    <td>City:</td>
                                    <td><font color="green">${user.city}</font></td>
                                </tr>
                                <tr>
                                    <td>District:</td>
                                    <td><font color="green">${user.district}</font></td>
                                </tr>
                                <tr>
                                    <td>Division:</td>
                                    <td><font color="green">${user.division}</font></td>
                                </tr>
                                <tr>
                                    <td>Zip/Postal Code:</td>
                                    <td><font color="green">${user.zipcode}</font></td>
                                </tr>
                                <tr>
                                    <td>Email:</td>
                                    <td><font color="green">${user.email}</font></td>
                                </tr>
                                <tr>
                                    <td>Alternet Email:</td>
                                    <td><font color="green">${user.alteremail}</font></td>
                                </tr>
                                <tr>
                                    <td>Mobile Number:</td>
                                    <td><font color="green">${user.mobile}</font></td>
                                </tr>
                                <tr>
                                    <td>Phone Number:</td>
                                    <td><font color="green">${user.phone}</font></td>
                                </tr>
                            </tbody>
                        </table>
                    </font>
                    <div class="cleaner_h20">&nbsp;</div>
                    <div class="cleaner_h20">&nbsp;</div>
                    <div class="cleaner_h20">&nbsp;</div>
                    <div class="cleaner_h20">&nbsp;</div>
                    <div class="cleaner_h20">&nbsp;</div>
                    <div class="cleaner_h20">&nbsp;</div>
                    <div class="cleaner_h20">&nbsp;</div>
                    <div class="cleaner_h20">&nbsp;</div>
                    <div class="cleaner_h20">&nbsp;</div>
                    <div class="cleaner_h20">&nbsp;</div>

                </div>
                <!-- end of welcome -->

            </div>
            <!-- end of content left -->
            <div id="content_right">
                <div class="content_right_section">
                    <div class="content_title_01">Latest News</div>
                    <div class="news_title">Nam auctor aliquam leo</div>
                    <p>Pellentesque est elit, sagittis sit amet porttitor ut, ornare vel turpis. Vivamus eu enimvitae neque its posuere rutrum. <a href="">read more</a></p>
                    <div class="cleaner_h30">&nbsp;</div>
                    <div class="news_title">Suspendisse pharetra eros molestie</div>
                    <p>Vivamus eu enimvitae neque its posuere rutrum. Nam accumsan turpis at turpis molestie a convallis forte tor ornare. <a href="">read more</a></p>
                    <div class="cleaner_h20">&nbsp;</div>
                    <div class="rc_btn_02"><a href="">View All</a></div>
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
