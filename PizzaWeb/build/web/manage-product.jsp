<%@page import="controller.Adapter"%>
<%@page import="bean.Product"%>
<%
    if (session.getAttribute("loginUser") == null) {
        boolean remember = false;
        String _user = "";
        String _pass = "";
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (int i = 0; i < cookies.length; i++) {
                Cookie c = cookies[i];
                if (c.getName().equals("USPizzaWeb")) {
                    _user = c.getValue();
                } else if (c.getName().equals("PWPizzaWeb")) {
                    _pass = c.getValue();
                }
            }
            if (!_user.equals("") && !_pass.equals("")) {
                remember = true;
                session.setAttribute("gotoURL", "product");
                response.sendRedirect("DoLogin");
            }
        }
        if (!remember) {
            response.sendRedirect("pagenotfound.jsp");
        }
    } else if (session.getAttribute("loginUser") != null && ((User) session.getAttribute("loginUser")).getRole().getRoleid() != 1) {
        response.sendRedirect("pagenotfound.jsp");
    } else {
%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Manage Product - Grazzie Pizza</title>
        <link href="css/main.css" rel="stylesheet">
        <script src="js/main.js"></script>
    </head>
    <body>
        <div class="wrapper">
            <%@include file="header.jsp" %>
            <div>
                <%
                    String _header = "Add Product Data";
                    String _action = "DoInsertProduct";
                    if (request.getParameter("id") != null || session.getAttribute("_productId") != null) {
                        _header = "Update Product Data";
                        _action = "DoUpdateProduct";
                    }
                %>
                <h1 class="page-header nav-menu-red" style="font-size:20px; text-align:center"><%= _header%></h1>
                <%
                    String _idProduct, _productName, _productDesc, _productPrice, _productImage;
                    _idProduct = _productDesc = _productImage = _productPrice = _productName = "";
                    String _msg = "";
                    if (session.getAttribute("errProductMsg") != null) {
                        _msg = session.getAttribute("errProductMsg").toString();
                        if (session.getAttribute("_productName") != null) {
                            _productName = session.getAttribute("_productName").toString();
                        }
                        if (session.getAttribute("_productDesc") != null) {
                            _productDesc = session.getAttribute("_productDesc").toString();
                        }
                        if (session.getAttribute("_productPrice") != null) {
                            _productPrice = session.getAttribute("_productPrice").toString();
                        }
                        if (session.getAttribute("_productId") != null) {
                            _idProduct = session.getAttribute("_productId").toString();
                        }
                    }
                    if (!_msg.equals("")) {
                %>
                <div class="alert fail" name="alert"> <span style="width:97.5%; display:inline-block"><b><%= _msg%></b></span>
                    <button type="button" class="close" id="btnClose" onClick="hideAlert()">×</button>
                </div>
                <% } else {
                        Adapter _adap = new Adapter();
                        Product _product = new Product();
                        if (request.getParameter("id") != null) {
                            _idProduct = request.getParameter("id");

                            _product = _adap.getProductSingle(_idProduct);
                            _productName = _product.getName();
                            _productDesc = _product.getDescription();
                            _productPrice = String.valueOf(_product.getPrice());
                            _productImage = _product.getImage();
                        }
                    }
                %>
                <div style="padding:20px; padding-top:10px">
                    <form action="<%=_action%>" method="POST">
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
<%
        if (session.getAttribute("errProductMsg") != null) {
            session.removeAttribute("errProductMsg");
        }
        if (session.getAttribute("_productName") != null) {
            session.removeAttribute("_productName");
        }
        if (session.getAttribute("_productDesc") != null) {
            session.removeAttribute("_productDesc");
        }
        if (session.getAttribute("_productPrice") != null) {
            session.removeAttribute("_productPrice");
        }
        if (session.getAttribute("_productId") != null) {
            session.removeAttribute("_productId");
        }
    }
%>