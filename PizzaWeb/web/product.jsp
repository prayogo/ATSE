<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%
	int _currPage = 1;
	int _totalPage = 20;

	if (request.getParameter("p") != null){
		try{
			_currPage = Integer.parseInt(request.getParameter("p").toString());
		}
		catch(Exception ex){
			response.sendRedirect("product.jsp?p=1");
		}
	}
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<link href="css/main.css" rel="stylesheet">
<script src="js/main.js"></script>
</head>
<body>
<div class="wrapper">
  <%
	DecimalFormat formatter = new DecimalFormat("#,###.00");
  %>
  <%@include file="header.jsp" %>
  <div>
    <h1 class="page-header nav-menu-red" style="font-size:20px; text-align:center">Product</h1>
    <div style="clear:both; padding:20px;display:block; padding-top:0px;border-bottom:1px solid #EEE; height:40px">
      <div style="float:left;">
        <label style="padding-top:6px;" class="nav-menu-red">10 product listed</label>
      </div>
      <div style="float:right; margin-top:-10px">
        <button class="button-red"><span class="glyphicon glyphicon-eye-open"></span> View Product Report</button>
        <a href="manage-product.jsp" class="button-red"><span class="glyphicon glyphicon-plus"></span> Add Product</a> </div>
    </div>
    <div style="padding:20px">
      <div class="row">

        <div class="col-30" style="margin-right:20px">
          <div class="thumbnail"> <img src="img/meatlovers_540x540.jpg" alt="" >
            <div class="caption"> <span style="height:19px; overflow:hidden; font-size:20px; font-weight:700"> Meat Lovers <i class="nav-menu-red-normal" style="font-size:12px"> Rp. <%= formatter.format(58000)%></i></span>
              <p style="height:45px;overflow:hidden;font-size:11px; margin-top:4px;margin-bottom:4px;">Burger sapi, daging sapi cincang, sosis sapi dan ayam</p>
              <p style="text-align:center; height:35px; margin:0"> 
              <a href="manage-product.jsp?id=1" class="button-red button-sm" style="width:auto"><span class="glyphicon glyphicon-pencil" style="width:auto; text-align:left;"></span> Update</a> 
              <a class="button-red button-sm" style="width:auto"><span class="glyphicon glyphicon-trash" style="width:auto; text-align:left;"></span> Delete</a> </p>
            </div>
          </div>
        </div>
        
        <div class="col-30" style="margin-right:20px">
          <div class="thumbnail"> <img src="img/meatlovers_540x540.jpg" alt="" >
            <div class="caption"> <span style="height:19px; overflow:hidden; font-size:20px; font-weight:700"> Meat Lovers <i class="nav-menu-red-normal" style="font-size:12px"> Rp. <%= formatter.format(58000)%></i></span>
              <p style="height:45px;overflow:hidden;font-size:11px; margin-top:4px;margin-bottom:4px;">Burger sapi, daging sapi cincang, sosis sapi dan ayam</p>
              <p style="text-align:center; height:35px; margin:0"> 
              <a href="manage-product.jsp?id=1" class="button-red button-sm" style="width:auto"><span class="glyphicon glyphicon-pencil" style="width:auto; text-align:left;"></span> Update</a> 
              <a class="button-red button-sm" style="width:auto"><span class="glyphicon glyphicon-trash" style="width:auto; text-align:left;"></span> Delete</a> </p>
            </div>
          </div>
        </div>
        
        <div class="col-30" style="margin-right:20px">
          <div class="thumbnail"> <img src="img/meatlovers_540x540.jpg" alt="" >
            <div class="caption"> <span style="height:19px; overflow:hidden; font-size:20px; font-weight:700"> Meat Lovers <i class="nav-menu-red-normal" style="font-size:12px"> Rp. <%= formatter.format(58000)%></i></span>
              <p style="height:45px;overflow:hidden;font-size:11px; margin-top:4px;margin-bottom:4px;">Burger sapi, daging sapi cincang, sosis sapi dan ayam</p>
              <p style="text-align:center; height:35px; margin:0"> 
              <a href="manage-product.jsp?id=1" class="button-red button-sm" style="width:auto"><span class="glyphicon glyphicon-pencil" style="width:auto; text-align:left;"></span> Update</a> 
              <a class="button-red button-sm" style="width:auto"><span class="glyphicon glyphicon-trash" style="width:auto; text-align:left;"></span> Delete</a> </p>
            </div>
          </div>
        </div>
        
        <div class="col-30" style="margin-right:20px">
          <div class="thumbnail"> <img src="img/meatlovers_540x540.jpg" alt="" >
            <div class="caption"> <span style="height:19px; overflow:hidden; font-size:20px; font-weight:700"> Meat Lovers <i class="nav-menu-red-normal" style="font-size:12px"> Rp. <%= formatter.format(58000)%></i></span>
              <p style="height:45px;overflow:hidden;font-size:11px; margin-top:4px;margin-bottom:4px;">Burger sapi, daging sapi cincang, sosis sapi dan ayam</p>
              <p style="text-align:center; height:35px; margin:0"> 
              <a href="manage-product.jsp?id=1" class="button-red button-sm" style="width:auto"><span class="glyphicon glyphicon-pencil" style="width:auto; text-align:left;"></span> Update</a> 
              <a class="button-red button-sm" style="width:auto"><span class="glyphicon glyphicon-trash" style="width:auto; text-align:left;"></span> Delete</a> </p>
            </div>
          </div>
        </div>
        
        <div class="col-30" style="margin-right:20px">
          <div class="thumbnail"> <img src="img/meatlovers_540x540.jpg" alt="" >
            <div class="caption"> <span style="height:19px; overflow:hidden; font-size:20px; font-weight:700"> Meat Lovers <i class="nav-menu-red-normal" style="font-size:12px"> Rp. <%= formatter.format(58000)%></i></span>
              <p style="height:45px;overflow:hidden;font-size:11px; margin-top:4px;margin-bottom:4px;">Burger sapi, daging sapi cincang, sosis sapi dan ayam</p>
              <p style="text-align:center; height:35px; margin:0"> 
              <a href="manage-product.jsp?id=1" class="button-red button-sm" style="width:auto"><span class="glyphicon glyphicon-pencil" style="width:auto; text-align:left;"></span> Update</a> 
              <a class="button-red button-sm" style="width:auto"><span class="glyphicon glyphicon-trash" style="width:auto; text-align:left;"></span> Delete</a> </p>
            </div>
          </div>
        </div>
        
        <div class="col-30" style="margin-right:20px">
          <div class="thumbnail"> <img src="img/meatlovers_540x540.jpg" alt="" >
            <div class="caption"> <span style="height:19px; overflow:hidden; font-size:20px; font-weight:700"> Meat Lovers <i class="nav-menu-red-normal" style="font-size:12px"> Rp. <%= formatter.format(58000)%></i></span>
              <p style="height:45px;overflow:hidden;font-size:11px; margin-top:4px;margin-bottom:4px;">Burger sapi, daging sapi cincang, sosis sapi dan ayam</p>
              <p style="text-align:center; height:35px; margin:0"> 
              <a href="manage-product.jsp?id=1" class="button-red button-sm" style="width:auto"><span class="glyphicon glyphicon-pencil" style="width:auto; text-align:left;"></span> Update</a> 
              <a class="button-red button-sm" style="width:auto"><span class="glyphicon glyphicon-trash" style="width:auto; text-align:left;"></span> Delete</a> </p>
            </div>
          </div>
        </div>
        
      </div>
    </div>
    <div align="center">
      <ul class="pagination">
        <% 	
			int _prev = _currPage - 1;
			int _next = _currPage + 1;
			int i = 0;
			
			if (_totalPage > 1){
				if (_currPage == 1)
					out.print("<li class='disabled'><a>«</a></li>");
				else 
					out.print("<li><a href='product.jsp?p=" + (_currPage - 1) + "'>«</a></li>");

				if (_totalPage <= 10){	
					for (i = 1; i <= _totalPage; i++)
					{
						if (i == _currPage)
							out.print("<li class='active'><a>" + i + "</a></li>");
						else
							out.print("<li><a href='product.jsp?p=" + i + "'>" + i + "</a></li>");
					}
				}
				else if(_totalPage > 10 ){
					if(_currPage < 7){
						for (i = 1; i <= 8; i++)
						{
							if (i == _currPage)
								out.print("<li class='active'><a>" + i + "</a></li>");
							else
								out.print("<li><a href='product.jsp?p=" + i + "'>" + i + "</a></li>");
						}
						out.print("<li><a>...</a></li>");
						out.print("<li><a href='product.jsp?p=" + _totalPage + "'>" + _totalPage + "</a></li>");
					}
					else if(_totalPage - 6 > _currPage && _currPage > 6)
					{
						out.print("<li><a href='product.jsp?p=1'>1</a></li>");
						out.print("<li><a>...</a></li>");
		
						for (i = _currPage - 2; i <= _currPage + 3; i++)
						{
							if (i == _currPage)
								out.print("<li class='active'><a>" + i + "</a></li>");
							else
								out.print("<li><a href='product.jsp?p=" + i + "'>" + i + "</a></li>");		
						}
						out.print("<li><a>...</a></li>");
						out.print("<li><a href='product.jsp?p=" + _totalPage + "'>" + _totalPage + "</a></li>");
					}
					else
					{
						out.print("<li><a href='product.jsp?p=1'>1</a></li>");
						out.print("<li><a>...</a></li>");
						
						for (i = _totalPage - 7; i <= _totalPage; i++)
						{
							if (i == _currPage)
								out.print("<li class='active'><a>" + i + "</a></li>");
							else
								out.print("<li><a href='product.jsp?p=" + i + "'>" + i + "</a></li>");				
						}
					}
				}
				
				if (_currPage == _totalPage)
					out.print("<li class='disabled'><a>»</a></li>");
				else 
					out.print("<li><a href='product.jsp?p=" + (_currPage + 1) + "'>»</a></li>");	
			}
	   %>
      </ul>
    </div>
  </div>
  <%@include file="footer.jsp" %>
</div>
</body>
</html>
