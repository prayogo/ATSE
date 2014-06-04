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
		String _idProduct = "";
		String _header = "Add Product Data";
		if (request.getParameter("id") != null){
			_idProduct = request.getParameter("id");
			_header = "Update Product Data";
		}
		else{
			
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
      <form>
        <div style="margin-bottom:10px;">
          <label for="txtProductName" class="nav-menu-red" style="display:inline-block; width:20%">Name</label>
          <b class="nav-menu-red">:</b>
          <div style="width:50%; display:inline-block">
            <input type="text" class="control" id="txtProductName" name="txtProductName">
          </div>
        </div>
        <div style="margin-bottom:10px;">
          <label for="txtProductDescription" class="nav-menu-red" style="display:inline-block; width:20%;">Description</label>
          <b class="nav-menu-red">:</b>
          <div style="width:50%; display:inline-block; vertical-align:middle">
            <textarea class="control" style="height:140px;resize:none" id="txtProductDescription" name="txtProductDescription"></textarea>
          </div>
        </div>
        <div style="margin-bottom:5px;">
          <label for="txtProductPrice" class="nav-menu-red" style="display:inline-block; width:20%">Price</label>
          <b class="nav-menu-red">:</b>
          <div style="width:50%; display:inline-block">
            <input type="text" class="control" id="txtProductPrice" name="txtProductPrice">
          </div>
        </div>
        <div style="margin-bottom:5px;">
          <label for="txtProductPrice" class="nav-menu-red" style="display:inline-block; width:20%">Image</label>
          <b class="nav-menu-red">:</b>
          <div style="display:inline-block">
            <input type="file" id="fileImage" style="display:none">
            <div class="inputFile">
              <input type="button" value="Browse" class="button-red" id="btnFile" onClick="btnFileClick()"/>
              <label id="lblFile" class="nav-menu-red-normal"></label>
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
