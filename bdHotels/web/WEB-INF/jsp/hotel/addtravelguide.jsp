<%@page import="java.util.logging.Level"%>
<%@page import="controller.hotel.AddHotelBranchController"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.io.IOException"%>
<%@page import="hibernateModel.Hotel"%>
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
                    <div class="content_title_01">Please enter the following information ...</div>
                    <form:form name="addtravelguideform" action="addtravelguide.htl" enctype="multipart/form-data" commandName="addTravelGuide" method="post">
                        <div class="form_row">
                                <label>Title :</label><input name="title" type="text" size="30"/>
                        </div>
                        <div class="form_row">
                            <label>Text:</label>
                            <textarea name="text" rows="10" cols="38"></textarea>

                        </div>
                        <div class="form_row">
                                <label>Please upload an image:</label>
                                <input name="tGuideImageFile" type="file"/>
                        </div>
                        <div class="form_row" >
                            <input class="submitbutton" type="submit" value="Request Travelguide"/>
                        </div>
                    </form:form>

                    <script language="JavaScript" type="text/javascript">
                        //You should create the validator only after the definition of the HTML form
                        var frmvalidator  = new Validator("addtravelguideform");
                        frmvalidator.addValidation("title","req","Please enter title");

                        frmvalidator.addValidation("text","req","Please enter text");
                    </script>

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
