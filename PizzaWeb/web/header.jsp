<%@page import="bean.User"%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*,java.util.*, javax.servlet.*,java.text.*" %>
<%
    java.util.Date date = new java.util.Date();
    SimpleDateFormat ftHour = new SimpleDateFormat ("HH");
    SimpleDateFormat ftMinute = new SimpleDateFormat ("mm");
    SimpleDateFormat ftSecond = new SimpleDateFormat ("ss");

    String role = "";
    User _userClass = new User();
    if (session.getAttribute("loginUser") != null) {
        _userClass = (User) session.getAttribute("loginUser");
        role = Integer.toString(_userClass.getRole().getRoleid());
    }else{
        String _user = "";
        String _pass = "";
        Cookie[] cookies = request.getCookies();
            for(int i = 0; i < cookies.length; i++)
            { 
                Cookie c = cookies[i];
                if (c.getName().equals("USPizzaWeb"))
                {
                    _user = c.getValue();
                }else if (c.getName().equals("PWPizzaWeb"))
                {
                    _pass = c.getValue();
                }
            }
            if (!_user.equals("") && !_pass.equals("")){
                response.sendRedirect("DoLogin");
            }
    }

    String total = "0";
    if (application.getAttribute("onlineUser") != null) {
        total = application.getAttribute("onlineUser").toString();
    }
%>
<script>
    function formatTime(hour, min, sec) {
        var temphour;		
        if (typeof(hour) == "object"){
                hour = <%= ftHour.format(date) %>;
                min = <%= ftMinute.format(date) %>;
                sec = <%= ftSecond.format(date) %>;
        }
        if (min <= 9) {min = "0" + min;}
        if (sec <= 9) {sec = "0" + sec;}
        if (hour >= 12) {temphour = hour - 12;add = " PM";} else {temphour = hour;add = " AM";} 
        document.getElementById("clock").innerHTML = ((temphour<=9) ? "0" + temphour : temphour) + ":" + min + ":" + sec + add;
        sec = parseInt(sec) + 1;
        if (sec == 60){sec = 0;min = parseInt(min) + 1;}
        if(min == 60){min = 0;hour = parseInt(hour) + 1;}
        if (hour == 24){hour = parseInt(0);}
        setTimeout("formatTime('"+parseInt(hour)+"', '"+parseInt(min)+"', '"+parseInt(sec)+"')", 1000);
    }

    window.onload=formatTime;
</script>

<div>
  <nav>
    <ul>
      <li class="nohover"><a class="nav-a nav-logo" href="index.jsp"><img src="img/ciao_logo.png" width="80"/></a></li>
      <li class="nohover"> <a class="nav-a clock nav-menu-red-normal nohover"><%= total %> user(s) online<br />
        <span class="glyphicon glyphicon-time" style="margin-right:1px"></span>
        <label id="clock"></label>
        </a> </li>
    </ul>
    <%
if (role.equals("1")){
%>
    <ul class="nav-right">
      <li><a href="index.jsp" class="nav-a nav-menu-red"><span class="glyphicon glyphicon-home"></span> Home</a></li>
      <li><a href="menu.jsp" class="nav-a nav-menu-red"><span class="glyphicon glyphicon-list-alt"></span> Menu</a></li>
      <li><a href="track.jsp" class="nav-a nav-menu-red"><span class="glyphicon glyphicon-flag"></span> Track</a></li>
      <li><a href="order.jsp" class="nav-a nav-menu-red"><span class="glyphicon glyphicon-phone-alt"></span> Order</a></li>
      <li><a href="cart.jsp" class="nav-a nav-menu-red"><span class="glyphicon glyphicon-shopping-cart"></span> Cart</a></li>
      <li id="toggleAdmin" name="toggle"> 
          <a class="nav-a nav-menu-red noselect" onclick="showDropdown('dropdownAdmin', 'toggleAdmin')"> 
              <span class="glyphicon glyphicon-user"></span> Welcome, <%= _userClass.getName() %> <b class="caret"></b></a>
        <ul style="width:200px" name="dropdown" id="dropdownAdmin">
          <li class="label noselect"><span class="glyphicon glyphicon-cog"></span> Admin Panel</li>
          <li><a href="customer.jsp" class="nav-a nav-menu-red">Customer</a></li>
          <li><a href="product.jsp" class="nav-a nav-menu-red">Product</a></li>
          <li><a href="transaction.jsp" class="nav-a nav-menu-red">Transaction</a></li>
          <li class="divider"></li>
          <li><a href="/PizzaWeb/DoLogout" class="nav-a nav-menu-red"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
        </ul>
      </li>
      <%
}else if (role.equals("2")) {
%>
	<ul class="nav-right">
      <li><a href="index.jsp" class="nav-a nav-menu-red"><span class="glyphicon glyphicon-home"></span> Home</a></li>
      <li><a href="menu.jsp" class="nav-a nav-menu-red"><span class="glyphicon glyphicon-list-alt"></span> Menu</a></li>
      <li><a href="track.jsp" class="nav-a nav-menu-red"><span class="glyphicon glyphicon-flag"></span> Track</a></li>
      <li><a href="order.jsp" class="nav-a nav-menu-red"><span class="glyphicon glyphicon-phone-alt"></span> Order</a></li>
      <li><a href="cart.jsp" class="nav-a nav-menu-red"><span class="glyphicon glyphicon-shopping-cart"></span> Cart</a></li>
      <li id="toggleMember" name="toggle"> 
          <a class="nav-a nav-menu-red noselect" data-toggle="dropdown" onclick="showDropdown('dropdownMember', 'toggleMember')"> 
              <span class="glyphicon glyphicon-user"></span> Welcome, <%= _userClass.getName() %> <b class="caret"></b></a>
        <ul style="width:200px;" name="dropdown" id="dropdownMember">
          <li><a href="/PizzaWeb/DoLogout" class="nav-a nav-menu-red"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
        </ul>
      </li>
     </ul>
      <%
}else {
%>
      <ul class="nav-right">
        <li><a href="index.jsp" class="nav-a nav-menu-red"><span class="glyphicon glyphicon-home"></span> Home</a></li>
        <li><a href="menu.jsp" class="nav-a nav-menu-red"><span class="glyphicon glyphicon-list-alt"></span> Menu</a></li>
        <li class="disable"><a class="nav-a nav-menu-red-disable noselect"><span class="glyphicon glyphicon-flag"></span> Track</a></li>
        <li class="disable"><a class="nav-a nav-menu-red-disable noselect"><span class="glyphicon glyphicon-phone-alt"></span> Order</a></li>
        <li class="disable"><a class="nav-a nav-menu-red-disable noselect"><span class="glyphicon glyphicon-shopping-cart"></span> Cart</a></li>
        <li id="toggleLogin" name="toggle"> <a class="nav-a nav-menu-red noselect" onclick="showDropdown('dropdownLogin', 'toggleLogin')"> 
                <span class="glyphicon glyphicon-user"></span> Login <b class="caret"></b></a>
          <ul style="padding:15px 15px 10px 15px;width:270px" name="dropdown" id="dropdownLogin">
            <div>
              <form action="DoLogin" method="POST" action="DoLogin" method="POST">
                <%
                    String _error = "";
                    if (session.getAttribute("errLogin") != null) {
                        if (session.getAttribute("errLogin").toString().equals("1")){
                            _error = "Username must be filled!";
                        }else if (session.getAttribute("errLogin").toString().equals("2")){
                            _error = "Password must be filled!";
                        }else if (session.getAttribute("errLogin").toString().equals("3")){
                            _error = "Username or password is incorrect!";
                        }else if (session.getAttribute("errLogin").toString().equals("4")){
                            _error = "Sorry, something went wrong!";
                        }
                %>
        <label style="margin-bottom:7px;display:block;font-weight:700;color:#9E100B;font-size:12px;text-align:center"><%=_error%></label>
        <script>showDropdown('dropdownLogin', 'toggleLogin')</script>
                <%
                    }
                %>
                  
                <div style="margin-bottom:10px;">
                    <input class="control" placeholder="Username" name="txtUsername" id="txtUsername">
                </div>
                <div style="margin-bottom:5px;">
                    <input type="password" class="control" placeholder="Password" name="txtPassword" id="txtPassword">
                </div>
                <div style="font-size:12px;margin-bottom:3px;">
                  <label class="nav-menu-red-normal noselect" style="cursor:pointer"> 
                      <input type="checkbox" name="chkRemember" id="chkRemember"> Remember me </label>
                </div>
                <div style=" vertical-align:middle">
                  <button type="submit" class="button-red">Sign in</button>
                  <label class="nav-menu-red inline"> or</label>
                  <a href="register.jsp" class="nav-menu-red inline" style="padding:0;"> Sign Up</a> </div>
              </form>
            </div>
          </ul>
        </li>
      </ul>
      <%
}
%>
    </ul>
  </nav>
</div>
<%
    session.removeAttribute("errLogin");
    String uri = request.getRequestURI();
    String pageName = uri.substring(uri.lastIndexOf("/")+1);
    if (!pageName.equals("menu.jsp")){
        session.removeAttribute("searchName");
        session.removeAttribute("searchPrice");
    }
%>
