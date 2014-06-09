package servlet;

import bean.Cart;
import bean.User;
import controller.Adapter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class DoDeleteCart extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        if (session.getAttribute("loginUser") == null) {
            response.sendRedirect("pagenotfound.jsp");
        } else {
            int _userId = ((User) session.getAttribute("loginUser")).getUserid();
            int _productId = -1;
            String _product = request.getParameter("hdnProduct");
            try {
                _productId = Integer.parseInt(_product);
            } catch (Exception ex) {
                _productId = -1;
            }

            String _msg = "";

            if (_productId == -1) {
                _msg = "Please choose cart options";
                session.setAttribute("errCartMsg", _msg);
                session.setAttribute("errCartType", "fail");
                response.sendRedirect("cart.jsp");
            } else {
                List _listCart;
                Adapter _adap = new Adapter();
                if (_productId == 0) {
                    _listCart = _adap.getCartList(_userId);
                } else {
                    _listCart = _adap.getCartId(_userId, _productId);
                }

                if (_listCart.size() > 0) {
                    _adap = new Adapter();
                    if (_adap.deleteCart(_listCart)) {
                        if (_listCart.size() > 1) {
                            _msg = "All items removed from Cart";
                        } else {
                            _msg = ((Cart) _listCart.get(0)).getQty() + " "
                                    + ((Cart) _listCart.get(0)).getProduct().getName() + "(s) removed from Cart";
                        }
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
                    _msg = "Please choose cart options";
                    session.setAttribute("errCartMsg", _msg);
                    session.setAttribute("errCartType", "fail");
                    response.sendRedirect("cart.jsp");
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
