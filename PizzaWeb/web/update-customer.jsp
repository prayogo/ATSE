<%@page import="bean.Role"%>
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
                session.setAttribute("gotoURL", "cart");
                response.sendRedirect("DoLogin");
            }
        }
        if (!remember) {
            response.sendRedirect("pagenotfound.jsp");
        }
    } else if (session.getAttribute("loginUser") != null) {
        int roleid = ((User) session.getAttribute("loginUser")).getRole().getRoleid();
        if (roleid != 1) {
            response.sendRedirect("pagenotfound.jsp");
        }
    } else {
%>
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
            <div class="container-fluid">
                <h1 class="page-header nav-menu-red" style="font-size:20px; text-align:center">Update Customer Data</h1>
                <%
                    String _errMsg = "000000000";
                    if (request.getParameter("errMsg") != null) {
                        _errMsg = request.getParameter("errMsg");
                    }
                    String _msg = "";
                    if (_errMsg.length() == 9) {
                        if (_errMsg.charAt(0) == '1') {
                            _msg = "Username must be filled <br>";
                        }
                        if (_errMsg.charAt(1) == '1') {
                            _msg += "Password must alphanumeric and more than 6 character <br>";
                        }
                        if (_errMsg.charAt(2) == '1') {
                            _msg += "Confirm Password must same as password <br>";
                        }
                        if (_errMsg.charAt(3) == '1') {
                            _msg += "Name must be alphabet <br>";
                        }
                        if (_errMsg.charAt(4) == '1') {
                            _msg += "Address must be filled <br>";
                        }
                        if (_errMsg.charAt(5) == '1') {
                            _msg += "Email must be in valid format. ex:admin@example.com <br>";
                        }
                        if (_errMsg.charAt(6) == '1') {
                            _msg += "Phone must be numeric<br>";
                        }
                        if (_errMsg.charAt(7) == '1') {
                            _msg += "Username already exists<br>";
                        }
                        if (_errMsg.charAt(8) == '1') {
                            _msg += "Email already exists<br>";
                        }
                    } else if (_errMsg.equals("2")) {
                        _msg = "Save Failed";
                    }

                    if (!_msg.equals("")) {
                %>
                <div class="alert fail" name="alert"> <span style="width:97.5%; display:inline-block"><b><%= _msg%></b></span>
                    <button type="button" class="close" id="btnClose">×</button>
                </div>
                <% }%>

                <%
                    Adapter _adap = new Adapter();
                    String _userid = request.getParameter("userid").toString();
                    User _user = _adap.getUser("userid", _userid);

                    if (_user != null) {
                %>
                <div style="padding:20px;">
                    <form class="form-horizontal" role="form" action="DoUpdateCustomer" method="POST">
                        <input type="hidden" name="userid" value ="<%=_user.getUserid()%>"/>
                        <input type="hidden" name="username" value ="<%=_user.getUsername()%>"/>
                        <div style="margin-bottom:15px;">
                            <label for="txtUsername" class="nav-menu-red" style="display:inline-block; width:20%">Username</label>
                            <div style="display:inline-block; width:60%">
                                <input type="text" class="control" id="txtUsername" name="txtUsername" value="<%=_user.getUsername()%>" disable>
                            </div>
                        </div>
                        <div style="margin-bottom:15px;">
                            <label for="txtPassword" class="nav-menu-red" style="display:inline-block; width:20%">Password</label>
                            <div style="display:inline-block; width:60%">
                                <input type="password" class="control" id="txtPassword" name="txtPassword" value="<%=_user.getPassword()%>" >
                            </div>
                        </div>
                        <div style="margin-bottom:15px;">
                            <label for="txtConfirmPass" class="nav-menu-red" style="display:inline-block; width:20%">Confirm Password</label>
                            <div style="display:inline-block; width:60%">
                                <input type="password" class="control" id="txtConfirmPass" name="txtConfirmPass" value="<%=_user.getPassword()%>">
                            </div>
                        </div>
                        <div style="margin-bottom:15px;">
                            <label for="txtName" class="nav-menu-red" style="display:inline-block; width:20%">Name</label>
                            <div style="display:inline-block; width:60%;">
                                <input type="text" class="control" id="txtName" name="txtName" value="<%=_user.getName()%>">
                            </div>
                        </div>
                        <div style="margin-bottom:15px;">
                            <label for="txtAddress" class="nav-menu-red" style="display:inline-block; width:20%;">Address</label>
                            <div style="display:inline-block; width:60%; vertical-align:middle;">
                                <textarea class="control" style="resize:none; height:100px" id="txtAddress" name="txtAddress"><%=_user.getAddress()%></textarea>
                            </div>
                        </div>
                        <div style="margin-bottom:15px;">
                            <label for="txtEmail" class="nav-menu-red" style="display:inline-block; width:20%">Email</label>
                            <div style="display:inline-block; width:60%">
                                <input type="email" class="control" id="txtEmail" name="txtEmail" value="<%=_user.getEmail()%>">
                            </div>
                        </div>
                        <div style="margin-bottom:15px;">
                            <label for="txtPhone" class="nav-menu-red" style="display:inline-block; width:20%">Phone</label>
                            <div style="display:inline-block; width:60%">
                                <input type="text" class="control" id="txtPhone" name="txtPhone" value="<%=_user.getPhone()%>">
                            </div>
                        </div>
                        <div style="margin-bottom:15px;">
                            <label for="txtPhone" class="nav-menu-red" style="display:inline-block; width:20%">Role</label>
                            <div style="display:inline-block; width:60%">
                                <select class="select" style="width:100%" name="ddlRole">
                                    <%
                                        List _listRole;
                                        _adap = new Adapter();
                                        _listRole = _adap.getListRole();

                                        for (int i = 0; i < _listRole.size(); i++) {
                                            Role _roleClass = (Role) _listRole.get(i);
                                            String select = "";
                                            if (_user.getRole().getRoleid() == _roleClass.getRoleid()) {
                                                select = "selected";
                                            }
                                    %>

                                    <option value="<%=_roleClass.getRoleid()%>" <%=select%>><%=_roleClass.getRole()%></option>              
                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                        </div>
                        <div>
                            <div style="margin-left:20%">
                                <button type="submit" class="button-red"><span class="glyphicon glyphicon-floppy-disk"></span> Update</button>
                            </div>
                        </div>
                    </form>
                </div>
                <%}%>
            </div>
            <%@include file="footer.jsp" %>
        </div>
    </body>
</html>
<%
    }
%>