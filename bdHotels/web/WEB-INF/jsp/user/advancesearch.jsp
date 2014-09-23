<%@ include file="../include/header" %>
<body>
    <div id="container">
        <div id="header">
            <p align="right"> 
                <%
                    if(session.getAttribute("loggedUser") == null){
                        response.sendRedirect("login.htm");
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
                    <li><a href="index.htm">Home</a></li>
                    <li><a href="showhotels.htm">Hotels</a></li>
                    <li><a href="edit.htm">Edit Profile</a></li>
                    <li><a href="advancesearch.htm" class="current">Advance Search</a></li>
                </ul>
            </div>
        </div>
        <!-- end of banner -->
        <div id="content">
            <div id="content_left">
                <div class="content_left_section">
                  <div class="content_title_01">Booking</div>
                  <form:form name="searchform" action="advance_search_booking.htm" commandName="search" method="post">
                        <div class="form_row">
                            <label>City</label><input type="text" name="city" />
                        </div>
                        <div class="form_row">
                            <label>Arrival</label>

                            <select name="day">
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                                <option>5</option>
                                <option>6</option>
                                <option>7</option>
                                <option>8</option>
                                <option>9</option>
                                <option>10</option>
                                <option>11</option>
                                <option>12</option>
                                <option>13</option>
                                <option>14</option>
                                <option>15</option>
                                <option>16</option>
                                <option>17</option>
                                <option>18</option>
                                <option>19</option>
                                <option>20</option>
                                <option>21</option>
                                <option>22</option>
                                <option>23</option>
                                <option>24</option>
                                <option>25</option>
                                <option>26</option>
                                <option>27</option>
                                <option>28</option>
                                <option>29</option>
                                <option>30</option>
                                <option>31</option>
                            </select>

                            <select name="month">
                                <option value="1">Jan</option>
                                <option value="2">Feb</option>
                                <option value="3">Mar</option>
                                <option value="4">April</option>
                                <option value="5">May</option>
                                <option value="6">June</option>
                                <option value="7">July</option>
                                <option value="8">Aug</option>
                                <option value="9">Sep</option>
                                <option value="10">Oct</option>
                                <option value="11">Nov</option>
                                <option value="12">Dec</option>
                            </select>
                            <select name="year">
                                <option>2010</option>
                                <option>2011</option>
                                <option>2012</option>
                                <option>2013</option>
                                <option>2014</option>
                                <option>2015</option>
                                <option>2016</option>
                                <option>2017</option>
                                <option>2018</option>
                                <option>2019</option>
                                <option>2020</option>
                                <option>2021</option>
                                <option>2022</option>
                                <option>2013</option>
                                <option>2024</option>
                            </select>
                        </div>
                        <div class="form_row">
                            <label>Days:</label><input type="text" name="noOfDays" />
                        </div>
                        <div class="form_row">
                            <label>Persons:</label><input type="text" name="person" />
                        </div>
                        <div class="form_row">
                            <label >Optional:</label>
                        </div>
                        <div class="form_row">
                            <label>floor no:</label><input type="text" name="floorNo" />
                        </div>
                        <div class="form_row">
                            <label>sideView:</label><input type="text" name="sideView" />
                        </div>
                        <div class="form_row">
                            <label>Max price limit:</label><input type="text" name="rent" />
                        </div>
                        <div class="cleaner_h20">&nbsp;</div>
                        <input class="submitbutton" type="submit" value="search"/>
                    </form:form>

                    <script language="JavaScript" type="text/javascript">
                        //You should create the validator only after the definition of the HTML form
                        var frmvalidator  = new Validator("searchform");
                        frmvalidator.addValidation("city","req","Please enter city");

                        frmvalidator.addValidation("noOfDays","req","Please enter days");
                        frmvalidator.addValidation("noOfDays","numeric","Digits only");

                        frmvalidator.addValidation("floorNo","numeric","Digits only");
                        frmvalidator.addValidation("rent","decimal","Digits only");

                        frmvalidator.addValidation("person","req","Please enter persons");
                        frmvalidator.addValidation("person","numeric","Digits only");
                    </script>

                    <div class="cleaner">&nbsp;</div>
                </div>
            </div>
            <!-- end of content left -->
            <div id="content_right">
                <div class="content_right_section">
                    

                <div class="cleaner_h30">&nbsp;</div>
                <!--<div class="cleaner_horizontal_divider_01">&nbsp;</div>-->
                <div class="cleaner_h30">&nbsp;</div>
                <div class="content_right_section">
                    <div class="content_title_01">Latest News</div>
                    <div class="news_title">Nam auctor aliquam leo</div>
                    <p>Pellentesque est elit, sagittis sit amet porttitor ut, ornare vel turpis. Vivamus eu enimvitae neque its posuere rutrum. <a href="">read more</a></p>
                    <div class="cleaner_h30">&nbsp;</div>
                    <div class="news_title">Suspendisse pharetra eros molestie</div>
                    <p>Vivamus eu enimvitae neque its posuere rutrum. Nam accumsan turpis at turpis molestie a convallis forte tor ornare. <a href="">read more</a></p>
                    <div class="cleaner_h20">&nbsp;</div>
                    <div class="rc_btn_02"><a href="">View All</a></div>
                </div>
                <!-- end of news section -->
                <div class="cleaner_h30">&nbsp;</div>
                <div class="cleaner_h30">&nbsp;</div>
                <a href=""><img width="275" src="images/special_offer.jpg" alt="" /></a>
                <div class="cleaner_h30">&nbsp;</div>

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
