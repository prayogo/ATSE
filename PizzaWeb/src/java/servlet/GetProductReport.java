
package servlet;

import controller.Adapter;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.HashMap;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperRunManager;
import net.sf.jasperreports.engine.data.JRBeanArrayDataSource;

public class GetProductReport extends HttpServlet {

   protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
       ServletOutputStream _servletOutputStream = response.getOutputStream();
       
       File _file = new File(getServletConfig().getServletContext().getRealPath("WEB-INF/ProductReport.jasper"));
       
       byte[] bytes = null;
       Adapter _adap = new Adapter();
       List _listProduct;

       _listProduct = _adap.getProduct();
       
       JRBeanArrayDataSource jr = new JRBeanArrayDataSource(_listProduct.toArray());               
        
       try{
            bytes = JasperRunManager.runReportToPdf(_file.getPath(), new HashMap(), jr);
       }
       catch(JRException ex){
           response.getWriter().print(ex.toString());
       }      
       response.setContentType("application/pdf");
       response.setContentLength(bytes.length);

       _servletOutputStream.write(bytes, 0, bytes.length);
       _servletOutputStream.flush();
       _servletOutputStream.close();
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
