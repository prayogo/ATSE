<%@page import="controller.Adapter"%>
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
    <% 
        if(session.getAttribute("loginUser") == null){
            response.sendRedirect("index.jsp");
            return;
        }
        int roleid = ((User)session.getAttribute("loginUser")).getRole().getRoleid();
        if(roleid != 1){
            response.sendRedirect("index.jsp");
            return;
        }   
    
        Adapter _adap = new Adapter();
        String _userSearch = "";
        List _listUser;
        
        if(session.getAttribute("userSearch") != null){
            _userSearch = session.getAttribute("userSearch").toString();
        }
        
        _listUser = _adap.getListUser(_userSearch);
                        
    %>
  <h1 class="page-header nav-menu-red" style="font-size:20px; text-align:center">Customer List</h1>
  <div style="padding:20px">
    <div style="margin-bottom:20px;">
      <form>
        <div style="display:inline-block">
          <input type="text" class="control" placeholder="Find User" style="width:200px" name="">
        </div>
        <button type="submit" class="button-red" style="margin:0; margin-bottom:2px"><span class="glyphicon glyphicon-search"></span> Search</button>
        <label style="font-style:italic; color:#999999">About <%=_listUser.size()%> result(s)</label>
      </form>
    </div>
      <%
        for(int i = 0; i < _listUser.size(); i++){
            User _user = (User)_listUser.get(i);
            
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
        <div style="margin-bottom:10px; text-align:center"> <a href="update-customer.jsp?userid=<%=_user.getUserid()%>" class="button-red"> <span class="glyphicon glyphicon-pencil"></span> Update</a> <a class="button-red" href="./DoDeleteCustomer?userid=<%=_user.getUserid()%>"><span class="glyphicon glyphicon-trash"></span> Delete</a> </div>
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
