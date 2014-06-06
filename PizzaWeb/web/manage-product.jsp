<%@page import="controller.Adapter"%>
<%@page import="bean.Product"%>
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
    <%
            if(session.getAttribute("loginUser") == null){
                response.sendRedirect("index.jsp");
                return;
            }
            int roleid = ((User)session.getAttribute("loginUser")).getRole().getRoleid();
            if(roleid != 1){
                response.sendRedirect("index.jsp");
                return;
            }   
            
            Adapter _adap = new Adapter();
            Product _product = new Product();
            String _idProduct = "";
            String _action = "DoInsertProduct";
            String _header = "Add Product Data";
            if (request.getParameter("id") != null){
                    _idProduct = request.getParameter("id");
                    _header = "Update Product Data";
                    
                    _product = _adap.getProductSingle(_idProduct);                    
                    _action = "DoUpdateProduct";
            }
		
	%>
    <h1 class="page-header nav-menu-red" style="font-size:20px; text-align:center"><%= _header %></h1>
    <%
		String _errMsg = "1";
		String _msg = "";
		if (_errMsg.charAt(0) == '1'){
			_msg = "Username must be filled";
		}
		
		if (!_msg.equals("")){
	%>
    <div class="alert fail" name="alert"> <span style="width:97.5%; display:inline-block"><b><%= _msg %></b></span>
      <button type="button" class="close" id="btnClose" onClick="hideAlert()">×</button>
    </div>
    <% } %>
    <div style="padding:20px; padding-top:10px">
      <form action="<%=_action%>">
           <input type="hidden" name="productId" value="<%=_idProduct%>">
        <div style="margin-bottom:10px;">
          <label for="txtProductName" class="nav-menu-red" style="display:inline-block; width:20%">Name</label>
          <b class="nav-menu-red">:</b>
          <div style="width:50%; display:inline-block">
            <input type="text" class="control" id="txtProductName" name="txtProductName" value ="<%=_product.getName()%>">
          </div>
        </div>
        <div style="margin-bottom:10px;">
          <label for="txtProductDescription" class="nav-menu-red" style="display:inline-block; width:20%;">Description</label>
          <b class="nav-menu-red">:</b>
          <div style="width:50%; display:inline-block; vertical-align:middle">
            <textarea class="control" style="height:140px;resize:none" id="txtProductDescription" name="txtProductDescription"><%=_product.getDescription()%></textarea>
          </div>
        </div>
        <div style="margin-bottom:5px;">
          <label for="txtProductPrice" class="nav-menu-red" style="display:inline-block; width:20%">Price</label>
          <b class="nav-menu-red">:</b>
          <div style="width:50%; display:inline-block">
            <input type="text" class="control" id="txtProductPrice" name="txtProductPrice" value ="<%=_product.getPrice()%>">
          </div>
        </div>
        <div style="margin-bottom:5px;">
          <label for="txtProductPrice" class="nav-menu-red" style="display:inline-block; width:20%">Image</label>
          <b class="nav-menu-red">:</b>
          <div style="display:inline-block">
            <input type="file" id="fileImage" name="productImage" style="display:none">
            <div class="inputFile">
              <input type="button" value="Browse" class="button-red" id="btnFile" onClick="btnFileClick()"/>
              <label id="lblFile" class="nav-menu-red-normal"><%=_product.getImage()%></label>
            </div>
          </div>
        </div>
        <div>
          <div style="display:block; margin-left:20%; padding-left:11px">
            <button type="submit" class="button-red"><span class="glyphicon glyphicon-floppy-disk"></span> Save Product</button>
          </div>
        </div>
      </form>
    </div>
  </div>
  <%@include file="footer.jsp" %>
</div>
</body>
</html>
