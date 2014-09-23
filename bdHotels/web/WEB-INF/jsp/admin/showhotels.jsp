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
<!--            <div id="content_left">
                <div class="content_left_section">
                    <div class="content_title_01">All Hotels</div>-->
                    <font size="3">
                    <table border="0" width="600" >
                        <thead>
                            <tr>
                                <th width="90" >ID</th>
                                <th width="90" >Name</th>
                                <th width="90" >Username</th>
                                <th width="90" >Password</th>
                                <th width="90" >IP address</th>
                                <th width="90" >Port</th>
                                <th width="90" >ContextPath</th>
                            </tr>
                        </thead>
                        <tbody style="color: azure" >
                        <c:forEach var="hotel" items="${hotellist}">
                            <tr align="center" >
                                <td width="90" >${hotel.hotelId}</td>
                                <td width="90" ><a href="showhotelinfo.adm?hotelID=${hotel.hotelId}&rOffset=0&tGuide=0"> ${hotel.name} </a></td>
                                <td width="90" >${hotel.username}</td>
                                <td width="90" >${hotel.password}</td>
                                <td width="90" >${hotel.ipaddress}</td>
                                <td width="90" >${hotel.port}</td>
                                <td width="90" >${hotel.contextpath}</td>
                                
                            </tr>
                        </c:forEach>
                    </tbody>
                   </table>
                                 </font>
                   
<!--                </div>-->
                <!-- end of welcome -->

<!--            </div>-->
            <!-- end of content left -->
<!--            <div id="content_right">
                <div class="content_right_section">

                </div>

            </div>-->
            <!-- end of content right -->
            <div class="cleaner">&nbsp;</div>
        </div>
        <div id="content" align="right">
            
                    <a href="addhotel.adm">Add A Hotel</a><br>
                    <a href="showhotels.adm">Show hotel informations</a><br>
                    <a href="showtravelguiderequest.adm">Show travel guide requests</a><br>
                    <a href="showadvertiserequest.adm">Show advertise requests</a><br>
                    <a href="showadvertisetravelguide.adm">Show advertise and travel guides</a><br>
                    <a href="showcustomerinfo.adm">Show Customer info</a><br>
                </div>

        <%@ include file="../include/footer" %>
    </div>

    <!-- end of container -->
</body>
</html>
