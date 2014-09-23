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
                    <li><a href="index.htm">Home</a></li>
                    <li><a href="advancesearch.htm">Bookings</a></li>
                    <li><a href="showhotels.htm">Hotels</a></li>
                </ul>
            </div>
        </div>
        <!-- end of banner -->
        <div id="content">
            <div id="content_left">

                <div class="content_left_section">
                    <div class="content_title_01">User Registration</div>
                    <div class="registration_form">
                        <form:form method="post" action="registrationStep3.htm" commandName="register">
                            <table border="0">
                                <tbody>
                                     <tr>
                                        <td width="50" align="right">Mobile Number:</td>
                                        <td><input name="mobile" type="text" size="30" value="${record.mobile}"/></td>
                                    </tr>
                                    <tr>
                                        <td align="right">Phone Number:</td>
                                        <td><input name="phone" type="text" size="30" value="${record.phone}"/></td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                          <td><input class="submitbutton2" type="submit" value="submit"/></td>
                                        </form:form>
                                          <form:form method="post" action="registrationStep2Back.htm" commandName="register">
                                            <td><INPUT class="submitbutton2" type="submit" value="Back"></td>
                                        </form:form>
                                </tr>
                                </tbody>
                            </table>
                       
                    </div>
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
