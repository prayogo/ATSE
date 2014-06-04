<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<link href="css/main.css" rel="stylesheet">
<script src="js/main.js"></script>
</head>
<body>
<div class="wrapper">
  <%@include file="header.jsp" %>
  <div>
    <h1 class="page-header nav-menu-red" style="font-size:20px; text-align:center">My Order</h1>
    <%
		String err = "1";
		String msg = "Quantity must be greater than zero";
		if(err.equals("0")){
	%>
    <div class="alert success" name="alert"> <b><%= msg %></b>
      <button type="button" class="close" onClick="hideAlert()">×</button>
    </div>
    <%
		} else {
	%>
    <div class="alert fail" name="alert"> <b><%= msg %></b>
      <button type="button" class="close" onClick="hideAlert()">×</button>
    </div>
    <% } %>
    <div style="padding:10px 20px">
    <%
		DecimalFormat formatter = new DecimalFormat("#,###.00");
	%>
      <div class="box">
        <div style="color:#9E100B !important;margin-bottom:5px;height:32px">
          <div class="col-30" style="padding-top:6px;"> <b>Customer:</b> charl14 </div>
          <div class="col-30" style="padding-top:6px;"> <b>Order Time:</b> 2013-12-16 09:30:42.0 </div>
          <div class="col-20" style="padding-top:6px;"> <b>Status:</b> In Progress </div>
          <div style="display:inline-block; float:right"> <a class="button-red button-sm" style="margin-top:0"><span class="glyphicon glyphicon-remove"></span> Cancel Order</a> </div>
        </div>
        <table class="table table-striped" style="color:#9E100B !important;margin-bottom:15px;">
          <thead>
            <tr>
              <th>Product Name</th>
              <th>Price</th>
              <th>Quantity</th>
              <th>Subtotal</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><a href="#" class="nav-menu-red-normal link">American Favorite</a></td>
              <td>Rp. <%= formatter.format(89000) %></td>
              <td align="center">5 pc(s)</td>
              <td>Rp. <%= formatter.format(445000) %></td>
            </tr>
            <tr>
              <td><a href="#" class="nav-menu-red-normal link">Cheesy Galore</a></td>
              <td>Rp. <%= formatter.format(82000) %></td>
              <td align="center">3 pc(s)</td>
              <td>Rp. <%= formatter.format(246000) %></td>
            </tr>
          </tbody>
          <tfoot>
            <tr>
              <td></td>
              <td></td>
              <td><b>Total Price</b></td>
              <td><b>Rp. <%= formatter.format(707000) %></b></td>
            </tr>
          </tfoot>
        </table>
      </div>
      <div class="box">
        <div style="color:#9E100B !important;margin-bottom:5px; height:32px">
          <div class="col-30" style="padding-top:6px;"> <b>Customer:</b> charl14 </div>
          <div class="col-30" style="padding-top:6px;"> <b>Order Time:</b> 2013-12-16 09:30:42.0 </div>
          <div class="col-20" style="padding-top:6px;"> <b>Status:</b> Canceled </div>
        </div>
        <table class="table table-striped" style="color:#9E100B !important;margin-bottom:15px;">
          <thead>
            <tr>
              <th>Product Name</th>
              <th>Price</th>
              <th>Quantity</th>
              <th>Subtotal</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><a href="#" class="nav-menu-red-normal link">American Favorite</a></td>
              <td>Rp. <%= formatter.format(89000) %></td>
              <td align="center">5 pc(s)</td>
              <td>Rp. <%= formatter.format(445000) %></td>
            </tr>
            <tr>
              <td><a href="#" class="nav-menu-red-normal link">Cheesy Galore</a></td>
              <td>Rp. <%= formatter.format(82000) %></td>
              <td align="center">3 pc(s)</td>
              <td>Rp. <%= formatter.format(246000) %></td>
            </tr>
          </tbody>
          <tfoot>
            <tr>
              <td></td>
              <td></td>
              <td><b>Total Price</b></td>
              <td><b>Rp. <%= formatter.format(707000) %></b></td>
            </tr>
          </tfoot>
        </table>
      </div>
    </div>
  </div>
  <%@include file="footer.jsp" %>
</div>
</body>
</html>
