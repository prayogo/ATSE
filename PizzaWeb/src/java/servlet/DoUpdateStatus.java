
package servlet;

import bean.Status;
import bean.TransactionHeader;
import bean.User;
import controller.Adapter;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class DoUpdateStatus extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        if(session.getAttribute("loginUser") == null){
            response.sendRedirect("index.jsp");
        }
        int roleid = ((User)session.getAttribute("loginUser")).getRole().getRoleid();
        if(roleid != 1){
            response.sendRedirect("index.jsp");
        }   
        
        String _trHeaderId = request.getParameter("idHeader");
        int _trHeaderStatusId = Integer.parseInt(request.getParameter("statusid"));
        
        
        Adapter _adap = new Adapter();
        TransactionHeader _trHeader = new TransactionHeader();
        
        _trHeader = _adap.getTrHeader(_trHeaderId);
        Status _status = new Status();
        
        _status.setStatusid(_trHeaderStatusId);
        
        _trHeader.setStatus(_status);
        
        if(_adap.updateTransactionStatus(_trHeader)){
            response.sendRedirect("transaction.jsp");
        }
        else{
            response.getWriter().print("Update Error");
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
