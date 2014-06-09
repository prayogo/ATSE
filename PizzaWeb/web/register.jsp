<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Register - Grazzie Pizza</title>
        <link href="css/main.css" rel="stylesheet">
        <script src="js/main.js"></script>
    </head>
    <body>
        <div class="wrapper">
            <%@include file="header.jsp" %>
            <div class="container-fluid">
                <h1 class="page-header nav-menu-red" style="font-size:20px; text-align:center">Customer Register</h1>
                <%
                    String _msg = "";
                    String _username = "", _name = "", _address = "", _email = "", _phone = "";
                    if (session.getAttribute("errRegisterMsg") != null) {
                        if (session.getAttribute("errRegisterMsg") != null) {
                            _msg = session.getAttribute("errRegisterMsg").toString();
                        }
                        if (session.getAttribute("_username") != null) {
                            _username = session.getAttribute("_username").toString();
                            session.removeAttribute("_username");
                        }
                        if (session.getAttribute("_name") != null) {
                            _name = session.getAttribute("_name").toString();
                            session.removeAttribute("_username");
                        }
                        if (session.getAttribute("_address") != null) {
                            _address = session.getAttribute("_address").toString();
                            session.removeAttribute("_username");
                        }
                        if (session.getAttribute("_email") != null) {
                            _email = session.getAttribute("_email").toString();
                            session.removeAttribute("_username");
                        }
                        if (session.getAttribute("_phone") != null) {
                            _phone = session.getAttribute("_phone").toString();
                            session.removeAttribute("_username");
                        }
                        session.removeAttribute("errRegisterMsg");
                    }

                    if (!_msg.equals("")) {
                %>
                <div class="alert fail" name="alert"> <span style="width:97.5%; display:inline-block"><b><%= _msg%></b></span>
                    <button type="button" class="close" id="btnClose" onClick="hideAlert()">×</button>
                </div>
                <% }%>

                <div style="padding:20px">
                    <form class="form-horizontal" role="form" action="DoRegister" method="POST">
                        <div style="margin-bottom:15px;">
                            <label for="txtUsername" class="nav-menu-red" style="display:inline-block; width:20%">Username</label>
                            <div style="display:inline-block; width:60%">
                                <input type="text" class="control" id="txtUsername" name="txtUsername" value="<%=_username%>">
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
                        <div style="margin-bottom:10px;">
                            <div style="margin-left:20%">
                                <button type="submit" class="button-red" id="btnRegister" name="btnRegister">Register</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <%@include file="footer.jsp" %>
        </div>
    </body>
</html>
