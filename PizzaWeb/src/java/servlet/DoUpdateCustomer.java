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

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String _userid = request.getParameter("userid");
        String _user = request.getParameter("username");
        String _pass = request.getParameter("txtPassword");
        String _confPass = request.getParameter("txtConfirmPass");
        String _name = request.getParameter("txtName");
        String _address = request.getParameter("txtAddress");
        String _email = request.getParameter("txtEmail");
        String _phone = request.getParameter("txtPhone");
        int _roleUser = Integer.parseInt(request.getParameter("ddlRole"));

        HttpSession session = request.getSession();
        String _msg = "";
        try {
            if (session.getAttribute("loginUser") == null) {
                response.sendRedirect("pagenotfound.jsp");
            } else {
                int roleid = ((User) session.getAttribute("loginUser")).getRole().getRoleid();
                if (roleid != 1) {
                    response.sendRedirect("pagenotfound.jsp");
                } else {
                    Function function = new Function();
                    if (_user.equals("")) {
                        _msg = "Username must be filled";
                        session.setAttribute("errCustomerMsg", _msg);
                        session.setAttribute("_name", _name);
                        session.setAttribute("_address", _address);
                        session.setAttribute("_email", _email);
                        session.setAttribute("_phone", _phone);
                        session.setAttribute("_role", _roleUser);
                        response.sendRedirect("update-customer.jsp?uid=" + _userid);
                    } else if (_pass.length() < 6 && !function.isAlphaNumber(_pass)) {
                        _msg = "Password must alphanumeric and more than 6 character";
                        session.setAttribute("errCustomerMsg", _msg);
                        session.setAttribute("_name", _name);
                        session.setAttribute("_address", _address);
                        session.setAttribute("_email", _email);
                        session.setAttribute("_phone", _phone);
                        session.setAttribute("_role", _roleUser);
                        response.sendRedirect("update-customer.jsp?uid=" + _userid);
                    } else if (_confPass.equals("") || !_confPass.equals(_pass)) {
                        _msg = "Confirm password must same as password";
                        session.setAttribute("errCustomerMsg", _msg);
                        session.setAttribute("_name", _name);
                        session.setAttribute("_address", _address);
                        session.setAttribute("_email", _email);
                        session.setAttribute("_phone", _phone);
                        session.setAttribute("_role", _roleUser);
                        response.sendRedirect("update-customer.jsp?uid=" + _userid);
                    } else if (!function.isAlpha(_name)) {
                        _msg = "Name must be alphabet";
                        session.setAttribute("errCustomerMsg", _msg);
                        session.setAttribute("_name", _name);
                        session.setAttribute("_address", _address);
                        session.setAttribute("_email", _email);
                        session.setAttribute("_phone", _phone);
                        session.setAttribute("_role", _roleUser);
                        response.sendRedirect("update-customer.jsp?uid=" + _userid);
                    } else if (_address.length() < 8) {
                        _msg = "Address must be more than 8 character";
                        session.setAttribute("errCustomerMsg", _msg);
                        session.setAttribute("_name", _name);
                        session.setAttribute("_address", _address);
                        session.setAttribute("_email", _email);
                        session.setAttribute("_phone", _phone);
                        session.setAttribute("_role", _roleUser);
                        response.sendRedirect("update-customer.jsp?uid=" + _userid);
                    } else if (!function.emailFormat(_email)) {
                        _msg = "Email must be in valid format. ex: grazzie@pizza.com";
                        session.setAttribute("errCustomerMsg", _msg);
                        session.setAttribute("_name", _name);
                        session.setAttribute("_address", _address);
                        session.setAttribute("_email", _email);
                        session.setAttribute("_phone", _phone);
                        session.setAttribute("_role", _roleUser);
                        response.sendRedirect("update-customer.jsp?uid=" + _userid);
                    } else if (!function.isNumeric(_phone)) {
                        _msg = "Phone number must be numeric";
                        session.setAttribute("errCustomerMsg", _msg);
                        session.setAttribute("_name", _name);
                        session.setAttribute("_address", _address);
                        session.setAttribute("_email", _email);
                        session.setAttribute("_phone", _phone);
                        session.setAttribute("_role", _roleUser);
                        response.sendRedirect("update-customer.jsp?uid=" + _userid);
                    } else {
                        Adapter _adap = new Adapter();
                        if (_adap.getUser("username", _user) == null) {
                            _msg = "Please choose customer options";
                            session.setAttribute("errCustomerMsg", _msg);
                            session.setAttribute("_name", _name);
                            session.setAttribute("_address", _address);
                            session.setAttribute("_email", _email);
                            session.setAttribute("_phone", _phone);
                            session.setAttribute("_role", _roleUser);
                            response.sendRedirect("update-customer.jsp?uid=" + _userid);
                        } else {
                            _adap = new Adapter();
                            if (_adap.getListUser("email", _email, _userid).size() > 0) {
                                _msg = "Email already exists";
                                session.setAttribute("errCustomerMsg", _msg);
                                session.setAttribute("_name", _name);
                                session.setAttribute("_address", _address);
                                session.setAttribute("_email", _email);
                                session.setAttribute("_phone", _phone);
                                session.setAttribute("_role", _roleUser);
                                response.sendRedirect("update-customer.jsp?uid=" + _userid);
                            } else {
                                _adap = new Adapter();
                                if (_adap.getRole(_roleUser) == null) {
                                    _msg = "Please choose role options";
                                    session.setAttribute("errCustomerMsg", _msg);
                                    session.setAttribute("_name", _name);
                                    session.setAttribute("_address", _address);
                                    session.setAttribute("_email", _email);
                                    session.setAttribute("_phone", _phone);
                                    session.setAttribute("_role", _roleUser);
                                    response.sendRedirect("update-customer.jsp?uid=" + _userid);
                                } else {
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
                                    if (_adap.updateUser(_userClass)) {
                                        response.sendRedirect("customer.jsp");
                                    } else {
                                        _msg = "Sorry, an error occurred while processing your request";
                                        session.setAttribute("errCustomerMsg", _msg);
                                        session.setAttribute("_name", _name);
                                        session.setAttribute("_address", _address);
                                        session.setAttribute("_email", _email);
                                        session.setAttribute("_phone", _phone);
                                        session.setAttribute("_role", _roleUser);
                                        response.sendRedirect("update-customer.jsp?uid=" + _userid);
                                    }
                                }
                            }
                        }
                    }
                }
            }
        } catch (Exception ex) {
            _msg = "Sorry, an error occurred while processing your request";
            session.setAttribute("errRegisterMsg", _msg);
            session.setAttribute("_name", _name);
            session.setAttribute("_address", _address);
            session.setAttribute("_email", _email);
            session.setAttribute("_phone", _phone);
            session.setAttribute("_role", _roleUser);
            response.sendRedirect("update-customer.jsp?uid=" + _userid);
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
