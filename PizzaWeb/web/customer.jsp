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
                session.setAttribute("gotoURL", "customer");
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
        <title>Manage Customer - Grazzie Pizza</title>
        <link href="css/main.css" rel="stylesheet">
        <script src="js/main.js"></script>
    </head>
    <body>
        <div class="wrapper">
            <%@include file="header.jsp" %>  
            <%
                Adapter _adap = new Adapter();
                String _userSearch = "";
                List _listUser;

                if (session.getAttribute("searchUser") != null) {
                    _userSearch = session.getAttribute("searchUser").toString();
                }

                _listUser = _adap.getListUser(_userSearch);
            %>
            <h1 class="page-header nav-menu-red" style="font-size:20px; text-align:center">Customer List</h1>
            <%
                String msg = "";
                String type = "fail";

                if (session.getAttribute("errCustomerMsg") != null && session.getAttribute("errCustomerType") != null) {
                    msg = session.getAttribute("errCustomerMsg").toString();
                    type = session.getAttribute("errCustomerType").toString();
                }

                if (!msg.equals("")) {
            %>
            <div class="alert <%= type%>" name="alert"> <b><%= msg%></b>
                <button type="button" class="close" onClick="hideAlert()">×</button>
            </div>
            <% }%>

            <div style="padding:20px">
                <div style="margin-bottom:20px;">
                    <form action="DoSearchUser" method="POST">
                        <div style="display:inline-block">
                            <input value="<%=_userSearch%>" type="text" class="control" placeholder="Find User" style="width:200px" name="userSearch">
                        </div>
                        <button type="submit" class="button-red" style="margin:0; margin-bottom:2px"><span class="glyphicon glyphicon-search"></span> Search</button>
                        <label style="font-style:italic; color:#999999">About <%=_listUser.size()%> result(s)</label>
                    </form>
                </div>
                <%
                    for (int i = 0; i < _listUser.size(); i++) {
                        User _user = (User) _listUser.get(i);

                %>
                <div>
                    <div class="box">
                        <div style="margin-bottom:10px; color:#9E100B !important;">
                            <div style="height:25px;">
                                <div style="display:inline-block; width:12%;"> <b>Username</b> </div>
                                <div style="display:inline;overflow:hidden !important;margin-right:20px;"> <span style="width:32%; display:inline-block"><%=_user.getUsername()%></span></div>
                                <div style="display:inline-block; width:12%"> <b>Name</b> </div>
                                <div style="display:inline;overflow:hidden !important;"> <span style="width:40%; display:inline-block"><%=_user.getName()%></span></div>
                            </div>
                            <div style="height:25px">
                                <div style="display:inline-block; width:12%"> <b>Email</b> </div>
                                <div style="display:inline; overflow:hidden !important; margin-right:20px"> <span style="width:32%; display:inline-block"><%=_user.getEmail()%></span></div>
                                <div style="display:inline-block; width:12%"> <b>Phone</b> </div>
                                <div style="display:inline;overflow:hidden !important;"> <span style="width:40%; display:inline-block"><%=_user.getPhone()%></span></div>
                            </div>
                            <div>
                                <div style="display:inline-block; width:12%"> <b>Address</b> </div>
                                <div style="display:inline; overflow:hidden !important; margin-right:20px"> <span style="width:32%; display:inline-block">Jakarta </span></div>
                            </div>
                        </div>
                        <div style="margin-bottom:10px; text-align:center"> 
                            <a href="update-customer.jsp?uid=<%=_user.getUserid()%>" class="button-red"> <span class="glyphicon glyphicon-pencil"></span> Update</a> 
                            <form action="DoDeleteCustomer" method="POST" style="width: auto; display:inline-block" onsubmit="return confirm('Are you sure want to delete this record?');">
                                <input type="hidden" name="hdnUID" id="hdnUID" value="<%=_user.getUserid()%>">
                                <button type="submit" class="button-red"><span class="glyphicon glyphicon-trash"></span> Delete</button> 
                            </form>
                        </div>
                    </div>      
                    <%
                        }
                    %>
                </div>
            </div>
            <%@include file="footer.jsp" %>
        </div>
    </body>
</html>
<%
        if (session.getAttribute("errCustomerMsg") != null) {
            session.removeAttribute("errCustomerMsg");
        }
        if (session.getAttribute("errCustomerType") != null) {
            session.removeAttribute("errCustomerType");
        }
    }
%>