<%@ include file="../include/header" %>
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

<body>
    <div id="container">
        <div id="header">
            <%@ include file="../include/title" %>
        </div>
        <!-- end of header -->
        <div id="banner">
            <div id="menu">
                <ul>
                    <li><a href="index.htl" >Home</a></li>
                    <li><a href="addadvertise.htl">Add Advertise</a></li>
                    <li><a href="addtravelguide.htl">Add Travel Guide</a></li>
                    <li><a href="showadvertisetravelguide.htl">Approved Requests</a></li>
                </ul>
            </div>
        </div>
        <!-- end of banner -->
        <div id="content">
            <div id="content_left">
                <div class="content_left_section">
                    <font size="3">
                        Your are logged in
                        here is your Login info:<br><br>
                        Hotel ID: <font color="red"> ${loggedHotel.hotelId}</font><br>
                        Hotel name: <font color="red"> ${loggedHotel.name}</font><br>
                        Username: <font color="red"> ${loggedHotel.username}</font><br>
                    </font>
                <div class="content_left_section">
                    
                <a href="addtravelguide.htl" class="form_row"><font color="green">Add Travel Guide</font></a><br>
                <a href="addadvertise.htl" class="form_row"><font color="green">Add Advertise</font></a><br>
                <a href="showadvertisetravelguide.htl" class="form_row"><font color="green">Show Advertise and Travel guide</font></a>

                </div>

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
    </div>
    <!-- end of container -->
</body>
</html>
