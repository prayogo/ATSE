package servlet;

import bean.User;
import controller.Adapter;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class DoDeleteCustomer extends HttpServlet {

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
                    String _userid = request.getParameter("hdnUID");
                    Adapter _adap = new Adapter();
                    User _userClass;
                    _userClass = _adap.getUser("userid", _userid);
                    _adap = new Adapter();
                    if (_adap.deleteUser(_userClass)) {
                        response.sendRedirect("customer.jsp");
                        _msg = "Customer data deleted";
                        session.setAttribute("errCustomerMsg", _msg);
                        session.setAttribute("errCustomerType", "success");
                        response.sendRedirect("customer.jsp");
                    } else {
                        _msg = "Sorry, an error occurred while processing your request";
                        session.setAttribute("errCustomerMsg", _msg);
                        session.setAttribute("errCustomerType", "fail");
                        response.sendRedirect("customer.jsp");
                    }
                }
            }
        } catch (Exception ex) {
            _msg = "Sorry, an error occurred while processing your request";
            session.setAttribute("errCustomerMsg", _msg);
            session.setAttribute("errCustomerType", "fail");
            response.sendRedirect("customer.jsp");
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
