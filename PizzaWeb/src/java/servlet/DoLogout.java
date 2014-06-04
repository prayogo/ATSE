package servlet;

import java.io.IOException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class DoLogout extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ServletContext app = getServletContext();
        HttpSession session = request.getSession();
        
        Cookie[] cookies = request.getCookies();
        for(int i = 0; i < cookies.length; i++)
        { 
            Cookie c = cookies[i];
            if (c.getName().equals("USPizzaWeb") || c.getName().equals("PWPizzaWeb"))
            {
                c.setMaxAge(0);
                c.setValue("");
                response.addCookie(c);
            }
        }
        
        if (session.getAttribute("loginUser") != null){
            session.invalidate();
            int total = Integer.parseInt(app.getAttribute("onlineUser").toString());
            if(total == 1){
                app.removeAttribute("onlineUser");
            }else{
                app.setAttribute("onlineUser", total - 1);
            }
        }
        
        response.sendRedirect("index.jsp");
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
