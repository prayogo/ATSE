<%@page import="bean.TransactionDetail"%>
<%@page import="bean.TransactionHeader"%>
<%@page import="controller.Adapter"%>
<%
    if (session.getAttribute("loginUser") == null) {
        boolean remember = false;
        Cookie[] cookies = request.getCookies();
        for (int i = 0; i < cookies.length; i++) {
            Cookie c = cookies[i];
            if (c.getName().equals("USPizzaWeb") || c.getName().equals("PWPizzaWeb")) {
                remember = true;
                session.setAttribute("gotoURL", "track");
            }
        }
        if (!remember) {
            response.sendRedirect("pagenotfound.jsp");
        }
    }
%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Track - Grazzie Pizza</title>
        <link href="css/main.css" rel="stylesheet">
        <script src="js/main.js"></script>
    </head>
    <body>
        <div class="wrapper">
            <%@include file="header.jsp" %>
            <div>
                <h1 class="page-header nav-menu-red" style="font-size:20px; text-align:center">My Order</h1>
                <%
                    String msg = "";
                    String type = "fail";

                    if (session.getAttribute("errTrackMsg") != null && session.getAttribute("errTrackType") != null) {
                        msg = session.getAttribute("errTrackMsg").toString();
                        type = session.getAttribute("errTrackType").toString();
                    }

                    if (!msg.equals("")) {
                %>
                <div class="alert <%= type%>" name="alert"> <b><%= msg%></b>
                    <button type="button" class="close" onClick="hideAlert()">×</button>
                </div>
                <% }%>
                <div style="padding:10px 20px">
                    <%
                        DecimalFormat formatter = new DecimalFormat("#,###.00");

                        if (session.getAttribute("loginUser") != null) {
                            int _userId = ((User) session.getAttribute("loginUser")).getUserid();
                            Adapter _adapList = new Adapter();
                            List _listTransactionHeader = _adapList.getTransactionHeader(_userId);
                            TransactionHeader _header;
                            if (_listTransactionHeader.size() > 0) {
                                for (int i = 0; i < _listTransactionHeader.size(); i++) {
                                    _header = (TransactionHeader) _listTransactionHeader.get(i);
                    %>
                    <div class="box">
                        <div style="color:#9E100B !important;margin-bottom:5px;height:32px">
                            <div class="col-30" style="padding-top:6px;"> <b>Customer:</b> <%= _header.getUser().getName()%></div>
                            <div class="col-30" style="padding-top:6px;"> <b>Order Time:</b> <%= _header.getOrderdate()%></div>
                            <div class="col-20" style="padding-top:6px;"> <b>Status:</b> <%= _header.getStatus().getStatus()%></div>
                            <%
                                if (_header.getStatus().getStatusid() == 1) {
                            %>
                            <div style="display:inline-block; float:right"> 
                                <form method="POST">
                                    <button type="submit" class="button-red button-sm" style="margin-top:0"><span class="glyphicon glyphicon-remove"></span> Cancel Order</button> 
                                </form>
                            </div>
                            <%                                }
                            %>
                        </div>
                        <%
                            Set<TransactionDetail> _setTransactionDetail = _header.getDetails();
                            if (_setTransactionDetail.size() > 0) {
                        %>
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
                                <%
                                    int _total = 0;
                                    for (TransactionDetail _detail : _setTransactionDetail) {
                                        _total += _detail.getPrice() * _detail.getQty();
                                %>
                                <tr>
                                    <td><a href="#" class="nav-menu-red-normal link"><%= _detail.getProduct().getName()%></a></td>
                                    <td>Rp. <%= formatter.format(_detail.getPrice())%></td>
                                    <td align="center"><%= _detail.getQty()%> pc(s)</td>
                                    <td>Rp. <%= formatter.format(_detail.getPrice() * _detail.getQty())%></td>
                                </tr>
                                <%
                                    }
                                %>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td><b>Total Price</b></td>
                                    <td><b>Rp. <%= formatter.format(_total)%></b></td>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                    <%
                                    } else {
                                        out.print("<span style='background:white;text-align: center;display: block;font-size: 14px; width:100%' class='nav-menu-red'>You haven't ordered anything.</span>");
                                    }
                                }
                            } else {
                                out.print("<span style='background:white;text-align: center;display: block;font-size: 14px; width:100%' class='nav-menu-red'>You haven't ordered anything.</span>");
                            }
                        }
                    %>
                </div>
            </div>
            <%@include file="footer.jsp" %>
        </div>
    </body>
</html>
