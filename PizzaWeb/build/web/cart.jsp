<%
    if (session.getAttribute("loginUser") == null) {
        boolean remember = false;
        Cookie[] cookies = request.getCookies();
        if (cookies != null){
            for(int i = 0; i < cookies.length; i++)
            { 
                Cookie c = cookies[i];
                if (c.getName().equals("USPizzaWeb") || c.getName().equals("PWPizzaWeb"))
                {
                    remember = true;
                    session.setAttribute("gotoURL", "cart");
                }
            }
            if (!remember){
                response.sendRedirect("pagenotfound.jsp");
            }
        }
    }
%>
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
  <div style="width:100%">
    <h1 class="page-header nav-menu-red" style="font-size:20px; text-align:center">Your Cart</h1>
    <%
		String err = "1";
		String msg = "Quantity must be greater than zero";
		if(err.equals("0")){
	%>
    <div class="alert success" name="alert"> <b>3 American Favorite(s) Added to Cart</b>
      <button type="button" class="close" onClick="hideAlert()">×</button>
    </div>
    <%
		} else {
	%>
    <div class="alert fail" name="alert"> <b><%= msg %></b>
      <button type="button" class="close" onClick="hideAlert()">×</button>
    </div>
    <% } %>
    <div style="padding:0px 20px">
    <%
		DecimalFormat formatter = new DecimalFormat("#,###.00");
	%>
    <table class="table" style="color:#9E100B !important">
      <thead>
      <tr>
        <th width="45%">Product Name</th>
        <th width="15%">Price</th>
        <th width="15%">Quantity</th>
        <th width="15%">Subtotal</th>
        <th width="10%"></th>
      </tr>
      </thead>
      <tbody>
      <tr>
        <td><a href="#" class="nav-menu-red-normal link">American Favorite</a></td>
        <td>Rp. <%= formatter.format(89000) %></td>
        <td align="center">5 pc(s)</td>
        <td>Rp. <%= formatter.format(445000) %></td>
        <td><a class="button-red button-sm" style="margin:0"><span class="glyphicon glyphicon-trash"></span> Delete Item</a></td>
      </tr>
      <tr>
        <td><a href="#" class="nav-menu-red-normal link">Cheesy Galore</a></td>
        <td>Rp. <%= formatter.format(82000) %></td>
        <td align="center">3 pc(s)</td>
        <td>Rp. <%= formatter.format(246000) %></td>
        <td><a class="button-red button-sm" style="margin:0"><span class="glyphicon glyphicon-trash"></span> Delete Item</a></td>
      </tr>
      </tbody>
      <tfoot>
      <tr>
        <td align="right"><a class="button-red button-sm" style="margin:0"><span class="glyphicon glyphicon-trash"></span> Delete All</a> <a class="button-red button-sm" style="margin:0"><span class="glyphicon glyphicon-ok"></span> Confirm Order</a></td>
        <td><b>Total Price</b></td>
        <td></td>
        <td><b>Rp. 707000</b></td>
        <td></td>
      </tr>
      </tfoot>
    </table>
    </div>
  </div>
  <%@include file="footer.jsp" %>
</div>
</body>
</html>
