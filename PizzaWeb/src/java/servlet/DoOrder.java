package servlet;

import bean.Cart;
import bean.Product;
import bean.User;
import controller.Adapter;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class DoOrder extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("loginUser") == null) {
            response.sendRedirect("index.jsp");
        } else {

            String _productId = request.getParameter("productID");
            String _qty = request.getParameter("txtQty");
            String _msg = "";
            Adapter _adap = new Adapter();
            boolean _correctInt = false;
            try{
                 Integer.parseInt(_qty);
                 _correctInt = true;
            }catch(Exception ex)
            {
                _correctInt = false;
            }
            if (_productId.equals("")) {
                _msg = "Please choose product options";
                session.setAttribute("errOrderMsg", _msg);
                session.setAttribute("errOrderType", "fail");
                response.sendRedirect("order.jsp");
            } else if (_qty.equals("")) {
                _msg = "Please fill quantity before adding to cart";
                session.setAttribute("errOrderMsg", _msg);
                session.setAttribute("errOrderType", "fail");
                response.sendRedirect("order.jsp");
            } else if (!_correctInt || (!_qty.equals("") && Integer.parseInt(_qty) < 1)) {
                _msg = "Please fill quantity with non zero integer";
                session.setAttribute("errOrderMsg", _msg);
                session.setAttribute("errOrderType", "fail");
                response.sendRedirect("order.jsp");
            } else if (_adap.getProduct(_productId).size() < 1) {
                _msg = "Please choose product options";
                session.setAttribute("errOrderMsg", _msg);
                session.setAttribute("errOrderType", "fail");
                response.sendRedirect("order.jsp");
            } else {
                User _user = (User) session.getAttribute("loginUser");
                Cart _cart = new Cart();
                List _cartList = _adap.getCartId(_user.getUserid(), Integer.parseInt(_productId));
                int _cartIdInDB = 0;
                int _qtyInDB = 0;
                if (_cartList.size() > 0) {
                    _qtyInDB = ((Cart) _cartList.get(0)).getQty();
                    _cartIdInDB = ((Cart) _cartList.get(0)).getCartid();
                }
                _cart.setUser(_user);
                _cart.setCartid(_cartIdInDB);
                _cart.setQty(Integer.parseInt(_qty) + _qtyInDB);
                Product _product = new Product();
                _product.setProductid(Integer.parseInt(_productId));
                _cart.setProduct(_product);

                _adap = new Adapter();
                if (_adap.insertCart(_cart)) {
                    _adap = new Adapter();
                    String productName = ((Product) _adap.getProduct(_productId).get(0)).getName();
                    _msg = _qty + " " + productName + "(s) Added to Cart";
                    session.setAttribute("errOrderMsg", _msg);
                    session.setAttribute("errOrderType", "success");
                    response.sendRedirect("order.jsp");
                } else {
                    _msg = "Sorry, an error occurred while processing your request";
                    session.setAttribute("errOrderMsg", _msg);
                    session.setAttribute("errOrderType", "fail");
                    response.sendRedirect("order.jsp");
                }
            }
        }

    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
