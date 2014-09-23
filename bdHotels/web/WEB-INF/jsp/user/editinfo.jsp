<%@ include file="../include/header" %>
<body>
    <div id="container">
        <div id="header">
            <p align="right">
                <%
                    if(session.getAttribute("loggedUser") == null){
                        response.sendRedirect("index.htm");
                    }else{
                %>
                        <a href="logout.htm">Logout</a>
                <%
                    }
                %>
            </p>
            <%@ include file="../include/title" %>
        </div>
        <!-- end of header -->
        <div id="banner">
            <div id="menu">
                <ul>
                    <li><a href="index.htm">Home</a></li>
                    <li><a href="showhotels.htm">Hotels</a></li>
                    <li><a href="edit.htm">Edit Profile</a></li>
                    <li><a href="advancesearch.htm">Advance Search</a></li>
                </ul>
            </div>
        </div>
        <!-- end of banner -->
        <div id="content">
            <div id="content_left">

                <div class="content_left_section">
                    <div class="content_title_01">User Registration</div>
                    <div class="registration_form">
                        <form:form name="editinfoform" method="post" action="" commandName="edit">
                            <div class="form_row">
                                <label>First Name:</label><input name="firstname" type="text" size="30" value="${customer.firstName}"/>
                            </div>
                            <div class="form_row">
                                <label>Middle Name:</label><input name="middlename" type="text" size="30" value="${customer.middleName}"/>
                            </div>
                            <div class="form_row">
                                <label>Last Name:</label><input name="lastname" type="text" size="30" value="${customer.lastName}"/>
                            </div>
                            <div class="form_row">
                                <label>Apartment No:</label><input name="apartmentno" type="text" size="30" value="${customer.apartmentNo}"/>
                            </div>
                            <div class="form_row">
                                <label>Street No:</label><input name="streetno" type="text" size="30" value="${customer.streetNo}"/>
                            </div>
                            <div class="form_row">
                                <label>Street Name:</label><input name="streetname" type="text" size="30" value="${customer.streetName}"/>
                            </div>
                            <div class="form_row">
                                <label>City:</label><input name="city" type="text" size="30" value="${customer.city}"/>
                            </div>
                            <div class="form_row">
                                <label>District:</label><input name="district" type="text" size="30" value="${customer.district}"/>
                            </div>
                            <div class="form_row">
                                <label>Division:</label><input name="division" type="text" size="30" value="${customer.division}"/>
                            </div>
                            <div class="form_row">
                                <label>Zip/Postal code:</label><input name="zipcode" type="text" size="30" value="${customer.areaCode}"/>
                            </div>
                            <div class="form_row">
                                <label>Email Address:</label><input name="email" type="text" size="30" value="${customer.email}"/>
                            </div>
                            
                            <div class="form_row">
                                <label>Alternate Email Addess:</label><input name="alteremail" type="text" size="30" value="${customer.alternateEmail}"/>
                            </div>
                            <div class="form_row">
                                <label>Userame:</label><input name="username" type="text" size="30" value="${customer.username}"/>
                            </div>
                            <div class="form_row">
                                <label>Password:</label><input name="password" type="password" size="30" value="${customer.password}"/>
                            </div>
                            <div class="form_row">
                                <label>Mobile Number:</label><input name="mobile" type="text" size="30" value="${customer.mobileNo}"/>
                            </div>
                            <div class="form_row">
                                <label>Phone Number:</label><input name="phone" type="text" size="30" value="${customer.telephoneNo}"/>
                            </div>

                            <div class="cleaner_h30">&nbsp;</div>
                            <%--<div class="submitbutton">Submit</div>--%>
                            <input class="submitbutton" type="submit" value="submit"/>
                            <div class="cleaner_h30">&nbsp;</div>
                        </form:form>

                        <script language="JavaScript" type="text/javascript">
                            //You should create the validator only after the definition of the HTML form
                            var frmvalidator  = new Validator("editinfoform");
                            frmvalidator.addValidation("firstname","req","Please enter your First Name");
                            frmvalidator.addValidation("firstname","maxlen=20",	"Max length for FirstName is 20");
                            frmvalidator.addValidation("firstname","alpha","First Name: Alphabetic chars only");

                            frmvalidator.addValidation("middlename","alpha","Middle Name: Alphabetic chars only");

                            frmvalidator.addValidation("lastname","req","Please enter your Last Name");
                            frmvalidator.addValidation("lastname","maxlen=20","Max length is 20");
                            frmvalidator.addValidation("lastname","alpha","last Name: Alphabetic chars only");

                            frmvalidator.addValidation("email","maxlen=50");
                            frmvalidator.addValidation("email","email");

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

                            frmvalidator.addValidation("username","req","Please enter your Userame");
                            frmvalidator.addValidation("username","maxlen=20",	"Max length for Username is 20");
                            frmvalidator.addValidation("username","alnum","Username: Alphanumeric only");

                            frmvalidator.addValidation("password","req","Please enter your password");
                            frmvalidator.addValidation("password","minlen=6",	"Password: minimum 6 characters!");

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
