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

        HttpSession session = request.getSession();
        String _msg = "";

        try {
            Function function = new Function();
            if (_user.equals("")) {
                _msg = "Username must be filled";
                session.setAttribute("errRegisterMsg", _msg);
                session.setAttribute("_username", _user);
                session.setAttribute("_name", _name);
                session.setAttribute("_address", _address);
                session.setAttribute("_email", _email);
                session.setAttribute("_phone", _phone);
                response.sendRedirect("register.jsp");
            } else if (_pass.length() < 6 && !function.isAlphaNumber(_pass)) {
                _msg = "Password must alphanumeric and more than 6 character";
                session.setAttribute("errRegisterMsg", _msg);
                session.setAttribute("_username", _user);
                session.setAttribute("_name", _name);
                session.setAttribute("_address", _address);
                session.setAttribute("_email", _email);
                session.setAttribute("_phone", _phone);
                response.sendRedirect("register.jsp");
            } else if (_confPass.equals("") || !_confPass.equals(_pass)) {
                _msg = "Confirm password must same as password";
                session.setAttribute("errRegisterMsg", _msg);
                session.setAttribute("_username", _user);
                session.setAttribute("_name", _name);
                session.setAttribute("_address", _address);
                session.setAttribute("_email", _email);
                session.setAttribute("_phone", _phone);
                response.sendRedirect("register.jsp");
            } else if (!function.isAlpha(_name)) {
                _msg = "Name must be alphabet";
                session.setAttribute("errRegisterMsg", _msg);
                session.setAttribute("_username", _user);
                session.setAttribute("_name", _name);
                session.setAttribute("_address", _address);
                session.setAttribute("_email", _email);
                session.setAttribute("_phone", _phone);
                response.sendRedirect("register.jsp");
            } else if (_address.length() < 8) {
                _msg = "Address must be more than 8 character";
                session.setAttribute("errRegisterMsg", _msg);
                session.setAttribute("_username", _user);
                session.setAttribute("_name", _name);
                session.setAttribute("_address", _address);
                session.setAttribute("_email", _email);
                session.setAttribute("_phone", _phone);
                response.sendRedirect("register.jsp");
            } else if (!function.emailFormat(_email)) {
                _msg = "Email must be in valid format. ex: grazzie@pizza.com";
                session.setAttribute("errRegisterMsg", _msg);
                session.setAttribute("_username", _user);
                session.setAttribute("_name", _name);
                session.setAttribute("_address", _address);
                session.setAttribute("_email", _email);
                session.setAttribute("_phone", _phone);
                response.sendRedirect("register.jsp");
            } else if (!function.isNumeric(_phone)) {
                _msg = "Phone number must be numeric";
                session.setAttribute("errRegisterMsg", _msg);
                session.setAttribute("_username", _user);
                session.setAttribute("_name", _name);
                session.setAttribute("_address", _address);
                session.setAttribute("_email", _email);
                session.setAttribute("_phone", _phone);
                response.sendRedirect("register.jsp");
            } else {
                Adapter _adap = new Adapter();
                if (_adap.getUser("username", _user) != null) {
                    _msg = "Username already exists";
                    session.setAttribute("errRegisterMsg", _msg);
                    session.setAttribute("_username", _user);
                    session.setAttribute("_name", _name);
                    session.setAttribute("_address", _address);
                    session.setAttribute("_email", _email);
                    session.setAttribute("_phone", _phone);
                    response.sendRedirect("register.jsp");
                } else {
                    _adap = new Adapter();
                    if (_adap.getUser("email", _email) != null) {
                        _msg = "Email already exists";
                        session.setAttribute("errRegisterMsg", _msg);
                        session.setAttribute("_username", _user);
                        session.setAttribute("_name", _name);
                        session.setAttribute("_address", _address);
                        session.setAttribute("_email", _email);
                        session.setAttribute("_phone", _phone);
                        response.sendRedirect("register.jsp");
                    } else {
                        Role _roleClass = new Role();
                        _roleClass.setRoleid(2);
                        User _userClass = new User(_user, _pass, _name, _email, _phone, _address, _roleClass);
                        _adap = new Adapter();
                        if (_adap.insertUser(_userClass)) {
                            response.sendRedirect("index.jsp");
                        } else {
                            _msg = "Sorry, an error occurred while processing your request";
                            session.setAttribute("errRegisterMsg", _msg);
                            session.setAttribute("_username", _user);
                            session.setAttribute("_name", _name);
                            session.setAttribute("_address", _address);
                            session.setAttribute("_email", _email);
                            session.setAttribute("_phone", _phone);
                            response.sendRedirect("register.jsp");
                        }
                    }
                }
            }
        } catch (Exception ex) {
            _msg = "Sorry, an error occurred while processing your request";
            session.setAttribute("errRegisterMsg", _msg);
            session.setAttribute("_username", _user);
            session.setAttribute("_name", _name);
            session.setAttribute("_address", _address);
            session.setAttribute("_email", _email);
            session.setAttribute("_phone", _phone);
            response.sendRedirect("register.jsp");
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
