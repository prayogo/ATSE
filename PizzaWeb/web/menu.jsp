<%@page import="bean.Product"%>
<%@page import="bean.PriceRange"%>
<%@page import="controller.Adapter"%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
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
                session.setAttribute("gotoURL", "index");
                response.sendRedirect("DoLogin");
            }
        }
    }

    int _currPage = 1;
    int _perPage = 6;
    int _totalPage = 1;
    int _totalProduct = 0;

    String _NameSearch = "";
    String _SearchPrice = "0";
    if (session.getAttribute("searchName") != null) {
        _NameSearch = session.getAttribute("searchName").toString();
    }
    if (session.getAttribute("searchPrice") != null) {
        _SearchPrice = session.getAttribute("searchPrice").toString();
    }

    Adapter _adap = new Adapter();
    List _list, _listProduct;
    _listProduct = _adap.getProduct(_NameSearch, _SearchPrice);
    _totalProduct = _listProduct.size();
    _totalPage = (int) Math.ceil(_totalProduct / (double) _perPage);

    if (request.getParameter("p") != null) {
        try {
            _currPage = Integer.parseInt(request.getParameter("p").toString());
        } catch (Exception ex) {
            response.sendRedirect("menu.jsp?p=1");
        }
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Menu - Grazie Pizza</title>
        <link href="css/main.css" rel="stylesheet">
        <script src="js/main.js"></script>
    </head>
    <body>
        <div class="wrapper">
            <%@include file="header.jsp" %>
            <%
                DecimalFormat formatter = new DecimalFormat("#,##0.00");
            %>
            <div>
                <h1 class="page-header nav-menu-red" style="font-size:20px; text-align:center">Menu</h1>
                <div style="margin-bottom:20px;border-bottom:1px solid #eee; padding:20px;padding-top:0">
                    <form method="POST" action="DoSearch">
                        <div style="display:inline-block">
                            <input type="text" class="control" placeholder="Find something" style="width:250px" id="txtName" name="txtName">
                        </div>
                        <div style="width:250px; display:inline-block; margin-left: 7px">
                            <select class="select" style="width: 100%" id="cmbPrice" name="cmbPrice">
                                <option value="0">All Prices</option>
                                <%
                                    _adap = new Adapter();
                                    _list = _adap.getPriceRange();
                                    PriceRange _range = new PriceRange();
                                    for (int i = 0; i < _list.size(); i++) {
                                        _range = (PriceRange) _list.get(i);
                                        out.print("<option value='" + _range.getPricerangeid() + "'>");
                                        if (_range.getPrice1() == 0) {
                                            out.print("Less than ");
                                        } else if (_range.getPrice2() == 0) {
                                            out.print("More than ");
                                        }
                                        if (_range.getPrice1() != 0) {
                                            out.print("Rp. " + formatter.format(_range.getPrice1()));
                                        }
                                        if (_range.getPrice1() != 0 && _range.getPrice2() != 0) {
                                            out.print(" - ");
                                        }
                                        if (_range.getPrice2() != 0) {
                                            out.print("Rp. " + formatter.format(_range.getPrice2()));
                                        }
                                        out.print("</option>");
                                    }
                                %>
                            </select>
                        </div>
                        <button type="submit" class="button-red" style="height:34px; margin-top:-3px; margin-bottom:0"> <span class="glyphicon glyphicon-search"></span> Search</button>
                        <%
                            if (_totalProduct > 0) {
                                out.print("<label style='font-weight:normal; color:#666'> <i>About " + _totalProduct + " results</i></label>");
                            } else {
                                out.print("<label style='font-weight:normal; color:#666'> <i>No results found</i></label>");
                            }
                        %>
                    </form>
                </div>
                <div style="padding:20px; padding-top:0px; padding-bottom: 0">
                    <div>
                        <div>

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
                                    <img src="img/meatlovers_540x540.jpg" alt="" >
                                    <div class="caption" name="caption">
                                        <span style="height:28px; display:block; overflow:hidden; font-size:20px; font-weight:700">
                                            <%= _product.getName()%></span>
                                        <p style="margin:0"><i class="nav-menu-red-normal" style="font-size:12px;"> 
                                                Rp. <%= formatter.format(_product.getPrice())%></i></p>
                                        <p style="height:45px;overflow:hidden;font-size:11px; margin-top:4px;margin-bottom:4px;"><%= _product.getDescription()%></p>
                                        <p style="text-align:right; height:35px; margin:0">
                                            <% if (role.equals("1") || role.equals("2")) {%>
                                            <a href="order.jsp?id=<%= _product.getProductid()%>" class="button-red button-sm" style="width:auto; text-align:left;">
                                                <span class="glyphicon glyphicon-usd" style="width:auto"></span> Order Now</a>
                                                <% } else {%>
                                            <a href="register.jsp" class="nav-menu-red"><i>Please register to order</i></a>
                                            <% }%>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <%
                                }
                            %>

                        </div>
                    </div>
                    <div align="center">
                        <%
                            int _prev = _currPage - 1;
                            int _next = _currPage + 1;
                            int i = 0;
                            if (_totalPage > 1) {
                                out.print("<ul class='pagination noselect'>");
                            } else {
                                out.print("<ul class='pagination noselect' style='display:none'>");
                            }
                            if (_totalPage > 1) {
                                if (_currPage == 1) {
                                    out.print("<li class='disabled'><a>«</a></li>");
                                } else {
                                    out.print("<li><a href='menu.jsp?p=" + (_currPage - 1) + "'>«</a></li>");
                                }

                                if (_totalPage <= 10) {
                                    for (i = 1; i <= _totalPage; i++) {
                                        if (i == _currPage) {
                                            out.print("<li class='active'><a>" + i + "</a></li>");
                                        } else {
                                            out.print("<li><a href='menu.jsp?p=" + i + "'>" + i + "</a></li>");
                                        }
                                    }
                                } else if (_totalPage > 10) {
                                    if (_currPage < 7) {
                                        for (i = 1; i <= 8; i++) {
                                            if (i == _currPage) {
                                                out.print("<li class='active'><a>" + i + "</a></li>");
                                            } else {
                                                out.print("<li><a href='menu.jsp?p=" + i + "'>" + i + "</a></li>");
                                            }
                                        }
                                        out.print("<li class='gap'><a>...</a></li>");
                                        out.print("<li><a href='menu.jsp?p=" + _totalPage + "'>" + _totalPage + "</a></li>");
                                    } else if (_totalPage - 6 > _currPage && _currPage > 6) {
                                        out.print("<li><a href='menu.jsp?p=1'>1</a></li>");
                                        out.print("<li class='gap'><a>...</a></li>");

                                        for (i = _currPage - 2; i <= _currPage + 3; i++) {
                                            if (i == _currPage) {
                                                out.print("<li class='active'><a>" + i + "</a></li>");
                                            } else {
                                                out.print("<li><a href='menu.jsp?p=" + i + "'>" + i + "</a></li>");
                                            }
                                        }
                                        out.print("<li class='gap'><a>...</a></li>");
                                        out.print("<li><a href='menu.jsp?p=" + _totalPage + "'>" + _totalPage + "</a></li>");
                                    } else {
                                        out.print("<li><a href='menu.jsp?p=1'>1</a></li>");
                                        out.print("<li class='gap'><a>...</a></li>");

                                        for (i = _totalPage - 7; i <= _totalPage; i++) {
                                            if (i == _currPage) {
                                                out.print("<li class='active'><a>" + i + "</a></li>");
                                            } else {
                                                out.print("<li><a href='menu.jsp?p=" + i + "'>" + i + "</a></li>");
                                            }
                                        }
                                    }
                                }

                                if (_currPage == _totalPage) {
                                    out.print("<li class='disabled'><a>»</a></li>");
                                } else {
                                    out.print("<li><a href='menu.jsp?p=" + (_currPage + 1) + "'>»</a></li>");
                                }
                            }
                        %>
                        </ul>
                    </div>
                </div>
                <%@include file="footer.jsp" %>
            </div>
        </div>
    </body>
</html>
<%
    out.print("<script>");
    out.print("document.getElementById('txtName').value = '" + _NameSearch + "';");
    out.print("document.getElementById('cmbPrice').value = " + _SearchPrice + ";");
    if (session.getAttribute("searchName") != null) {
        out.print("highlight('" + (session.getAttribute("searchName").toString()) + "');");
    }
    out.print("</script>");
%>