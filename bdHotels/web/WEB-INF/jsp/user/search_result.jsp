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
                <h1>${testMessage}</h1>
                <div class="content_left_section">
                    <div class="content_title_01">Search Result for Booking</div>

                    <p>
                        ${searchcount} Results found:<br>
                    </p>
                    <div class="cleaner_h30">&nbsp;</div>

                    <c:forEach var="hotel" items="${searchresult}">

                        <div class="search_result">
                            <div class="title">${hotel.hotelName}</div>

                            <table border="0" >
                                <thead>
                                    <tr>
                                        <th width="70" >Branch</th>
                                        <th width="70" >Room</th>
                                        <th width="70" >Floor</th>
                                        <th width="70" >Beds</th>
                                        <th width="70" >Side View</th>
                                        <th width="70" >Rent</th>
                                        <th width="70" >Booking</th>
                                    </tr>
                                </thead>
                                <tbody style="color: azure" >
                                    <c:forEach var="room" items="${hotel.rooms}">
                                        <tr align="center" >
                                            <td width="70" >${room.city}</td>
                                            <td width="70" >${room.roomID}</td>
                                            <td width="70" >${room.floorNo}</td>
                                            <td width="70" >${room.noOfBeds}</td>
                                            <td width="70" >${room.sideView}</td>
                                            <td width="70" >${room.rent}</td>
                                            <td width="70" align="center" >
<!--                                            <a href="book.htm?branchid=${room.branchID}&roomid=${room.roomID}">Book</a>-->

                                                <form:form action="roombook.htm" method="post" commandName="bookinginfo">

                                                    <input type="hidden" name="hotelID" value="${hotel.hotelID}"/>
                                                    <input type="hidden" name="hotelName" value="${hotel.hotelName}"/>
                                                    <input type="hidden" name="branchID" value="${room.branchID}"/>
                                                    <input type="hidden" name="roomID" value="${room.roomID}"/>
                                                    <input type="submit" value="book"/>
                                                </form:form>
                                            </td>
                                        </tr>
                                     </c:forEach>
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
