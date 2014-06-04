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
    <h1 class="page-header nav-menu-red" style="font-size:20px; text-align:center">Customer Register</h1>
    <%
		String _errMsg = "0000000";
                if(request.getParameter("errMsg") != null){
                    _errMsg = request.getParameter("errMsg");
                }
		String _msg = "";
		if (_errMsg.charAt(0) == '1'){
			_msg = "Username must be filled <br>";
		}
                if(_errMsg.charAt(1) == '1'){
			_msg += "Password must alphanumeric and more than 6 character <br>";
		}
                if(_errMsg.charAt(2) == '1'){
			_msg += "Confirm Password must same as password <br>";
		}
                if(_errMsg.charAt(3) == '1'){
			_msg += "Name must be alphabet <br>";
		}
                if(_errMsg.charAt(4) == '1'){
			_msg += "Address must be filled <br>";
		}
                if(_errMsg.charAt(5) == '1'){
			_msg += "Email must be in valid format. ex:admin@example.com <br>";
		}
                if(_errMsg.charAt(6) == '1'){
			_msg += "Phone must be numeric<br>";
		}
		
		if (!_msg.equals("")){
	%>
    <div class="alert fail" name="alert"> <span style="width:97.5%; display:inline-block"><b><%= _msg %></b></span>
      <button type="button" class="close" id="btnClose" onClick="hideAlert()">×</button>
    </div>
    <% } %>
    <div style="padding:20px">
      <form class="form-horizontal" role="form" action="DoRegister">
        <div style="margin-bottom:15px;">
          <label for="txtUsername" class="nav-menu-red" style="display:inline-block; width:20%">Username</label>
          <div style="display:inline-block; width:60%">
            <input type="text" class="control" id="txtUsername" name="txtUsername">
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
            <input type="text" class="control" id="txtName" name="txtName">
          </div>
        </div>
        <div style="margin-bottom:15px;">
          <label for="txtAddress" class="nav-menu-red" style="display:inline-block; width:20%;">Address</label>
          <div style="display:inline-block; width:60%; vertical-align:middle;">
            <textarea class="control" style="resize:none; height:100px" id="txtAddress" name="txtAddress"></textarea>
          </div>
        </div>
        <div style="margin-bottom:15px;">
          <label for="txtEmail" class="nav-menu-red" style="display:inline-block; width:20%">Email</label>
          <div style="display:inline-block; width:60%">
            <input type="email" class="control" id="txtEmail" name="txtEmail">
          </div>
        </div>
        <div style="margin-bottom:15px;">
          <label for="txtPhone" class="nav-menu-red" style="display:inline-block; width:20%">Phone</label>
          <div style="display:inline-block; width:60%">
            <input type="text" class="control" id="txtPhone" name="txtPhone">
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
