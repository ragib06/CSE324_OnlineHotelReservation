<%@ include file="../include/header" %>
<body>
    <div id="container">
        <div id="header">
            <p align="right"> 
                <%
                    if(session.getAttribute("loggedUser") == null){
                        response.sendRedirect("index.htm");
                    }else{
                %>
                        <a href="logout.htm">Logout</a>
                <%
                    }
                %>
            </p>
            <%@ include file="../include/title" %>
            
            

        </div>
        <!-- end of header -->
        <div id="banner">
            <div id="menu">
                <ul>
                    <li><a href="index.htm" class="current">Home</a></li>
                    <li><a href="showhotels.htm">Hotels</a></li>
                    <li><a href="edit.htm">Edit Profile</a></li>
                    <li><a href="advancesearch.htm">Advance Search</a></li>
                </ul>
            </div>
        </div>
        <!-- end of banner -->
        <div id="content">
            <div id="content_left">
                <div class="content_left_section">
                    <div class="content_title_01">User Home</div>
                    Customer ID: ${loggedUser.customerId}<br>
                    Username: ${loggedUser.username} <br>
                    Password: ${loggedUser.password} <br>
                    Name: ${loggedUser.firstName}&nbsp;&nbsp;&nbsp;${loggedUser.middleName}&nbsp;&nbsp;&nbsp;${loggedUser.lastName}<br>
                    Address:
                        <div>
                            apartment no:${loggedUser.apartmentNo} street no:${loggedUser.streetNo}<br>
                            Street name:${loggedUser.streetName}<br>
                            City: ${loggedUser.city}<br>
                            District: ${loggedUser.district}<br>
                            Division: ${loggedUser.division}<br>
                            Area Code: ${loggedUser.areaCode}<br>
                        </div>

                    Email:${loggedUser.email}<br>
                    Alternate Email: ${loggedUser.alternateEmail}<br>
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
