
package servlet;

import bean.Product;
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

public class DoInsertProduct extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        if(session.getAttribute("loginUser") == null){
            response.sendRedirect("index.jsp");
            return;
        }
        int roleid = ((User)session.getAttribute("loginUser")).getRole().getRoleid();
        if(roleid != 1){
            response.sendRedirect("index.jsp");
            return;
        }   
        
        Function function = new Function();
        
        String _productId = request.getParameter("productId");
        String _productName = request.getParameter("txtProductName");
        String _productDesc = request.getParameter("txtProductDescription");
        String _productPrice = request.getParameter("txtProductPrice");
        String _productImage = request.getParameter("productImage");
        
        StringBuilder _errMsg = new StringBuilder();
        _errMsg.append("0000");
        
        if(_productName.equals("")){
            _errMsg.setCharAt(0, '1');
        }
        if(_productDesc.length() < 8){
            _errMsg.setCharAt(1, '1');
        }
        if(!function.isNumeric(_productPrice)){
            _errMsg.setCharAt(2, '1');
        }
        if(_productImage.equals("")){
            _errMsg.setCharAt(3, '1');
        }
        
        if(!_errMsg.toString().equals("0000")){
            response.sendRedirect("manage-product.jsp?errMsg=" + _errMsg.toString());
        }
        else{                       
            Adapter _adap = new Adapter();
            
            Product _product = new Product();
            
            _product.setName(_productName);
            _product.setDescription(_productDesc);
            _product.setPrice(Integer.parseInt(_productPrice));
            _product.setImage(_productImage);
            
            if(_adap.insertProduct(_product)){
                response.sendRedirect("product.jsp");
            }
            else{
                response.sendRedirect("manage-product.jsp?errMsg=2");
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
