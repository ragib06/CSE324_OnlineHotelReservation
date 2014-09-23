<%@ include file="../include/header" %>
<script type="text/javascript" src="images/textStyle.js"></script>
<body  onload="initialize();">
    <div id="container">
        <div id="header">
            
            <p align="right">
                <a href="registration1.htm">Register</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="login.htm">Login</a>
            </p>
            <%@ include file="../include/title" %>

            <%
                if(session.getAttribute("loggedUser") != null)
                    response.sendRedirect("home.htm");
            %>

        </div>
        <!-- end of header -->
        <div id="banner">
            <div id="menu">
                <ul>
                    <li><a href="index.htm" class="current">Home</a></li>
                    <li><a href="advancesearch.htm">Bookings</a></li>
                    <li><a href="showhotels.htm">Hotels</a></li>
                </ul>
            </div>
        </div>
        <!-- end of banner -->
        <div id="content">
            <div id="content_left">
                <div class="content_left_section">
                    <div class="content_title_01">Welcome to hotel &amp; travel</div>
                    <img src="images/image_01.jpg" alt="" />
                    <p>This is a free website template provided by TemplateMo.com. You may download, modify and apply this layout for your personal or business websites. Credit goes to photovaco.com for photos.</p>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec dictum, urna eu feugiat ultricies, turpis leo tempor lacus, in vestibulum diam nisl sed lorem. </p>
                    <p>Mauris at tortor non mauris rhoncu vesti bulum. Praesent purus nuncn com modo metus. Mae cen astin cidu tellus et risus com modo lobor tiSed alique.</p>
                </div>
                <!-- end of welcome -->

                <div class="cleaner_h40">&nbsp;</div>
                <div class="content_left_2column_box">
                    <div class="content_title_01">Tour Guides</div>
                    <p>Curabitur tempor mattis placerat. Duis malesuada posuere magna at fermentum.</p>
                    <ul>
                        <li>Quisque facilisis suscipit elit</li>
                        <li>Lacus et dictum tristique</li>
                        <li>Eeros ac tincidunt aliquam</li>
                        <li>Nullam commodo arcu non facilisis</li>
                        <li>Duis commodo erat</li>
                    </ul>
                    <div class="cleaner_h10">&nbsp;</div>
                    <div class="rc_btn_02"><a href="">View All</a></div>
                </div>
                <div class="content_left_2column_box">
                    <div class="content_title_01">Services</div>
                    <p>Donec eget ligula metus. In sapien nibh, tincidunt non ultricies vel, molestie quis massa. </p>
                    <ul>
                        <li>Cras metus lectus</li>
                        <li>Mauris vitae lacinia tortor</li>
                        <li>Suspendisse potenti</li>
                        <li>Pellentesque tincidunt magna</li>
                    </ul>
                    <div class="cleaner_h10">&nbsp;</div>
                    <div class="rc_btn_02"><a href="services.htm">View All</a></div>
                </div>
                <div class="cleaner_h40">&nbsp;</div>

                <div class="cleaner_h20">&nbsp;</div>

                <div class="cleaner_h20">&nbsp;</div>
                <div class="content_left_section">
                    <div class="content_title_01">Gallery</div>
                    <div class="gallery_box"> <img src="images/image_02.jpg" alt="" /> <a href="">one</a> </div>
                    <div class="gallery_box"> <img src="images/image_03.jpg" alt="" /> <a href="">two</a> </div>
                    <div class="gallery_box"> <img src="images/image_04.jpg" alt="" /> <a href="">three</a> </div>
                    <div class="gallery_box"> <img src="images/image_05.jpg" alt="" /> <a href="">four</a> </div>
                    <div class="gallery_box"> <img src="images/image_06.jpg" alt="" /> <a href="">five</a> </div>
                    <div class="cleaner_h20">&nbsp;</div>
                    <div class="rc_btn_02"><a href="gallery.htm">View All</a></div>
                    <div class="cleaner">&nbsp;</div>
                </div>

            </div>
            <!-- end of content left -->
            <div id="content_right">
                <div class="content_right_section">
                    <div class="content_title_01">Booking</div>
                    <form:form name="searchform" action="search_booking.htm" commandName="search" method="post">
                        <div class="form_row">
                            <label>City</label><input id="bcity" type="text" name="city" onfocus="setTextStyle(this.id);" onblur="clearText(this.id);"/>
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
                            <label>Days:</label><input id="days" type="text" name="noOfDays" onfocus="setTextStyle(this.id);" onblur="clearText(this.id);"/>
                        </div>
                        <div class="form_row">
                            <label>Persons:</label><input id="persons" type="text" name="person" onfocus="setTextStyle(this.id);" onblur="clearText(this.id);"/>
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
                        frmvalidator.addValidation("person","req","Please enter persons");
                        frmvalidator.addValidation("person","numeric","Digits only");
                    </script>

                    <div class="cleaner">&nbsp;</div>
                </div>

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
            <!-- end of content right -->
            <div class="cleaner">&nbsp;</div>
        </div>
        <%@ include file="../include/footer" %>
    </div>
    <!-- end of container -->
</body>
</html>
