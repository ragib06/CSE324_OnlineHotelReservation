<%@page import="springModel.admin.AdminLoginInfo"%>
<%@ include file="../include/header" %>
<body>
    <div id="container">
        <div id="header">
            <p align="right">
                <%
                    if(session.getAttribute("adminlogininfo") != null){
                %>
                        <a href="logout.adm">Logout</a>
                <%}%>
            </p>
            <%@ include file="../include/title" %>
        </div>
        <!-- end of header -->
        <div id="banner">
            <div id="menu">
                <ul>
                    <li><a href="home.adm" class="current">Home</a></li>
                </ul>
            </div>
        </div>

        <%
        AdminLoginInfo li= (AdminLoginInfo)request.getSession().getAttribute("adminlogininfo");
        if(li==null){
            response.sendRedirect("index.adm");
        }
        %>
        <!-- end of banner -->
        <div id="content">
            <div id="content_left">
                <div class="content_left_section">
                    <div class="content_title_01">Select Hotel</div>
                    <form:form method="post">
                        <div class="form_row">
                            Select a Hotel
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
                        </div>
                        <div class="form_row">
                            <input class="submitbutton" type="submit" value="Show Advertise & Travelguide"/>
                        </div>
                    </form:form>
                </div>
                <!-- end of welcome -->

            </div>
            <!-- end of content left -->
            <div id="content_right">
                <div class="content_right_section">
                    <a href="addhotel.adm">Add A Hotel</a><br>
                    <a href="showhotels.adm">Show hotel informations</a><br>
                    <a href="showtravelguiderequest.adm">Show travel guide requests</a><br>
                    <a href="showadvertiserequest.adm">Show advertise requests</a><br>
                    <a href="showadvertisetravelguide.adm">Show advertise and travel guides</a><br>
                    <a href="showcustomerinfo.adm">Show Customer info</a><br>

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
