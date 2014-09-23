<%@ include file="../include/header" %>
<body>
    <div id="container">
        <div id="header">
<p align="right">
<%
    if(request.getSession().getAttribute("loggedHotel")==null)
    {
        response.sendRedirect("index.htl");
    }else{
%>
<a href="logout.htl">Logout</a>&nbsp;&nbsp;&nbsp;&nbsp;
<%}%>
</p>
            <%@ include file="../include/title" %>
        </div>
        <!-- end of header -->
        <div id="banner">
            <div id="menu">
                <ul>
                    <li><a href="index.htl" class="current">Home</a></li>
                    <li><a href="addadvertise.htl">Add Advertise</a></li>
                    <li><a href="addtravelguide.htl">Add Travel Guide</a></li>
                    <li><a href="showadvertisetravelguide.htl">Approved Requests</a></li>
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
                                <th width="250" >Title</th>
                                <th width="150" >Picture</th>
                                <th width="400" >Text</th>
                                <th width="70" >Delete</th>
                            </tr>
                        </thead>
                        <tbody style="color: azure" >
                            <c:forEach var="advert" items="${advert}">
                                <tr align="center" >
                                    <td align="left" ><font size="3">${advert.title}</font></td>
                                    <td><img src="${advert.pictureUrl}" alt="" width="140"/></td>
                                    <td align="left" width="400">${advert.text}</td>
                                    <td>
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
                                <th width="250" >Title</th>
                                <th width="150" >Picture</th>
                                <th width="400" >Text</th>
                                <th width="70" >Delete</th>
                            </tr>
                        </thead>
                        <tbody style="color: azure" >
                            <c:forEach var="tGuide" items="${tGuide}">
                                <tr align="center" >
                                    <td align="left" ><div class="content_title_02">${tGuide.title}</div></td>
                                    <td ><img src="${tGuide.pictureUrl}" alt="" width="140"/></td>
                                    <td align="left" >${tGuide.text}</td>
                                    <td>
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
            <!-- end of content left -->
            </div>
            <div class="cleaner">&nbsp;</div>
        </div>
        <%@ include file="../include/footer" %>
    </div>
    <!-- end of container -->
</body>
</html>
