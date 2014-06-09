<%@page import="bean.Cart"%>
<%@page import="controller.Adapter"%>
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
                session.setAttribute("gotoURL", "cart");
                response.sendRedirect("DoLogin");
            }
        }
        if (!remember) {
            response.sendRedirect("pagenotfound.jsp");
        }
    } else {
%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Cart - Grazzie Pizza</title>
        <link href="css/main.css" rel="stylesheet">
        <script src="js/main.js"></script>
    </head>
    <body>
        <div class="wrapper">
            <%@include file="header.jsp" %>
            <div style="width:100%">
                <h1 class="page-header nav-menu-red" style="font-size:20px; text-align:center">Your Cart</h1>
                <%
                    String msg = "";
                    String type = "fail";

                    if (session.getAttribute("errCartMsg") != null && session.getAttribute("errCartType") != null) {
                        msg = session.getAttribute("errCartMsg").toString();
                        type = session.getAttribute("errCartType").toString();
                    }

                    if (!msg.equals("")) {
                %>
                <div class="alert <%= type%>" name="alert"> <b><%= msg%></b>
                    <button type="button" class="close" onClick="hideAlert()">×</button>
                </div>
                <% }%>

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
                            <%
                                if (session.getAttribute("loginUser") != null) {
                                    int _userId = ((User) session.getAttribute("loginUser")).getUserid();
                                    Adapter _adapList = new Adapter();
                                    List _listCart = _adapList.getCartList(_userId);
                                    Cart _cart = new Cart();
                                    if (_listCart.size() > 0) {
                                        int _total = 0;
                                        for (int i = 0; i < _listCart.size(); i++) {
                                            _cart = (Cart) _listCart.get(i);
                                            _total += _cart.getProduct().getPrice() * _cart.getQty();

                            %>
                            <tr>
                                <td><a href="#" class="nav-menu-red-normal link"><%= _cart.getProduct().getName()%></a></td>
                                <td>Rp. <%= formatter.format(_cart.getProduct().getPrice())%></td>
                                <td align="center"><%= _cart.getQty()%> pc(s)</td>
                                <td>Rp. <%= formatter.format(_cart.getProduct().getPrice() * _cart.getQty())%></td>
                                <td>
                                    <form method="POST" action="DoDeleteCart">
                                        <input type="hidden" name="hdnProduct" id="hdnProduct" value="<%= _cart.getProduct().getProductid()%>">
                                        <button type="submit" class="button-red button-sm" style="margin:0"><span class="glyphicon glyphicon-trash"></span> Delete Item</button>
                                    </form>
                                </td>
                            </tr>
                            <% }
                            %>
                        </tbody>
                        <tfoot>
                            <tr>
                                <td align="right">
                                    <form method="POST" action="DoDeleteCart" style="display:inline-block;width:auto;" onsubmit="return confirm('Are you sure you want to delete all the orders?');">
                                        <input type="hidden" name="hdnProduct" id="hdnProduct" value="0">
                                        <button type="submit" class="button-red button-sm" style="margin:0"><span class="glyphicon glyphicon-trash"></span> Delete All</button> 
                                    </form>
                                    <form method="POST" action="DoConfirmCart" style="display:inline-block;width:auto;" onsubmit="return confirm('Confirm with all of your orders?');">
                                        <button type="submit" class="button-red button-sm" style="margin:0"><span class="glyphicon glyphicon-ok"></span> Confirm Order</button>
                                    </form>
                                </td>
                                <td><b>Total Price</b></td>
                                <td></td>
                                <td><b>Rp. <%= formatter.format(_total)%></b></td>
                                <td></td>
                            </tr>
                        </tfoot>
                        <%
                                } else {
                                    out.print("<tr style='height:50px;'><td colspan='5' style='background:white;text-align: center;font-size: 14px;' class='nav-menu-red'>You don't have any item in your cart.</td></tr>");
                                }
                            } else {
                                out.print("<span class=''>You don't have any item in your cart.</span>");
                            }
                        %>
                    </table>
                </div>
            </div>
            <%@include file="footer.jsp" %>
        </div>
    </body>
</html>
<%
        if (session.getAttribute("errCartMsg") != null) {
            session.removeAttribute("errCartMsg");
        }
        if (session.getAttribute("errCartType") != null) {
            session.removeAttribute("errCartType");
        }
    }
%>