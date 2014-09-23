<%@ include file="../include/hotelHeader" %>
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
                    <div class="content_title_01">${tGuide.title}</div>
                    <img src="${tGuide.pictureUrl}" alt="" height="150"/>
                    <p>${tGuide.text}</p>
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
    <!-- end of container -->
</body>
</html>
