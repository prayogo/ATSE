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
    <h1 class="page-header nav-menu-red" style="font-size:20px; text-align:center">Transaction List</h1>    
    <div align="right" style="padding-right:20px;">
    	<button class="button-red"><span class="glyphicon glyphicon-eye-open"></span> View Transaction Report</button></div>
    <div style="padding:10px 20px">
    <%
		DecimalFormat formatter = new DecimalFormat("#,###.00");
                
                Adapter _adap = new Adapter();
                
	%>
      <div class="box">
        <div style="color:#9E100B !important;margin-bottom:15px;height:32px">
          <div class="col-30"> <b>Customer:</b> charl14 </div>
          <div class="col-30"> <b>Order Time:</b> 2013-12-16 09:30:42.0 </div>
          <div style="width:35%; display:inline-block"> <b>Status:</b> 
          	<div style="display:inline-block; width:50%">
          	<select class="select" style="width:100%">
            	
            </select>
            </div>
            <a class="button-red button-sm" style="margin-top:0; width:auto">Change</a>
          </div>
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
