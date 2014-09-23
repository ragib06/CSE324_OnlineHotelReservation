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
                        <form:form name="registration" method="post" action="registrationStep1.htm" commandName="register">
                            <div class="form_row">
                                <label>First Name:</label><input name="firstname" type="text" size="30" value="${record.firstname}"/>
                            </div>
                            <div class="form_row">
                                <label>Middle Name:</label><input name="middlename" type="text" size="30" value="${record.middlename}"/>
                            </div>
                            <div class="form_row">
                                <label>Last Name:</label><input name="lastname" type="text" size="30" value="${record.lastname}"/>
                            </div>
                                
                            <div class="form_row">
                                <label>Email Address:</label><input name="email" type="text" size="30" value="${record.email}"/>
                            </div>
                            <div class="form_row">
                                <label>Confirm Email Addess:</label><input name="confemail" type="text" size="30" value="${record.email}"/>
                            </div>
                            <div class="form_row">
                                <label>Alternate Email Addess:</label><input name="alteremail" type="text" size="30" value="${record.alteremail}"/>
                            </div>

                                <div class="cleaner_h30">&nbsp;</div>
                                <%--<div class="submitbutton">Submit</div>--%>
                                <input class="submitbutton" type="submit" value="advance"/>
                                <div class="cleaner_h30">&nbsp;</div>
                        </form:form>

                        <script language="JavaScript" type="text/javascript">
                            //You should create the validator only after the definition of the HTML form
                            var frmvalidator  = new Validator("registration");
                            frmvalidator.addValidation("firstname","req","Please enter your First Name");
                            frmvalidator.addValidation("firstname","maxlen=20",	"Max length for FirstName is 20");
                            frmvalidator.addValidation("firstname","alpha","First Name: Alphabetic chars only");

                            frmvalidator.addValidation("middlename","alpha","Middle Name: Alphabetic chars only");

                            frmvalidator.addValidation("lastname","req","Please enter your Last Name");
                            frmvalidator.addValidation("lastname","maxlen=20","Max length is 20");
                            frmvalidator.addValidation("lastname","alpha","last Name: Alphabetic chars only");

                            frmvalidator.addValidation("email","maxlen=50");
                            frmvalidator.addValidation("email","email");

                            function DoCustomValidation()
                            {
                                var frm = document.forms["registration"];
                                if(frm.email.value != null && frm.confemail.value != null && frm.email.value != frm.confemail.value)
                                {
                                    sfm_show_error_msg("email addresses do not match!");
                                    return false;
                                }
                                else
                                {
                                    return true;
                                }
                            }

                            frmvalidator.setAddnlValidationFunction("DoCustomValidation");

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
