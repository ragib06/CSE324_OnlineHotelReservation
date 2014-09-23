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
                <div class="content_title_01">User Registration</div>
                <div class="content_left_section">
                    <font size="3">
                        Your registration is Successful: <h2>Mr. ${user.firstName}!</h2>
                        here is your registration info:<br><br>
                        Username: <font color="red"> ${user.username}</font><br>
                        Password: <font color="red">${user.password}</font><br>
                        Firstname: <font color="green">${user.firstName}</font><br>
                        Middlename: <font color="green">${user.middleName}</font><br>
                        Lastname: <font color="green">${user.lastName}</font><br>
                        ApartmentNo: <font color="green">${user.apartmentNo}</font><br>
                        StreetNo: <font color="green">${user.streetNo}</font><br>
                        StreetName: <font color="green">${user.streetName}</font><br>
                        City: <font color="green">${user.city}</font><br>
                        District: <font color="green">${user.district}</font><br>
                        Division: <font color="green">${user.division}</font><br>
                        Zip/Postal Code: <font color="green">${user.areaCode}</font><br>
                        Email: <font color="green">${user.email}</font><br>
                        Alternet Email: <font color="green">${user.alternateEmail}</font><br>
                        Mobile Number: <font color="green">${user.mobileNo}</font><br>
                        Phone Number: <font color="green">${user.telephoneNo}</font><br>
                    </font>
                    <div class="cleaner_h20">&nbsp;</div>
                    <div class="cleaner_h20">&nbsp;</div>
                    <div class="cleaner_h20">&nbsp;</div>
                    <div class="cleaner_h20">&nbsp;</div>
                    <div class="cleaner_h20">&nbsp;</div>
                    <div class="cleaner_h20">&nbsp;</div>
                    <div class="cleaner_h20">&nbsp;</div>
                    <div class="cleaner_h20">&nbsp;</div>
                    <div class="cleaner_h20">&nbsp;</div>
                    <div class="cleaner_h20">&nbsp;</div>

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
