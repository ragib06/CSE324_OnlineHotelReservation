<%@ include file="../include/header" %>
<body>
    <div id="container">
        <div id="header">
            <%@ include file="../include/title" %>
            <%
                if(session.getAttribute("loggedHotel") != null)
                    response.sendRedirect("home.htl");
            %>
        </div>
        <!-- end of header -->
        <div id="banner">
            <div id="menu">
                <ul>
                    <li><a href="index.htl" >Home</a></li>
                    <li><a href="addadvertise.htl">Add Advertise</a></li>
                    <li><a href="addtravelguide.htl">Add Travel Guide</a></li>
                    <li><a href="showadvertisetravelguide.htl">Approved Requests</a></li>
                </ul>
            </div>
        </div>
        <!-- end of banner -->
        
        <div id="content">
            <div id="content_left">
                <div class="content_left_section">
                    <div class="content_title_01">Hotel Login</div>
                    <div class="registration_form">
                        <form:form name="loginform" method="post">
                            <table border="0">
                                <tbody>
                                    
                                    <tr>
                                        <td width="130">Select a Hotel</td>
                                        <td>
                                            <spring:bind path="command">
                                                <FONT color="red">
                                                    <B><c:out value="${status.errorMessage}"/></B>
                                                </FONT>
                                                <SELECT name="hotelId">
                                                    <option value="-1">--- Select ---</option>
                                                    <c:forEach var="hotel" items="${hotels}">
                                                        <c:if test="${command.hotelId == hotel.hotelId}">
                                                            <OPTION selected="<c:out value="${command.hotelId}"/>" value="<c:out value="${hotel.hotelId}"/>"><c:out value="${hotel.name}"/></OPTION>
                                                        </c:if>
                                                        <c:if test="${command.hotelId != hotel.hotelId}">
                                                            <OPTION value="<c:out value="${hotel.hotelId}"/>"><c:out value="${hotel.name}"/></OPTION>
                                                        </c:if>
                                                    </c:forEach>
                                                </SELECT>
                                            </spring:bind>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Username:</td>
                                        <td><input type="text" name="username" /></td>
                                    </tr>
                                    <tr>
                                        <td>Password:</td>
                                        <td><input type="password" name="password" /></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td><input class="submitbutton2" type="submit" value="login"/></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>
                                            <p style="color: red" id='loginform_errorloc'  class='error_strings'></p>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </form:form>
                    </div>

                    <script language="JavaScript" type="text/javascript">
                        //You should create the validator only after the definition of the HTML form
                        var frmvalidator  = new Validator("loginform");
                        frmvalidator.addValidation("username","req","Please enter username");
                        frmvalidator.addValidation("password","req","Please enter password");
                        frmvalidator.addValidation("hotelId","dontselect=-1");


                        frmvalidator.EnableOnPageErrorDisplaySingleBox();
                        frmvalidator.EnableMsgsTogether();
                    </script>
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
