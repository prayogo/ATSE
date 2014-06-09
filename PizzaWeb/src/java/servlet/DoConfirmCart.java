package servlet;

import bean.*;
import controller.Adapter;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class DoConfirmCart extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("loginUser") == null) {
            response.sendRedirect("pagenotfound.jsp");
        } else {
            String _msg = "";
            User _user = (User) session.getAttribute("loginUser");

            List _listCart;
            Adapter _adap = new Adapter();
            _listCart = _adap.getCartList(_user.getUserid());

            if (_listCart.size() > 0) {
                TransactionHeader _header = new TransactionHeader();
                _header.setUser(_user);
                _header.setTransactionheaderid(0);
                Status _status = new Status();
                _status.setStatusid(1);
                _header.setStatus(_status);
                SimpleDateFormat sdfDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                Date now = new Date();
                _header.setOrderdate(sdfDate.format(now));

                List _listDetail = new ArrayList();
                TransactionDetail _detail;
                Product _product;
                for (int i = 0; i < _listCart.size(); i++) {
                    _detail = new TransactionDetail();
                    _detail.setHeader(_header);
                    _product = new Product();
                    _product.setProductid(((Cart) _listCart.get(i)).getProduct().getProductid());
                    _product.setPrice(((Cart) _listCart.get(i)).getProduct().getPrice());
                    _detail.setPrice(_product.getPrice());
                    _detail.setProduct(_product);
                    _detail.setQty(((Cart) _listCart.get(i)).getQty());
                    _listDetail.add(_detail);
                }
                _adap = new Adapter();
                if (_adap.confirmCart(_header, _listDetail, _listCart)) {
                    _msg = "Thank you for your order. You can click Track to view the order";
                    session.setAttribute("errCartMsg", _msg);
                    session.setAttribute("errCartType", "success");
                    response.sendRedirect("cart.jsp");
                } else {
                    _msg = "Sorry, an error occurred while processing your request";
                    session.setAttribute("errCartMsg", _msg);
                    session.setAttribute("errCartType", "fail");
                    response.sendRedirect("cart.jsp");
                }
            } else {
                _msg = "You don't have any item in your cart";
                session.setAttribute("errCartMsg", _msg);
                session.setAttribute("errCartType", "fail");
                response.sendRedirect("cart.jsp");
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
        //processRequest(request, response);
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
