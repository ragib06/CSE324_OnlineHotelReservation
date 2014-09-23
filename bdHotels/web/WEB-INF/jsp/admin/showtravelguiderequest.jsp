<%@ include file="../include/header" %>
<%
                if(session.getAttribute("adminlogininfo") == null)
                    response.sendRedirect("index.adm");
            %>
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
        
        <!-- end of banner -->
        <div id="content">
            <div id="content_middle">
                <div class="content_middle_section">
                    <div class="content_title_01">Travelguide Requests</div>

                    <table border="0" >
                        <thead>
                            <tr>
                                <th width="120" >Hotel</th>
                                <th width="120" >Title</th>
                                <th width="150" >Picture</th>
                                <th width="340" >Text</th>
                                <th width="70" >Accept</th>
                                <th width="70" >Decline</th>
                            </tr>
                        </thead>
                        <tbody style="color: azure" >
                            <c:forEach var="tGuide" items="${travelguiderequests}">
                                <tr align="center" >
                                    <td align="left" ><div class="content_title_02">${tGuide.hotelname}</div></td>
                                    <td align="left" ><div class="content_title_02">${tGuide.title}</div></td>
                                    <td><img src="${tGuide.pictureUrl}" alt="" width="140"/></td>
                                    <td align="left" width="340" >${tGuide.text}</td>
                                    <td>
                                        <form:form action="processrequest.adm" method="post" commandName="processRequest">
                                            <input type="hidden" name="id" value="${tGuide.travelGuideId}"/>
                                            <input type="hidden" name="requesttype" value="travelguide"/>
                                            <input type="hidden" name="action" value="accept"/>
                                            <input type="submit" value="Accept"/>
                                        </form:form>
                                    </td>
                                    <td>
                                        <form:form action="processrequest.adm" method="post" commandName="processRequest">
                                            <input type="hidden" name="id" value="${tGuide.travelGuideId}"/>
                                            <input type="hidden" name="requesttype" value="travelguide"/>
                                            <input type="hidden" name="action" value="decline"/>
                                            <input type="submit" value="Decline"/>
                                        </form:form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <!-- end of welcome -->

            </div>

            <div class="content_right_section">
                    <a href="addhotel.adm">Add A Hotel</a><br>
                    <a href="showhotels.adm">Show hotel informations</a><br>
                    <a href="showtravelguiderequest.adm">Show travel guide requests</a><br>
                    <a href="showadvertiserequest.adm">Show advertise requests</a><br>
                    <a href="showadvertisetravelguide.adm">Show advertise and travel guides</a><br>
                    <a href="showcustomerinfo.adm">Show Customer info</a><br>

                </div>
            <!-- end of content middle -->
            <div class="cleaner">&nbsp;</div>
        </div>
        <%@ include file="../include/footer" %>
    </div>
    <!-- end of container -->
</body>
</html>
