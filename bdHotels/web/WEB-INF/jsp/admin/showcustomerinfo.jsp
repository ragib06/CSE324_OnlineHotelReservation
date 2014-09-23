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
            <div id="content">
<!--            <div id="content_left">
                <div class="content_left_section">
                    <div class="content_title_01">All Hotels</div>-->
                    <font size="3">
                    <table border="0" width="900" >
                        <thead>
                            <tr>
                                <th width="30" >ID</th>
                                <th width="200" >Name</th>
                                <th width="100" >Username</th>
                                <th width="100" >Password</th>
                                <th width="100" >Mobile</th>
                                <th width="100" >Email</th>
                            </tr>
                        </thead>
                        <tbody style="color: azure" >
                        <c:forEach var="customer" items="${customerlist}">
                            <tr align="center" >
                                <td width="30" >${customer.customerId}</td>
                                <td width="200" ><a href="showcustomerSpecificinfo.adm?customerID=${customer.customerId}"> ${customer.firstName} ${customer.middleName} ${customer.lastName}</a></td>
                                <td width="100" >${customer.username}</td>
                                <td width="100" >${customer.password}</td>
                                <td width="150" >${customer.mobileNo}</td>
                                <td width="170" >${customer.email}</td>
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
                
               </div>
         
                <!-- end of welcome -->

           
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
        </div>
        <%@ include file="../include/footer" %>
    
    <!-- end of container -->
</body>
</html>
