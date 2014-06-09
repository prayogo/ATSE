<%@page import="bean.Product"%>
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
                session.setAttribute("gotoURL", "product");
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
<%
    int _currPage = 1;
    int _totalPage = 20;
    int _perPage = 6;
    int _totalProduct = 0;

    if (request.getParameter("p") != null) {
        try {
            _currPage = Integer.parseInt(request.getParameter("p").toString());
        } catch (Exception ex) {
            response.sendRedirect("product.jsp?p=1");
        }
    }
    Adapter _adap = new Adapter();
    List _listProduct;
    _listProduct = _adap.getProduct("", "0");

    _totalProduct = _listProduct.size();
    _totalPage = (int) Math.ceil(_totalProduct / (double) _perPage);

%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Manage Product - Grazzie Pizza</title>
        <link href="css/main.css" rel="stylesheet">
            <script src="js/main.js"></script>
    </head>
    <body>
        <div class="wrapper">
            <%
                DecimalFormat formatter = new DecimalFormat("#,##0.00");
            %>
            <%@include file="header.jsp" %>
            <div>
                <h1 class="page-header nav-menu-red" style="font-size:20px; text-align:center">Manage Product</h1>
                <%
                    String msg = "";
                    String type = "fail";

                    if (session.getAttribute("errProductMsg") != null && session.getAttribute("errProductType") != null) {
                        msg = session.getAttribute("errProductMsg").toString();
                        type = session.getAttribute("errProductType").toString();
                    }

                    if (!msg.equals("")) {
                %>
                <div class="alert <%= type%>" name="alert"> <b><%= msg%></b>
                    <button type="button" class="close" onClick="hideAlert()">×</button>
                </div>
                <% }%>

                <div style="clear:both; padding:20px;display:block; padding-top:0px;border-bottom:1px solid #EEE; height:40px">
                    <div style="float:left;">
                        <label style="padding-top:6px;" class="nav-menu-red"><%=_totalProduct%> product listed</label>
                    </div>
                    <div style="float:right; margin-top:-10px">
                        <a class="button-red" href="./GetProductReport"><span class="glyphicon glyphicon-eye-open"></span> View Product Report</a>
                        <a href="manage-product.jsp" class="button-red"><span class="glyphicon glyphicon-plus"></span> Add Product</a> </div>
                </div>
                <div style="padding:20px">
                    <div class="row">
                        <%
                            int margin = 14;
                            for (int i = ((_currPage - 1) * _perPage); i < _listProduct.size() && i < (_perPage * _currPage); i++) {
                                Product _product = (Product) _listProduct.get(i);
                                if (i + 1 % 3 == 0) {
                                    margin = 0;
                                } else {
                                    margin = 14;
                                }
                        %>
                        <div class="col-31" style="margin-right:<%=margin%>px">
                            <div class="thumbnail"> 
                                <img src="img/meatlovers_540x540.jpg" alt="" />
                                <div class="caption"> 
                                    <span style="height:28px; display:block; overflow:hidden; font-size:20px; font-weight:700"> <%= _product.getName()%></span>
                                    <p style="margin:0"><i class="nav-menu-red-normal" style="font-size:12px;"> 
                                            Rp. <%= formatter.format(_product.getPrice())%></i></p>
                                    <p style="height:45px;overflow:hidden;font-size:11px; margin-top:4px;margin-bottom:4px;"><%= _product.getDescription()%></p>
                                    <form action="DoDeleteProduct" style="display: inline-block; text-align: center" onsubmit="return confirm('Are you sure want to delete this record?');">
                                        <a href="manage-product.jsp?id=<%= _product.getProductid()%>" class="button-red button-sm" style="width:auto"><span class="glyphicon glyphicon-pencil" style="width:auto; text-align:left;"></span> Update</a> 
                                        <input type="hidden" name="hdnProductId" id="hdnProductId" value="<%=_product.getProductid()%>"/>
                                        <button type="submit" class="button-red button-sm" style="width:auto"><span class="glyphicon glyphicon-trash" style="width:auto; text-align:left;"></span> Delete</button> 
                                    </form>

                                </div>
                            </div>
                        </div>
                        <%
                            }
                        %>
                    </div>
                </div>
                <div align="center">
                    <ul class="pagination">
                        <%
                            int _prev = _currPage - 1;
                            int _next = _currPage + 1;
                            int i = 0;

                            if (_totalPage > 1) {
                                if (_currPage == 1) {
                                    out.print("<li class='disabled'><a>«</a></li>");
                                } else {
                                    out.print("<li><a href='product.jsp?p=" + (_currPage - 1) + "'>«</a></li>");
                                }

                                if (_totalPage <= 10) {
                                    for (i = 1; i <= _totalPage; i++) {
                                        if (i == _currPage) {
                                            out.print("<li class='active'><a>" + i + "</a></li>");
                                        } else {
                                            out.print("<li><a href='product.jsp?p=" + i + "'>" + i + "</a></li>");
                                        }
                                    }
                                } else if (_totalPage > 10) {
                                    if (_currPage < 7) {
                                        for (i = 1; i <= 8; i++) {
                                            if (i == _currPage) {
                                                out.print("<li class='active'><a>" + i + "</a></li>");
                                            } else {
                                                out.print("<li><a href='product.jsp?p=" + i + "'>" + i + "</a></li>");
                                            }
                                        }
                                        out.print("<li><a>...</a></li>");
                                        out.print("<li><a href='product.jsp?p=" + _totalPage + "'>" + _totalPage + "</a></li>");
                                    } else if (_totalPage - 6 > _currPage && _currPage > 6) {
                                        out.print("<li><a href='product.jsp?p=1'>1</a></li>");
                                        out.print("<li><a>...</a></li>");

                                        for (i = _currPage - 2; i <= _currPage + 3; i++) {
                                            if (i == _currPage) {
                                                out.print("<li class='active'><a>" + i + "</a></li>");
                                            } else {
                                                out.print("<li><a href='product.jsp?p=" + i + "'>" + i + "</a></li>");
                                            }
                                        }
                                        out.print("<li><a>...</a></li>");
                                        out.print("<li><a href='product.jsp?p=" + _totalPage + "'>" + _totalPage + "</a></li>");
                                    } else {
                                        out.print("<li><a href='product.jsp?p=1'>1</a></li>");
                                        out.print("<li><a>...</a></li>");

                                        for (i = _totalPage - 7; i <= _totalPage; i++) {
                                            if (i == _currPage) {
                                                out.print("<li class='active'><a>" + i + "</a></li>");
                                            } else {
                                                out.print("<li><a href='product.jsp?p=" + i + "'>" + i + "</a></li>");
                                            }
                                        }
                                    }
                                }

                                if (_currPage == _totalPage) {
                                    out.print("<li class='disabled'><a>»</a></li>");
                                } else {
                                    out.print("<li><a href='product.jsp?p=" + (_currPage + 1) + "'>»</a></li>");
                                }
                            }
                        %>
                    </ul>
                </div>
            </div>
            <%@include file="footer.jsp" %>
        </div>
    </body>
</html>
<%
        if (session.getAttribute("errProductMsg") != null) {
            session.removeAttribute("errProductMsg");
        }
        if (session.getAttribute("errProductType") != null) {
            session.removeAttribute("errProductType");
        }
    }
%>