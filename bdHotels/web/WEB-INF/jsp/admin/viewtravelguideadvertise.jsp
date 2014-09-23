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
                    <div class="content_title_01">Advertisements</div>

                    <table border="0" >
                        <thead>
                            <tr>
                                <th width="125" >Hotel</th>
                                <th width="125" >Title</th>
                                <th width="150" >Picture</th>
                                <th width="400" >Text</th>
                                <th width="70" >Delete</th>
                            </tr>
                        </thead>
                        <tbody style="color: azure" >
                            <c:forEach var="advert" items="${advert}">
                                <tr align="center" >
                                    <td align="left" ><div class="content_title_02">${advert.hotelname}</div></td>
                                    <td align="left" ><div class="content_title_02">${advert.title}</div></td>
                                    <td  ><img src="${advert.pictureUrl}" alt="" width="140"/></td>
                                    <td align="left" width="400">${advert.text}</td>
                                    <td width="70">
                                        <form:form action="processrequest.adm" method="post" commandName="processRequest">
                                            <input type="hidden" name="id" value="${advert.advertisementId}"/>
                                            <input type="hidden" name="requesttype" value="advertisement"/>
                                            <input type="hidden" name="action" value="decline"/>
                                            <input type="submit" value="Delete"/>
                                        </form:form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>

                <div class="cleaner_h30">&nbsp;</div>
                <div class="cleaner_h30">&nbsp;</div>
                <div class="cleaner_h30">&nbsp;</div>

                <div class="content_middle_section">
                    <div class="content_title_01">Tavel guides</div>

                    <table border="0" >
                        <thead>
                            <tr>
                                <th width="125" >Title</th>
                                <th width="125" >Title</th>
                                <th width="150" >Picture</th>
                                <th width="400" >Text</th>
                                <th width="70" >Delete</th>
                            </tr>
                        </thead>
                        <tbody style="color: azure" >
                            <c:forEach var="tGuide" items="${tGuide}">
                                <tr align="center" >
                                    <td align="left" ><div class="content_title_02">${tGuide.hotelname}</div></td>
                                    <td align="left" ><div class="content_title_02">${tGuide.title}</div></td>
                                    <td ><img src="${tGuide.pictureUrl}" alt="" width="140"/></td>
                                    <td align="left">${tGuide.text}</td>
                                    <td >
                                        <form:form action="processrequest.adm" method="post" commandName="processRequest">
                                            <input type="hidden" name="id" value="${tGuide.travelGuideId}"/>
                                            <input type="hidden" name="requesttype" value="travelguide"/>
                                            <input type="hidden" name="action" value="decline"/>
                                            <input type="submit" value="Delete"/>
                                        </form:form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                    <!-- end of welcome -->
                </div>
            </div>
            <!-- end of content left -->
            <div id="content_right">
                <div class="content_right_section">
                    <div class="content_right_section">
                    <a href="addhotel.adm">Add A Hotel</a><br>
                    <a href="showhotels.adm">Show hotel informations</a><br>
                    <a href="showtravelguiderequest.adm">Show travel guide requests</a><br>
                    <a href="showadvertiserequest.adm">Show advertise requests</a><br>
                    <a href="showadvertisetravelguide.adm">Show advertise and travel guides</a><br>
                    <a href="showcustomerinfo.adm">Show Customer info</a><br>

                </div>
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
