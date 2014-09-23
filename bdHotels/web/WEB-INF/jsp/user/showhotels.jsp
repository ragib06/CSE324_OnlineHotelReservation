<%@ include file="../include/header" %>
<body>
    <div id="container">
        <div id="header">
            <p align="right">
                <%
                    if(session.getAttribute("loggedUser") == null){
                %>
                <a href="registration1.htm">Register</a> &nbsp;&nbsp;&nbsp;
                    <a href="login.htm">Login</a>
                <%
                    }else{
                %>
                        <a href="logout.htm">Logout</a>
                <%}%>
            </p>
            <%@ include file="../include/title" %>
        </div>
        <!-- end of header -->
        <div id="banner">
            <div id="menu">
                <ul>
                    <li><a href="index.htm">Home</a></li>
                    <li><a href="showhotels.htm" class="current">Hotels</a></li>
                    <%
                        if (session.getAttribute("loggedUser") != null) {
                    %>
                        <li><a href="edit.htm">Edit Profile</a></li>
                        <li><a href="advancesearch.htm">Advance Search</a></li>
                    <%} %>
                    
                </ul>
            </div>
        </div>
        <!-- end of banner -->
        <div id="content">
            <div id="content_left">
                <div class="content_left_section">
                    <div class="content_title_01">All Hotels</div>
                    <table border="0" width="600" >
                        <thead>
                            <tr>
                                <th width="90" >Name</th>
                                <th width="90" >IP address</th>
                                <th width="90" >Port</th>
                                <th width="90" >ContextPath</th>
                            </tr>
                        </thead>
                        <tbody style="color: azure" >
                        <c:forEach var="hotel" items="${hotellist}">
                            <tr align="center" >
                                <td width="90" ><a href="showhotelinfo.htm?hotelID=${hotel.hotelId}&rOffset=0&tGuide=0"> ${hotel.name} </a></td>
                                <td width="90" >${hotel.ipaddress}</td>
                                <td width="90" >${hotel.port}</td>
                                <td width="90" >${hotel.contextpath}</td>
                                <td width="70" align="center" >
                                    <!--<a href="showhotelbranches.adm?hotelID=${hotel.hotelId}" >Show Branches</a>-->
                                </td>
                            </tr>
                        </c:forEach>
                        
                    </tbody>
                   </table>
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
