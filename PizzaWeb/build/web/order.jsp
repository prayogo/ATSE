<%@page import="bean.Product"%>
<%@page import="controller.Adapter"%>
<%
    if (session.getAttribute("loginUser") == null) {
        boolean remember = false;
        Cookie[] cookies = request.getCookies();
        for (int i = 0; i < cookies.length; i++) {
            Cookie c = cookies[i];
            if (c.getName().equals("USPizzaWeb") || c.getName().equals("PWPizzaWeb")) {
                remember = true;
                session.setAttribute("gotoURL", "cart");
            }
        }
        if (!remember) {
            response.sendRedirect("pagenotfound.jsp");
        }
    }

    int id = 0;
    if (request.getParameter("id") != null) {
        try {
            id = Integer.parseInt(request.getParameter("id").toString());
        } catch (Exception ex) {
            response.sendRedirect("order.jsp");
        }
    }

    Adapter _adapOrder = new Adapter();
    List _listProduct;
%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Order - Grazie Pizza</title>
        <link href="css/main.css" rel="stylesheet">
        <script src="js/main.js"></script>
    </head>
    <body>
        <div class="wrapper">
            <%
                DecimalFormat formatter = new DecimalFormat("#,##0.00");
            %>
            <%@include file="header.jsp" %>
            <div>
                <h1 class="page-header nav-menu-red" style="font-size:20px; text-align:center">Available Product(s)</h1>
                <%
                    String msg = "";
                    String type = "fail";

                    if (session.getAttribute("errOrderMsg") != null && session.getAttribute("errOrderType") != null) {
                        msg = session.getAttribute("errOrderMsg").toString();
                        type = session.getAttribute("errOrderType").toString();
                    }

                    if (!msg.equals("")) {
                %>
                <div class="alert <%= type%>" name="alert"> <b><%= msg%></b>
                    <button type="button" class="close" onClick="hideAlert()">×</button>
                </div>
                <% }%>
                <div style="padding:20px;">

                    <%
                        _listProduct = _adapOrder.getProduct();
                        char AZIndex = '\0';
                        if (_listProduct.size() > 0) {
                            for (int i = 0; i < _listProduct.size(); i++) {
                                Product _product = (Product) _listProduct.get(i);
                                if (Character.toUpperCase(AZIndex) != Character.toUpperCase(_product.getName().charAt(0))) {
                                    AZIndex = Character.toUpperCase(_product.getName().charAt(0));
                                    out.print("<div class='col-full'> <span style='font-size:16px'><b>" + Character.toUpperCase(AZIndex) + "</b></span> </div>");
                                }
                    %>
                    <div class="col-45" style="margin-bottom:5px; margin-right:20px;">
                        <form action="DoOrder" method="POST">
                            <input type="hidden" id="productID" name="productID" value="<%= _product.getProductid()%>">
                            <div style="width:35%;overflow:hidden; display:inline-block;vertical-align: middle;">
                                <label for="" style="font-weight:normal"><%= _product.getName()%></label>
                            </div>
                            <div style="width:25%;overflow:hidden;display:inline-block; vertical-align: middle">
                                <label for="" style="font-weight:normal">Rp. <%= formatter.format(_product.getPrice())%></label>
                            </div>
                            <div style="display:inline-block">
                                <%
                                if (id == _product.getProductid()) {
                            %>
                            <input id="txtQty" name="txtQty" type="text" class="control scrollTo" style="width:55px" placeholder="Qty" maxlength="4">
                            <%
                            } else {
                            %>
                            <input id="txtQty" name="txtQty" type="text" class="control" style="width:55px" placeholder="Qty" maxlength="4">
                            <%
                                }
                            %>
                            </div>
                            <button type="submit" class="button-red">Add to Cart</button>
                        </form>
                    </div>

                    <%
                            }
                        }
                    %>
                </div>
            </div>
            <%@include file="footer.jsp" %>
        </div>
    </body>
</html>
<%
    if (session.getAttribute("errOrderMsg") != null) {
        session.removeAttribute("errOrderMsg");
    }
    if (session.getAttribute("errOrderType") != null) {
        session.removeAttribute("errOrderType");
    }


    out.print("<script>");
    out.print("scrollTo();");
    out.print("</script>");
%>