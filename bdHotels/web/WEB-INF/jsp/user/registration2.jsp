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
                        <form:form name="registration" method="post" action="registrationStep2.htm" commandName="register">
                        <table border="0">

                            <tbody>
                                <tr>
                                    <td width="50" align="right">Apartment No:&nbsp;&nbsp;</td>
                                    <td><input name="apartmentno" type="text" size="30" value="${record.apartmentno}"/></td>
                                </tr>
                                <tr>
                                    <td align="right">Street No:&nbsp;&nbsp;</td>
                                    <td><input name="streetno" type="text" size="30" value="${record.streetno}"/></td>
                                </tr>
                                <tr>
                                    <td align="right">Street Name:&nbsp;&nbsp;</td>
                                    <td><input name="streetname" type="text" size="30" value="${record.streetname}"/></td>
                                </tr>
                                <tr>
                                    <td align="right">City:&nbsp;&nbsp;</td>
                                    <td><input name="city" type="text" size="30" value="${record.city}"/></td>
                                </tr>
                                <tr>
                                    <td align="right">District:&nbsp;&nbsp;</td>
                                    <td><input name="district" type="text" size="30" value="${record.district}"/></td>
                                </tr>
                                <tr>
                                    <td align="right">Division:&nbsp;&nbsp;</td>
                                    <td><input name="division" type="text" size="30" value="${record.division}"/></td>
                                </tr>
                                <tr>
                                    <td align="right">Zip/Postal code:&nbsp;&nbsp;</td>
                                    <td><input name="zipcode" type="text" size="30" value="${record.zipcode}"/></td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                        <td><input class="submitbutton2" type="submit" value="submit"/></td>
                                    </form:form>
                                    <form:form method="post" action="registrationStep1Back.htm" commandName="register">
                                        <td><INPUT class="submitbutton2" type="submit" value="Back"></td>
                                    </form:form>
                                </tr>
                            </tbody>
                        </table>

                        <script language="JavaScript" type="text/javascript">
                            //You should create the validator only after the definition of the HTML form
                            var frmvalidator  = new Validator("registration");
                            frmvalidator.addValidation("apartmentno","req","Please enter your Apartment Number");
                            frmvalidator.addValidation("apartmentno","numeric","Digits Only");

                            frmvalidator.addValidation("streetno","req","Please enter your Street Number");
                            frmvalidator.addValidation("streetno","numeric","Digits Only");

                            frmvalidator.addValidation("zipcode","req","Please enter your Street zipcode");
                            frmvalidator.addValidation("zipcode","numeric","Digits Only");

                            frmvalidator.addValidation("streetname","req","Please provide your street name!");

                            frmvalidator.addValidation("city","req","Please provide your city!");
                            frmvalidator.addValidation("city","alpha","Alphabetic chars only!");

                            frmvalidator.addValidation("district","req","Please provide your district!");
                            frmvalidator.addValidation("district","alpha","Alphabetic chars only!");

                            frmvalidator.addValidation("division","req","Please provide your division!");
                            frmvalidator.addValidation("division","alpha","Alphabetic chars only!");
                            
                        </script>
                      
                        
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
