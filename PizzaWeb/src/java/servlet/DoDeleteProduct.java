package servlet;

import bean.Product;
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

public class DoDeleteProduct extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String _msg = "";
        HttpSession session = request.getSession();

        try {
            if (session.getAttribute("loginUser") == null) {
                response.sendRedirect("pagenotfound.jsp");
            } else {
                int roleid = ((User) session.getAttribute("loginUser")).getRole().getRoleid();
                if (roleid != 1) {
                    response.sendRedirect("pagenotfound.jsp");
                } else {
                    String _productId = request.getParameter("hdnProductId");
                    Adapter _adap = new Adapter();
                    Product _productClass;

                    List _listProduct = _adap.getProduct(_productId);
                    if (_listProduct.size() > 0) {
                        _productClass = (Product) _listProduct.get(0);

                        _adap = new Adapter();
                        if (_adap.deleteProduct(_productClass)) {
                            _msg = "Product data deleted";
                            session.setAttribute("errProductMsg", _msg);
                            session.setAttribute("errProductType", "success");
                            response.sendRedirect("product.jsp");
                        } else {
                            _msg = "Sorry, an error occurred while processing your request";
                            session.setAttribute("errProductMsg", _msg);
                            session.setAttribute("errProductType", "fail");
                            response.sendRedirect("product.jsp");
                        }
                    } else {
                        _msg = "Please choose product options";
                        session.setAttribute("errProductMsg", _msg);
                        session.setAttribute("errProductType", "fail");
                        response.sendRedirect("product.jsp");
                    }
                }
            }
        } catch (Exception ex) {
            _msg = "Sorry, an error occurred while processing your request";
            session.setAttribute("errProductMsg", _msg);
            session.setAttribute("errProductType", "fail");
            response.sendRedirect("product.jsp");
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
