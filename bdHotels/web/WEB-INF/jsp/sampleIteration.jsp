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
                    <li><a href="index.brn" class="current">Home</a></li>
                </ul>
            </div>
        </div>
        <!-- end of banner -->
        <div id="content">
            <div id="content_left">
                <div class="content_left_section">
                    <div class="content_title_01">Hotel Branch Login</div>
                    <form:form  method="post" >
                        <div class="form_row">
                            Select a Hotel
                            <spring:bind path="command">
                                    <FONT color="red">
                                      <B><c:out value="${status.errorMessage}"/></B>
                                    </FONT>
                                    <SELECT name="hotelId" onchange="submit()">
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
                            Select a Branch
                            <spring:bind path="command">
                                    <FONT color="red">
                                      <B><c:out value="${status.errorMessage}"/></B>
                                    </FONT>
                                    <SELECT name="branchId" >
                                        <option value="-1">--- Select ---</option>
                                        <c:forEach var="branch" items="${branches}">
                                            <c:if test="${command.branchId == branch.id.branchId}">
                                              <OPTION selected="<c:out value="${command.branchId}"/>" value="<c:out value="${branch.id.branchId}"/>"><c:out value="${branch.city}"/></OPTION>
                                            </c:if>
                                            <c:if test="${command.branchId != branch.id.branchId}">
                                              <OPTION value="<c:out value="${branch.id.branchId}"/>"><c:out value="${branch.city}"/></OPTION>
                                            </c:if>
                                        </c:forEach>
                                    </SELECT>
                             </spring:bind>
                        </div>
                        <div class="form_row">
                            Username: <input type="text" name="username" />
                        </div>
                        <div class="form_row">
                            Password: <input type="password" name="password" />
                        </div>
                        <div class="form_row">
                            <input name="loginbutton"class="submitbutton" type="submit" value="login"/>
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
