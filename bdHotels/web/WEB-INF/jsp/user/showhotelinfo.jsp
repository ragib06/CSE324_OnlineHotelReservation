<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<title>Hotel and Travel</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="images/style.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="images/slideshow.js"></script>
<script type="text/javascript">
        init();
</script>
<c:forEach var="advert" items="${advertisements}">
    <script type="text/javascript">
        addAdvert("${advert.pictureUrl}", "${advert.text}", "${advert.title}");
    </script>
</c:forEach>

</head>

<body onload="preloadAdvert();slideShow();">
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
                    <li><a href="showhotels.htm">Hotels</a></li>
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
                    <div class="content_title_01">Hotel ${basicinfo.name}: ${travelguide.title}</div>

                    <img src="${travelguide.pictureUrl}" width="200" />
                    <p>${travelguide.text}</p>
                    <div class="cleaner_h30">&nbsp;</div>
                    
                    <a href="showhotelinfo.htm?hotelID=${basicinfo.hotelId}&rOffset=${currReviewOffset}&tGuide=${prevTGOffset}"><-previous</a>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                    <a href="showhotelinfo.htm?hotelID=${basicinfo.hotelId}&rOffset=${currReviewOffset}&tGuide=${nextTGOffset}">next-></a>
                        
                    <div class="cleaner_h30">&nbsp;</div>
                </div>

                <div class="content_left_section">
                    <div class="content_title_01">Reviews</div>
                    <table border="0">
                        <thead>
                            <tr>
                                <th width="90" align="left" >User</th>
                                <th width="90" align="left" >Date</th>
                                <th width="370" align="left" >Review</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="review" items="${reviews}">
                                <tr>
                                    <td><a href="showcustomerinfo.adm?customerId=${review.userId}">${review.username}</a></td>
                                    <td>${review.reviewDate}</td>
                                    <td width="170" >${review.text}</td>
                                </tr>
                            </c:forEach>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td align="left" >
                                    <a href="showhotelinfo.htm?hotelID=${basicinfo.hotelId}&rOffset=${prevReviewOffset}&tGuide=${currTGOffset}"><-previous</a>
                                </td>
                                <td></td>
                                <td align="right" >
                                    <a href="showhotelinfo.htm?hotelID=${basicinfo.hotelId}&rOffset=${nextReviewOffset}&tGuide=${currTGOffset}">next-></a>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    

                    <div class="cleaner_h30">&nbsp;</div>
                    
                    <%  if(session.getAttribute("loggedUser") != null){  %>
                        <h2>Add review</h2>
                        <form:form action="addreview.htm" method="post" commandName="reviewinfo">
                            <input type="hidden" name="hotelId" value="${basicinfo.hotelId}"/>
                            <input type="hidden" name="userId" value="${loggedUser.customerId}"/>
                            <textarea name="text" cols="64" rows="5" title="text"</textarea><br>
                                <input type="submit" value="add" />
                        </form:form>
                    <%}%>
                    
                    
                </div>


                <!-- end of welcome -->

            </div>
            <!-- end of content left -->
            <div id="content_right">
                <div class="content_right_section">
                    <div class="content_title_01">Basic Info</div>
                    <table border="0">
                        <tbody
                            <tr>
                                <td width="90" >Hotel:</td>
                                <td>${basicinfo.name}</td>
                            </tr>
                            <tr>
                                <td>IP Address:</td>
                                <td>${basicinfo.ipaddress}</td>
                            </tr>
                            <tr>
                                <td>Port:</td>
                                <td>${basicinfo.port}</td>
                            </tr>
                            <tr>
                                <td>ContextPath:</td>
                                <td>${basicinfo.contextPath}</td>
                            </tr>
                        </tbody>
                    </table>
                    <a href="showhotelbranches.htm?hotelID=${basicinfo.hotelId}" >Show Branches</a>
                    
                    <div class="cleaner_h30">&nbsp;</div>
                    <div class="cleaner_h30">&nbsp;</div>
                </div>

                <div class="content_right_section">
                    <div class="content_title_01"></div>
                    <table border="0" width="250" >
                        <tbody>
                            <tr>
                                <td> <p id="adtitle"  align="center"></p> </td>
                            </tr>
                            <tr>
                                <td><img alt="" id="adimage" src="" width="260"></img></td>
                            </tr>
                            <tr>
                                <td> <p id="adtext" align="center" ></p> </td>
                            </tr>
                        </tbody>
                    </table>
                    <!--<c:forEach var="ad" items="${advertisements}">
                        ${ad.text}<br>
                    </c:forEach>
                    <input id="text" type="text" />-->
                    
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
