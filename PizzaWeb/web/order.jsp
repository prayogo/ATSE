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
  <%
	DecimalFormat formatter = new DecimalFormat("#,###.00");
  %>
  <%@include file="header.jsp" %>
  <div>
    <h1 class="page-header nav-menu-red" style="font-size:20px; text-align:center">Available Product(s)</h1>
    <%
		String err = "0";
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
    <div style="padding:20px;">
      <div class="col-full"> <span style="font-size:16px"><b>A</b></span> </div>
      <div class="col-45" style="margin-bottom:5px; margin-right:20px;">
        <form>
          <div style="width:35%;overflow:hidden; display:inline-block">
            <label for="" style="font-weight:normal">American Favorite</label>
          </div>
          <div style="width:25%;overflow:hidden;display:inline-block">
            <label for="" style="font-weight:normal">Rp. <%= formatter.format(89000)%></label>
          </div>
          <div style="display:inline-block">
            <input type="text" class="control" style="width:55px" placeholder="Qty">
          </div>
          <button type="submit" class="button-red">Add to Cart</button>
        </form>
      </div>
      <div class="col-45" style="margin-bottom:5px; margin-right:20px;">
        <form>
          <div style="width:35%;overflow:hidden; display:inline-block">
            <label for="" style="font-weight:normal">American Favorite</label>
          </div>
          <div style="width:25%;overflow:hidden;display:inline-block">
            <label for="" style="font-weight:normal">Rp. <%= formatter.format(89000)%></label>
          </div>
          <div style="display:inline-block">
            <input type="text" class="control" style="width:55px" placeholder="Qty">
          </div>
          <button type="submit" class="button-red">Add to Cart</button>
        </form>
      </div>
      <div class="col-45" style="margin-bottom:5px; margin-right:20px;">
        <form>
          <div style="width:35%;overflow:hidden; display:inline-block">
            <label for="" style="font-weight:normal">American Favorite</label>
          </div>
          <div style="width:25%;overflow:hidden;display:inline-block">
            <label for="" style="font-weight:normal">Rp. <%= formatter.format(89000)%></label>
          </div>
          <div style="display:inline-block">
            <input type="text" class="control" style="width:55px" placeholder="Qty">
          </div>
          <button type="submit" class="button-red">Add to Cart</button>
        </form>
      </div>
      
      <div class="col-full"> <span style="font-size:16px"><b>B</b></span> </div>
      <div class="col-45" style="margin-bottom:5px; margin-right:20px;">
        <form>
          <div style="width:35%;overflow:hidden; display:inline-block">
            <label for="" style="font-weight:normal">American Favorite</label>
          </div>
          <div style="width:25%;overflow:hidden;display:inline-block">
            <label for="" style="font-weight:normal">Rp. <%= formatter.format(89000)%></label>
          </div>
          <div style="display:inline-block">
            <input type="text" class="control" style="width:55px" placeholder="Qty">
          </div>
          <button type="submit" class="button-red">Add to Cart</button>
        </form>
      </div>
    </div>
  </div>
  <%@include file="footer.jsp" %>
</div>
</body>
</html>
<%
    if (session.getAttribute("errOrderMsg") != null){
        session.removeAttribute("errOrderMsg");
    }
    if (session.getAttribute("errOrderType") != null){
        session.removeAttribute("errOrderType");
    }    
%>
