
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
import javax.servlet.http.HttpSession;


public class DoUpdateCustomer extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
        
        String _userid = request.getParameter("userid");
        String _user = request.getParameter("username");
        String _pass = request.getParameter("txtPassword");
        String _confPass = request.getParameter("txtConfirmPass");
        String _name = request.getParameter("txtName");
        String _address = request.getParameter("txtAddress");
        String _email = request.getParameter("txtEmail");
        String _phone = request.getParameter("txtPhone");
        int _roleUser = Integer.parseInt(request.getParameter("ddlRole"));
                
        Function function = new Function();
        
        StringBuilder _errMsg = new StringBuilder();
        _errMsg.append("000000000");
        
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
        
        Adapter _adap = new Adapter();
        User _userC = _adap.getUser("username", _user);
        if(_userC != null && _userC.getUserid() != Integer.parseInt(_userid))
            _errMsg.setCharAt(7,'1');
        _adap = new Adapter();
        if(_adap.getUser("email", _email) != null && _userC.getUserid() != Integer.parseInt(_userid))
            _errMsg.setCharAt(8,'1');
        
        if(!_errMsg.toString().equals("000000000")){
            response.sendRedirect("update-customer.jsp?userid="+_userid+"&errMsg=" + _errMsg.toString());
        }
        else{            
            Role _roleClass = new Role();
            _roleClass.setRoleid(_roleUser);
            
            User _userClass;
            _adap = new Adapter();
            _userClass = _adap.getUser("userid", _userid);
            
            _userClass.setPassword(_pass);
            _userClass.setName(_name);
            _userClass.setAddress(_address);
            _userClass.setEmail(_email);
            _userClass.setPhone(_phone);
            _userClass.setRole(_roleClass);
            
            _adap = new Adapter();
            if(_adap.updateUser(_userClass)){
                response.sendRedirect("customer.jsp");
            }
            else{
                response.sendRedirect("update-customer.jsp?userid="+_userid+"&errMsg=2");
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
