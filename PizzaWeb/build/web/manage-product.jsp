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
        String _idProduct, _productName, _productDesc, _productPrice, _productImage;
        _idProduct = _productDesc = _productImage = _productPrice = _productName = "";
        String _action = "DoInsertProduct";
        String _header = "Add Product Data";
        if (request.getParameter("id") != null){
                _idProduct = request.getParameter("id");                
                _header = "Update Product Data";

                _product = _adap.getProductSingle(_idProduct);                    
                _action = "DoUpdateProduct";
                _productName = _product.getName();
                _productDesc = _product.getDescription();                
                _productPrice = String.valueOf(_product.getPrice());
                _productImage = _product.getImage();
        }
		
    %>
    <h1 class="page-header nav-menu-red" style="font-size:20px; text-align:center"><%= _header %></h1>
    <%
        String _errMsg = "0000";
        if(request.getParameter("errMsg") != null){
            _errMsg = request.getParameter("errMsg");
        }
        String _msg = "";
        if(_errMsg.length() == 4){
            if (_errMsg.charAt(0) == '1'){
                    _msg = "Name must be filled <br>";
            }
            if(_errMsg.charAt(1) == '1'){
                    _msg += "Description must be more than 8 characters <br>";
            }
            if(_errMsg.charAt(2) == '1'){
                    _msg += "Price Must be numeric <br>";
            }  
            if(_errMsg.charAt(3) == '1'){
                    _msg += "Image Must be filled<br>";
            }
        }
        else if(_errMsg.equals("2")){
            _msg = "Save Failed";
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
            <input type="text" class="control" id="txtProductName" name="txtProductName" value ="<%=_productName%>">
          </div>
        </div>
        <div style="margin-bottom:10px;">
          <label for="txtProductDescription" class="nav-menu-red" style="display:inline-block; width:20%;">Description</label>
          <b class="nav-menu-red">:</b>
          <div style="width:50%; display:inline-block; vertical-align:middle">
            <textarea class="control" style="height:140px;resize:none" id="txtProductDescription" name="txtProductDescription"><%=_productDesc%></textarea>
          </div>
        </div>
        <div style="margin-bottom:5px;">
          <label for="txtProductPrice" class="nav-menu-red" style="display:inline-block; width:20%">Price</label>
          <b class="nav-menu-red">:</b>
          <div style="width:50%; display:inline-block">
            <input type="text" class="control" id="txtProductPrice" name="txtProductPrice" value ="<%=_productPrice%>">
          </div>
        </div>
        <div style="margin-bottom:5px;">
          <label for="txtProductPrice" class="nav-menu-red" style="display:inline-block; width:20%">Image</label>
          <b class="nav-menu-red">:</b>
          <div style="display:inline-block">
            <input type="file" id="fileImage" style="display:none">
            <div class="inputFile">
              <input type="button" value="Browse" class="button-red" id="btnFile" onClick="btnFileClick()"/>
              <label id="lblFile" class="nav-menu-red-normal" ><%=_productImage%></label>
              <input type="hidden" value="<%=_productImage%>" name="productImage" id="hdnProductImage"/>
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
