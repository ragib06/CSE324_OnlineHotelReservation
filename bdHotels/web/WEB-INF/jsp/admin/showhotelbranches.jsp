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
            <div id="content_left">
                <h1>${testMessage}</h1>
                <div class="content_left_section">
                    <div class="content_title_01">All branches for ${hotel.name}</div>

                    <p>
                        ${branchcount} Branches:<br>
                    </p>
                    <div class="cleaner_h30">&nbsp;</div>

                    <c:forEach var="branch" items="${hotelbranches}">
                    <div class="search_result">
                        <div class="title">Branch: ${branch.city}</div>
                            <table border="0" >
                                <tbody style="color: azure" >
            
                                        <tr align="center" >
                                            <font size="3">
                                                ID: <font color="white"> ${branch.id}</font><br>
                                                Apartment No: <font color="white"> ${branch.apartmentNumber}</font><br>
                                                Street No: <font color="white"> ${branch.streetNumber}</font><br>
                                                Street Name: <font color="white"> ${branch.streetName}</font><br>
                                                City: <font color="white"> ${branch.city}</font><br>
                                                District: <font color="white"> ${branch.district}</font><br>
                                                Division: <font color="white"> ${branch.division}</font><br>
                                                Area Code: <font color="white"> ${branch.areacode}</font><br>
                                                Fax: <font color="white"> ${branch.faxNumber}</font><br>
                                                Mobile: <font color="white"> ${branch.mobileNumber}</font><br>
                                                Phone: <font color="white"> ${branch.phoneNumber}</font><br>
                                            </font>
                                        </tr>
                                     
                                 </tbody>
                            </table>

                            <div class="cleaner_h30">&nbsp;</div>

                        </div>

                    </c:forEach>

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
