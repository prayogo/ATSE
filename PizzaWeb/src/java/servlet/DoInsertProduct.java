package servlet;

import bean.Product;
import bean.User;
import controller.Adapter;
import controller.Function;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;

@MultipartConfig()
public class DoInsertProduct extends HttpServlet {

    private Part fileImage(HttpServletRequest request) {
        try {
            Part filePart = request.getPart("fileImage");
            return filePart;
        } catch (IllegalStateException ex) {
            return null;
        } catch (ServletException ex) {
            return null;
        } catch (IOException ex) {
            return null;
        }
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String _msg = "";

        String _productId = request.getParameter("productId");
        String _productName = request.getParameter("txtProductName");
        String _productDesc = request.getParameter("txtProductDescription");
        String _productPrice = request.getParameter("txtProductPrice");
        String _productImage = request.getParameter("productImage");
        Part _image = fileImage(request);
        
        try {
            if (session.getAttribute("loginUser") == null) {
                response.sendRedirect("pagenotfound.jsp");
            } else {
                int roleid = ((User) session.getAttribute("loginUser")).getRole().getRoleid();
                if (roleid != 1) {
                    response.sendRedirect("pagenotfound.jsp");
                } else {
                    Function function = new Function();

                    if (_productName.equals("")) {
                        _msg = "Name must be filled";
                        session.setAttribute("errProductMsg", _msg);
                        session.setAttribute("_productName", _productName);
                        session.setAttribute("_productDesc", _productDesc);
                        session.setAttribute("_productPrice", _productPrice);
                        response.sendRedirect("manage-product.jsp");
                    } else if (_productDesc.length() < 8) {
                        _msg = "Description must be more than 8 characters";
                        session.setAttribute("_productName", _productName);
                        session.setAttribute("_productDesc", _productDesc);
                        session.setAttribute("_productPrice", _productPrice);
                        session.setAttribute("errProductMsg", _msg);
                        response.sendRedirect("manage-product.jsp");
                    } else if (!function.isNumeric(_productPrice)) {
                        _msg = "Price must be numeric";
                        session.setAttribute("errProductMsg", _msg);
                        session.setAttribute("_productName", _productName);
                        session.setAttribute("_productDesc", _productDesc);
                        session.setAttribute("_productPrice", _productPrice);
                        response.sendRedirect("manage-product.jsp");
                    } else if (_productImage.equals("")) {
                        _msg = "Image must be filled";
                        session.setAttribute("errProductMsg", _msg);
                        session.setAttribute("_productName", _productName);
                        session.setAttribute("_productDesc", _productDesc);
                        session.setAttribute("_productPrice", _productPrice);
                        response.sendRedirect("manage-product.jsp");
                    } else {
                        Adapter _adap = new Adapter();
                        Product _product = new Product();
                        _product.setName(_productName);
                        _product.setDescription(_productDesc);
                        _product.setPrice(Integer.parseInt(_productPrice));
                        _product.setImage(_productImage);

                        if (_adap.insertProduct(_product, _image)) {
                            response.sendRedirect("product.jsp");
                        } else {
                            _msg = "Sorry, an error occurred while processing your request";
                            session.setAttribute("_productName", _productName);
                            session.setAttribute("_productDesc", _productDesc);
                            session.setAttribute("_productPrice", _productPrice);
                            session.setAttribute("errProductMsg", _msg);
                            response.sendRedirect("manage-product.jsp");
                        }
                    }
                }
            }
        } catch (Exception ex) {
            _msg = "Sorry, an error occurred while processing your request";
            session.setAttribute("_productName", _productName);
            session.setAttribute("_productDesc", _productDesc);
            session.setAttribute("_productPrice", _productPrice);
            session.setAttribute("errProductMsg", _msg);
            response.sendRedirect("manage-product.jsp");
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
