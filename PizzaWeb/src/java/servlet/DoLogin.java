package servlet;

import bean.User;
import controller.Adapter;
import java.io.IOException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class DoLogin extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ServletContext app = getServletContext();
        HttpSession session = request.getSession();
        
        String _user = request.getParameter("txtUsername");
        String _pass = request.getParameter("txtPassword");
        boolean  _remember = request.getParameter("chkRemember") != null;
        
        String _err = "";
        if (_user.equals("")){
            _err = "1";
            session.setAttribute("errLogin", _err);
            response.sendRedirect("index.jsp");
        }else if (_pass.equals("")){
            _err = "2";
            session.setAttribute("errLogin", _err);
            response.sendRedirect("index.jsp");
        }else{
            try{
                Adapter _adap = new Adapter();
                User _userClass = _adap.getUserSingle(_user, _pass);
                if (_userClass != null && _userClass.getUsername() != null){
                    if (_remember){
                        Cookie c = new Cookie("USPizzaWeb", _user);
                        c.setMaxAge(24*60*60);
                        response.addCookie(c);

                        c = new Cookie("PWPizzaWeb", _user);
                        c.setMaxAge(24*60*60);
                        response.addCookie(c);
                    }
    
                    session.setAttribute("loginUser", _userClass);
                    if(app.getAttribute("onlineUser") == null){
                        app.setAttribute("onlineUser", 1); 
                    } else {
                        int total = Integer.parseInt(app.getAttribute("onlineUser").toString());
                        app.setAttribute("onlineUser", total + 1);
                    }
                    response.sendRedirect("index.jsp");
                }
                else{
                    _err = "3";
                    session.setAttribute("errLogin", _err);
                    response.sendRedirect("index.jsp");
                }
            }
            catch(IOException ex){
                _err = "4";
                session.setAttribute("errLogin", _err);
                response.sendRedirect("index.jsp");
            }
        }
    }

    protected void processRequestGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ServletContext app = getServletContext();
        HttpSession session = request.getSession();
        
        String _user = "";
        String _pass = "";
        
        Cookie[] cookies = request.getCookies();
        if (cookies != null){
            for(int i = 0; i < cookies.length; i++)
            { 
                Cookie c = cookies[i];
                if (c.getName().equals("USPizzaWeb"))
                {
                    _user = c.getValue();
                    c.setMaxAge(24*60*60);
                }else if (c.getName().equals("PWPizzaWeb"))
                {
                    _pass = c.getValue();
                    c.setMaxAge(24*60*60);
                }
            }

            String _err = "";
            if (_user.equals("")){
                _err = "1";
                session.setAttribute("errLogin", _err);
                response.sendRedirect("index.jsp");
            }else if (_pass.equals("")){
                _err = "2";
                session.setAttribute("errLogin", _err);
                response.sendRedirect("index.jsp");
            }else{
                try{
                    Adapter _adap = new Adapter();
                    User _userClass = _adap.getUserSingle(_user, _pass);
                    if (_userClass != null && _userClass.getUsername() != null){
                        session.setAttribute("loginUser", _userClass);
                        if(app.getAttribute("onlineUser") == null){
                            app.setAttribute("onlineUser", 1); 
                        } else {
                            int total = Integer.parseInt(app.getAttribute("onlineUser").toString());
                            app.setAttribute("onlineUser", total + 1);
                        }
                        String _gotoURL = "index";
                        if (session.getAttribute("gotoURL") != null){
                            _gotoURL = session.getAttribute("gotoURL").toString();
                            session.removeAttribute("gotoURL");
                        }
                        response.sendRedirect(_gotoURL+".jsp");
                    }
                    else{
                        _err = "3";
                        session.setAttribute("errLogin", _err);
                        response.sendRedirect("index.jsp");
                    }
                }
                catch(IOException ex){
                    _err = "4";
                    session.setAttribute("errLogin", _err);
                    response.sendRedirect("index.jsp");
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
        processRequestGet(request, response);
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
