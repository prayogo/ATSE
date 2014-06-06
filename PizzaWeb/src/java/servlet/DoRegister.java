package servlet;

import bean.Role;
import bean.User;
import controller.Adapter;
import controller.Function;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class DoRegister extends HttpServlet {
        
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String _user = request.getParameter("txtUsername");
        String _pass = request.getParameter("txtPassword");
        String _confPass = request.getParameter("txtConfirmPass");
        String _name = request.getParameter("txtName");
        String _address = request.getParameter("txtAddress");
        String _email = request.getParameter("txtEmail");
        String _phone = request.getParameter("txtPhone");
                
        Function function = new Function();
        
        StringBuilder _errMsg = new StringBuilder();
        _errMsg.append("0000000");
        
        if(_user.equals("")){
            _errMsg.setCharAt(0, '1');
        }
        if(_pass.length() < 6 && !function.isAlphaNumber(_pass)){
            _errMsg.setCharAt(1, '1');
        }
        if(_confPass.equals("") || !_confPass.equals(_pass)){
            _errMsg.setCharAt(2, '1');
        }        
        if(!function.isAlpha(_name)){
            _errMsg.setCharAt(3, '1');
        }
        if(_address.length() < 8){
            _errMsg.setCharAt(4, '1');
        }
        if(!function.emailFormat(_email)){
            _errMsg.setCharAt(5, '1');
        }
        if(!function.isNumeric(_phone)){
            _errMsg.setCharAt(6, '1');
        }
        
        if(!_errMsg.toString().equals("0000000")){
            response.sendRedirect("register.jsp?errMsg=" + _errMsg.toString());
        }
        else{
            Adapter _adap = new Adapter();
            Role _role = new Role(2,"Member");
            User _userClass = new User(_name, _pass, _name, _email, _phone, _address);
            _userClass.setRole(_role);
            if(_adap.insertUser(_userClass)){
                response.getWriter().print("s");                
            }
            else{
                response.getWriter().print("a");
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
