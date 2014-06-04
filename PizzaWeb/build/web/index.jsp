<%
    String _rolePage = "";
    if (session.getAttribute("loginUser") != null) {
        User _loginUser = (User)session.getAttribute("loginUser");
        _rolePage = Integer.toString(_loginUser.getRole().getRoleid());
    }
%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Untitled Document</title>
<link href="css/main.css" rel="stylesheet">
<script src="js/main.js"></script>
</head>
<body>
<div class="wrapper">
  <%@include file="header.jsp" %>
  <div style="margin-top:-53px">
    <div class="homeBigPic" style="background:url(img/FreeGreatPicture.com-14713-hd-pizza-gourmet.jpg);background-size:100% 700px;"></div>
    <div align="right" style="margin-top:-470px;float:right"><img src="img/ciao_logo.png" width="200"/></div>
    <label class="homeBigRCaption">DELICIOUS PIZZA</label>
    <div>
        <div style="width:50%;float:left;"> <a class="menuBox" style="margin:5px 2.5px 5px 0px;" href="menu.jsp">
        <div class="div-highlight"> <span class="span-highlight"></span> <img src="img/HotPizza.jpg" width="100%" height="100%"/> </div>
        <div class="caption"> <strong>
          <center>
            MENU
          </center>
          </strong> </div>
        </a> </div>
        <% 
            if (_rolePage.equals("1") || _rolePage.equals("2")){
                out.print("<div style='width:50%;float:right'> <a href='order.jsp' class='menuBox' style='margin:5px 0px 5px 2.5px;'>");
            }else{
                out.print("<div style='width:50%;float:right'> <a class='menuBox' style='margin:5px 0px 5px 2.5px;'>");
            }
        %>
        <div class="div-highlight"> <span class="span-highlight"></span> <img src="img/customer-service-agent.jpg" width="100%" height="100%"/> </div>
        <div class="caption"> <strong>
          <center>
            ORDER NOW
          </center>
          </strong> </div>
        </a> </div>
    </div>
    <div>
        <% 
            if (_rolePage.equals("1")){
                out.print("<div style='width:33%;float:left;'> <a href='customer.jsp' class='menuBox three' style='margin:0px 2.5px 5px 0px;'>");
            }else{
                out.print("<div style='width:33%;float:left;'> <a class='menuBox three' style='margin:0px 2.5px 5px 0px;'>");
            }
        %>
        <div class="div-highlight"> <span class="span-highlight"></span> <img src="img/post-family-eating-out-10-best-places1.jpg" width="100%" height="100%"/> </div>
        <div class="caption"> <strong>
          <center>
            CUSTOMER
          </center>
          </strong> </div>
        </a> </div>
        <% 
            if (_rolePage.equals("1") || _rolePage.equals("2")){
                out.print("<div style='width:34%;float:left;'> <a href='cart.jsp' class='menuBox three' style='margin:0px 2.5px 5px 2.5px;'>");
            }else{
                out.print("<div style='width:34%;float:left;'> <a class='menuBox three' style='margin:0px 2.5px 5px 2.5px;'>");
            }
        %>
        <div class="div-highlight"> <span class="span-highlight"></span> <img src="img/restaurant0.jpg" width="100%" height="100%"/> </div>
        <div class="caption"> <strong>
          <center>
            CART
          </center>
          </strong> </div>
        </a> </div>
        <% 
            if (_rolePage.equals("1") || _rolePage.equals("2")){
                out.print("<div style='width:33%;float:right;'> <a href='track.jsp' class='menuBox three' style='margin:0px 0px 5px 2.5px;'>");
            }else{
                out.print("<div style='width:33%;float:right;'> <a class='menuBox three' style='margin:0px 0px 5px 2.5px;'>");
            }
        %>
        <div class="div-highlight"> <span class="span-highlight"></span> <img src="img/map.gif" width="100%" height="100%"/> </div>
        <div class="caption"> <strong>
          <center>
            TRACK
          </center>
          </strong> </div>
        </a> </div>
    </div>
  </div>
  <%@include file="footer.jsp" %>
</div>
</body>
</html>