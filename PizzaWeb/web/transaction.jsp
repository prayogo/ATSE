<%@page import="bean.TransactionDetail"%>
<%@page import="bean.Status"%>
<%@page import="bean.TransactionHeader"%>
<%@page import="controller.Adapter"%>
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
                session.setAttribute("gotoURL", "transaction");
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
        <title>Manage Transaction - Grazzie Pizza</title>
        <link href="css/main.css" rel="stylesheet">
        <script src="js/main.js"></script>
    </head>
    <body>
        <div class="wrapper">
            <%@include file="header.jsp" %>
            <div>
                <h1 class="page-header nav-menu-red" style="font-size:20px; text-align:center">Transaction List</h1>    
                <%
                    String msg = "";
                    String type = "fail";

                    if (session.getAttribute("errTransactionMsg") != null && session.getAttribute("errTransactionType") != null) {
                        msg = session.getAttribute("errTransactionMsg").toString();
                        type = session.getAttribute("errTransactionType").toString();
                    }

                    if (!msg.equals("")) {
                %>
                <div class="alert <%= type%>" name="alert"> <b><%= msg%></b>
                    <button type="button" class="close" onClick="hideAlert()">×</button>
                </div>
                <% }%>
                <div align="right" style="padding-right:20px;">
                    <a class="button-red" href="./GetTransactionReport"><span class="glyphicon glyphicon-eye-open"></span> View Transaction Report</a></div>
                <div style="padding:10px 20px">
                    <%
                        DecimalFormat formatter = new DecimalFormat("#,##0.00");

                        Adapter _adap = new Adapter();
                        List _listTransaction;
                        _listTransaction = _adap.getListTransaction();

                        for (int i = 0; i < _listTransaction.size(); i++) {
                            TransactionHeader _trHeader = (TransactionHeader) _listTransaction.get(i);
                            List _listDetail, _listStatus;
                            _listDetail = new ArrayList<TransactionDetail>(_trHeader.getDetails());
                            int _totalPrice = 0;

                    %>
                    <form action="DoUpdateStatus" method="POST">
                        <div class="box">
                            <div style="color:#9E100B !important;margin-bottom:15px;height:32px">
                                <input type="hidden" value="<%=_trHeader.getTransactionheaderid()%>" name="idHeader" />
                                <div class="col-30"> <b>Customer:</b> <%=_trHeader.getUser().getName()%></div>
                                <div class="col-30"> <b>Order Time:</b> <%=_trHeader.getOrderdate()%></div>
                                <div style="width:35%; display:inline-block"> <b>Status:</b> 
                                    <div style="display:inline-block; width:50%">
                                        <select class="select" style="width:100%" name="statusid">
                                            <%
                                                _adap = new Adapter();
                                                _listStatus = _adap.getListStatus();
                                                for (int j = 0; j < _listStatus.size(); j++) {
                                                    Status _status = (Status) _listStatus.get(j);
                                                    String selected = "";

                                                    if (_trHeader.getStatus().getStatusid() == _status.getStatusid()) {
                                                        selected = "selected";
                                                    }
                                            %>
                                            <option value="<%=_status.getStatusid()%>" <%=selected%>><%=_status.getStatus()%></option>
                                            <%}%>
                                        </select>
                                    </div>
                                    <button type="submit" class="button-red button-sm" style="margin-top:0; width:auto">Change</button>
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
                                    <%
                                        for (int k = 0; k < _listDetail.size(); k++) {
                                            TransactionDetail _trDetail = (TransactionDetail) _listDetail.get(k);
                                            int _subTotal = 0;
                                            _subTotal = _trDetail.getPrice() * _trDetail.getQty();
                                            _totalPrice += _subTotal;

                                    %>
                                    <tr>
                                        <td><a href="#" class="nav-menu-red-normal link"><%=_trDetail.getProduct().getName()%></a></td>
                                        <td>Rp. <%= formatter.format(_trDetail.getPrice())%></td>
                                        <td align="center"><%=_trDetail.getQty()%> pc(s)</td>
                                        <td>Rp. <%= formatter.format(_subTotal)%></td>
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
                                        <td><b>Rp. <%= formatter.format(_totalPrice)%></b></td>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                    </form>
                    <%}%>
                </div>
            </div>
            <%@include file="footer.jsp" %>
        </div>
    </body>
</html>
<%
        if (session.getAttribute("errTransactionMsg") != null) {
            session.removeAttribute("errTransactionMsg");
        }
        if (session.getAttribute("errTransactionType") != null) {
            session.removeAttribute("errTransactionType");
        }
    }
%>