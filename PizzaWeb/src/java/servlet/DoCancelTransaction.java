package servlet;

import bean.Status;
import bean.TransactionHeader;
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

public class DoCancelTransaction extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("loginUser") == null) {
            response.sendRedirect("pagenotfound.jsp");
        } else {
            String _msg = "";
            int _headerId = -1;
            User _user = (User) session.getAttribute("loginUser");
            String _headerIdreq = request.getParameter("hdnTrHeader");
            try {
                _headerId = Integer.parseInt(_headerIdreq);
            } catch (Exception ex) {
                _headerId = -1;
            }
            if (_headerId == -1) {
                _msg = "Please choose the order options";
                session.setAttribute("errTrackMsg", _msg);
                session.setAttribute("errTrackType", "fail");
                response.sendRedirect("track.jsp");
            } else {
                List _listTrHeader;
                Adapter _adap = new Adapter();
                _listTrHeader = _adap.getTransactionHeader(_user.getUserid(), _headerId);
                if (_listTrHeader.size() < 1) {
                    _msg = "Please choose the order options";
                    session.setAttribute("errTrackMsg", _msg);
                    session.setAttribute("errTrackType", "fail");
                    response.sendRedirect("track.jsp");
                } else {
                    TransactionHeader _header = (TransactionHeader) _listTrHeader.get(0);
                    Status _status = new Status();
                    _status.setStatusid(5);
                    _header.setStatus(_status);
                    _adap = new Adapter();
                    if (_adap.updateTransactionStatus(_header)) {
                        _msg = "Your order has been canceled";
                        session.setAttribute("errTrackMsg", _msg);
                        session.setAttribute("errTrackType", "success");
                        response.sendRedirect("track.jsp");
                    } else {
                        _msg = "Sorry, an error occurred while processing your request";
                        session.setAttribute("errTrackMsg", _msg);
                        session.setAttribute("errTrackType", "fail");
                        response.sendRedirect("track.jsp");
                    }
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
