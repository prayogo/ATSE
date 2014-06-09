<%@page import="bean.Role"%>
<%@page import="controller.Adapter"%>
<%@page import="controller.Adapter"%>
<%
    Adapter _adapCek = new Adapter();
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
    } else if (request.getParameter("uid") == null) {
        response.sendRedirect("pagenotfound.jsp");
    } else if (_adapCek.getUser("userid", request.getParameter("uid").toString()) == null) {
        response.sendRedirect("pagenotfound.jsp");
    } else {
%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Update Customer - Grazzie Pizza</title>
        <link href="css/main.css" rel="stylesheet">
        <script src="js/main.js"></script>
    </head>
    <body>
        <div class="wrapper">
            <%@include file="header.jsp" %>
            <div class="container-fluid">
                <h1 class="page-header nav-menu-red" style="font-size:20px; text-align:center">Update Customer Data</h1>
                <%
                    String _msg = "";
                    String _username = "", _name = "", _address = "", _email = "", _phone = "", _role = "";
                    String _uid = request.getParameter("uid").toString();
                    _username = new Adapter().getUser("userid", _uid).getUsername();
                    if (session.getAttribute("errCustomerMsg") != null) {
                        if (session.getAttribute("errCustomerMsg") != null) {
                            _msg = session.getAttribute("errCustomerMsg").toString();
                        }
                        if (session.getAttribute("_name") != null) {
                            _name = session.getAttribute("_name").toString();
                            session.removeAttribute("_name");
                        }
                        if (session.getAttribute("_address") != null) {
                            _address = session.getAttribute("_address").toString();
                            session.removeAttribute("_address");
                        }
                        if (session.getAttribute("_email") != null) {
                            _email = session.getAttribute("_email").toString();
                            session.removeAttribute("_email");
                        }
                        if (session.getAttribute("_phone") != null) {
                            _phone = session.getAttribute("_phone").toString();
                            session.removeAttribute("_phone");
                        }
                        if (session.getAttribute("_role") != null) {
                            _role = session.getAttribute("_role").toString();
                            session.removeAttribute("_role");
                        }
                        session.removeAttribute("errCustomerMsg");
                    } else {
                        Adapter _adap = new Adapter();
                        User _user = _adap.getUser("userid", _uid);
                        if (_user != null) {
                            _username = _user.getUsername();
                            _name = _user.getName();
                            _address = _user.getAddress();
                            _email = _user.getEmail();
                            _phone = _user.getPhone();
                            _role = Integer.toString(_user.getRole().getRoleid());
                        }
                    }

                    if (!_msg.equals("")) {
                %>
                <div class="alert fail" name="alert"> <span style="width:97.5%; display:inline-block"><b><%= _msg%></b></span>
                    <button type="button" class="close" id="btnClose" onClick="hideAlert()">×</button>
                </div>
                <% }%>

                <%
                    if (!_uid.equals("")) {
                %>
                <div style="padding:20px;">
                    <form class="form-horizontal" role="form" action="DoUpdateCustomer" method="POST">
                        <input type="hidden" name="userid" value ="<%=_uid%>"/>
                        <input type="hidden" name="username" value ="<%=_username%>"/>
                        <div style="margin-bottom:15px;">
                            <label for="txtUsername" class="nav-menu-red" style="display:inline-block; width:20%">Username</label>
                            <div style="display:inline-block; width:60%">
                                <input type="text" class="control" id="txtUsername" name="txtUsername" value="<%=_username%>" disabled>
                            </div>
                        </div>
                        <div style="margin-bottom:15px;">
                            <label for="txtPassword" class="nav-menu-red" style="display:inline-block; width:20%">Password</label>
                            <div style="display:inline-block; width:60%">
                                <input type="password" class="control" id="txtPassword" name="txtPassword">
                            </div>
                        </div>
                        <div style="margin-bottom:15px;">
                            <label for="txtConfirmPass" class="nav-menu-red" style="display:inline-block; width:20%">Confirm Password</label>
                            <div style="display:inline-block; width:60%">
                                <input type="password" class="control" id="txtConfirmPass" name="txtConfirmPass">
                            </div>
                        </div>
                        <div style="margin-bottom:15px;">
                            <label for="txtName" class="nav-menu-red" style="display:inline-block; width:20%">Name</label>
                            <div style="display:inline-block; width:60%;">
                                <input type="text" class="control" id="txtName" name="txtName" value="<%=_name%>">
                            </div>
                        </div>
                        <div style="margin-bottom:15px;">
                            <label for="txtAddress" class="nav-menu-red" style="display:inline-block; width:20%;">Address</label>
                            <div style="display:inline-block; width:60%; vertical-align:middle;">
                                <textarea class="control" style="resize:none; height:100px" id="txtAddress" name="txtAddress"><%=_address%></textarea>
                            </div>
                        </div>
                        <div style="margin-bottom:15px;">
                            <label for="txtEmail" class="nav-menu-red" style="display:inline-block; width:20%">Email</label>
                            <div style="display:inline-block; width:60%">
                                <input type="email" class="control" id="txtEmail" name="txtEmail" value="<%=_email%>">
                            </div>
                        </div>
                        <div style="margin-bottom:15px;">
                            <label for="txtPhone" class="nav-menu-red" style="display:inline-block; width:20%">Phone</label>
                            <div style="display:inline-block; width:60%">
                                <input type="text" class="control" id="txtPhone" name="txtPhone" value="<%=_phone%>">
                            </div>
                        </div>
                        <div style="margin-bottom:15px;">
                            <label for="txtPhone" class="nav-menu-red" style="display:inline-block; width:20%">Role</label>
                            <div style="display:inline-block; width:60%">
                                <select class="select" style="width:100%" name="ddlRole" id="ddlRole">
                                    <%
                                        List _listRole;
                                        Adapter _adap1 = new Adapter();
                                        _listRole = _adap1.getListRole();

                                        for (int i = 0; i < _listRole.size(); i++) {
                                            Role _roleClass = (Role) _listRole.get(i);
                                    %>
                                    <option value="<%=_roleClass.getRoleid()%>"><%=_roleClass.getRole()%></option>              
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
        out.print("<script>");
        out.print("document.getElementById('ddlRole').value = " + _role + ";");
        out.print("</script>");
    }
%>