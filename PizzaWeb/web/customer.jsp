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
  <h1 class="page-header nav-menu-red" style="font-size:20px; text-align:center">Customer List</h1>
  <div style="padding:20px">
    <div style="margin-bottom:20px;">
      <form>
        <div style="display:inline-block">
          <input type="text" class="control" placeholder="Find User" style="width:200px">
        </div>
        <button type="submit" class="button-red" style="margin:0; margin-bottom:2px"><span class="glyphicon glyphicon-search"></span> Search</button>
        <label style="font-style:italic; color:#999999">About 2,820,000 results</label>
      </form>
    </div>
    <div>
      <div class="box">
        <div style="margin-bottom:10px; color:#9E100B !important;">
          <div style="height:25px;">
            <div style="display:inline-block; width:12%;"> <b>Username</b> </div>
            <div style="display:inline;overflow:hidden !important;margin-right:20px;"> <span style="width:32%; display:inline-block">charl14 </span></div>
            <div style="display:inline-block; width:12%"> <b>Name</b> </div>
            <div style="display:inline;overflow:hidden !important;"> <span style="width:40%; display:inline-block">Charles</span></div>
          </div>
          <div style="height:25px">
            <div style="display:inline-block; width:12%"> <b>Email</b> </div>
            <div style="display:inline; overflow:hidden !important; margin-right:20px"> <span style="width:32%; display:inline-block">charles@mail.com </span></div>
            <div style="display:inline-block; width:12%"> <b>Phone</b> </div>
            <div style="display:inline;overflow:hidden !important;"> <span style="width:40%; display:inline-block">08113245885 </span></div>
          </div>
          <div>
            <div style="display:inline-block; width:12%"> <b>Address</b> </div>
            <div style="display:inline; overflow:hidden !important; margin-right:20px"> <span style="width:32%; display:inline-block">Jakarta </span></div>
          </div>
        </div>
        <div style="margin-bottom:10px; text-align:center"> <a href="#" class="button-red"> <span class="glyphicon glyphicon-pencil"></span> Update</a> <a class="button-red"><span class="glyphicon glyphicon-trash"></span> Delete</a> </div>
      </div>
      <div class="box">
        <div style="margin-bottom:10px; color:#9E100B !important;">
          <div style="height:25px;">
            <div style="display:inline-block; width:12%;"> <b>Username</b> </div>
            <div style="display:inline;overflow:hidden !important;margin-right:20px;"> <span style="width:32%; display:inline-block">charl14 </span></div>
            <div style="display:inline-block; width:12%"> <b>Name</b> </div>
            <div style="display:inline;overflow:hidden !important;"> <span style="width:40%; display:inline-block">Charles</span></div>
          </div>
          <div style="height:25px">
            <div style="display:inline-block; width:12%"> <b>Email</b> </div>
            <div style="display:inline; overflow:hidden !important; margin-right:20px"> <span style="width:32%; display:inline-block">charles@mail.com </span></div>
            <div style="display:inline-block; width:12%"> <b>Phone</b> </div>
            <div style="display:inline;overflow:hidden !important;"> <span style="width:40%; display:inline-block">08113245885 </span></div>
          </div>
          <div>
            <div style="display:inline-block; width:12%"> <b>Address</b> </div>
            <div style="display:inline; overflow:hidden !important; margin-right:20px"> <span style="width:32%; display:inline-block">Jakarta </span></div>
          </div>
        </div>
        <div style="margin-bottom:10px; text-align:center"> <a href="#" class="button-red"> <span class="glyphicon glyphicon-pencil"></span> Update</a> <a class="button-red"><span class="glyphicon glyphicon-trash"></span> Delete</a> </div>
      </div>
      <div class="box">
        <div style="margin-bottom:10px; color:#9E100B !important;">
          <div style="height:25px;">
            <div style="display:inline-block; width:12%;"> <b>Username</b> </div>
            <div style="display:inline;overflow:hidden !important;margin-right:20px;"> <span style="width:32%; display:inline-block">charl14 </span></div>
            <div style="display:inline-block; width:12%"> <b>Name</b> </div>
            <div style="display:inline;overflow:hidden !important;"> <span style="width:40%; display:inline-block">Charles</span></div>
          </div>
          <div style="height:25px">
            <div style="display:inline-block; width:12%"> <b>Email</b> </div>
            <div style="display:inline; overflow:hidden !important; margin-right:20px"> <span style="width:32%; display:inline-block">charles@mail.com </span></div>
            <div style="display:inline-block; width:12%"> <b>Phone</b> </div>
            <div style="display:inline;overflow:hidden !important;"> <span style="width:40%; display:inline-block">08113245885 </span></div>
          </div>
          <div>
            <div style="display:inline-block; width:12%"> <b>Address</b> </div>
            <div style="display:inline; overflow:hidden !important; margin-right:20px"> <span style="width:32%; display:inline-block">Jakarta </span></div>
          </div>
        </div>
        <div style="margin-bottom:10px; text-align:center"> <a href="#" class="button-red"> <span class="glyphicon glyphicon-pencil"></span> Update</a> <a class="button-red"><span class="glyphicon glyphicon-trash"></span> Delete</a> </div>
      </div>
      <div class="box">
        <div style="margin-bottom:10px; color:#9E100B !important;">
          <div style="height:25px;">
            <div style="display:inline-block; width:12%;"> <b>Username</b> </div>
            <div style="display:inline;overflow:hidden !important;margin-right:20px;"> <span style="width:32%; display:inline-block">charl14 </span></div>
            <div style="display:inline-block; width:12%"> <b>Name</b> </div>
            <div style="display:inline;overflow:hidden !important;"> <span style="width:40%; display:inline-block">Charles</span></div>
          </div>
          <div style="height:25px">
            <div style="display:inline-block; width:12%"> <b>Email</b> </div>
            <div style="display:inline; overflow:hidden !important; margin-right:20px"> <span style="width:32%; display:inline-block">charles@mail.com </span></div>
            <div style="display:inline-block; width:12%"> <b>Phone</b> </div>
            <div style="display:inline;overflow:hidden !important;"> <span style="width:40%; display:inline-block">08113245885 </span></div>
          </div>
          <div>
            <div style="display:inline-block; width:12%"> <b>Address</b> </div>
            <div style="display:inline; overflow:hidden !important; margin-right:20px"> <span style="width:32%; display:inline-block">Jakarta </span></div>
          </div>
        </div>
        <div style="margin-bottom:10px; text-align:center"> <a href="#" class="button-red"> <span class="glyphicon glyphicon-pencil"></span> Update</a> <a class="button-red"><span class="glyphicon glyphicon-trash"></span> Delete</a> </div>
      </div>
    </div>
  </div>
  <%@include file="footer.jsp" %>
</div>
</body>
</html>
