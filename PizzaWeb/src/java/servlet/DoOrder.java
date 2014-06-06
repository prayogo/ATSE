package servlet;

import bean.CartDetail;
import bean.CartHeader;
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

        String _productId = request.getParameter("productID");
        String _qty = request.getParameter("txtQty");
        String _msg = "";
        Adapter _adap = new Adapter();
        if (_productId.equals("")) {
            _msg = "Please choose product options";
            session.setAttribute("errLogin", _msg);
            session.setAttribute("errOrderType", "fail");
            response.sendRedirect("order.jsp");
        } else if (_qty.equals("")) {
            _msg = "Please fill quantity before adding to cart";
            session.setAttribute("errLogin", _msg);
            session.setAttribute("errOrderType", "fail");
            response.sendRedirect("order.jsp");
        } else if (!_qty.equals("") && Integer.parseInt(_qty) < 1) {
            _msg = "Please fill quantity with non zero integer";
            session.setAttribute("errLogin", _msg);
            session.setAttribute("errOrderType", "fail");
            response.sendRedirect("order.jsp");
        }else if(_adap.getProduct(_productId).size() < 1){
            _msg = "Please choose product options";
            session.setAttribute("errLogin", _msg);
            session.setAttribute("errOrderType", "fail");
            response.sendRedirect("order.jsp");
        }else{
            User _user = (User)session.getAttribute("loginUser");
            CartHeader _header = new CartHeader();
            _header.setUser(_user);
            Date now = new Date();  
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            _header.setOrderdate(sdf.format(now));
            CartDetail _detail = new CartDetail();
            _detail.setQty(Integer.parseInt(_qty));
            _detail.setHeader(_header);
            Product _product = new Product();
            _product.setProductid(Integer.parseInt(_productId));
            _detail.setProduct(_product);
            
            response.getWriter().print(_adap.insertCart(_header, _detail));
            
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
