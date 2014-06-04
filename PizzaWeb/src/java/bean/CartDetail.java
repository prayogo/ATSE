/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

/**
 *
 * @author Prayogo
 */
public class CartDetail {
    private int cartdetailid;
    private int cartheaderid;
    private int productid;
    private int qty;
    private CartHeader header;
    private Product product;

    public CartDetail() {
    }

    public CartDetail(int cartdetailid, int cartheaderid, int productid, int qty) {
        this.cartdetailid = cartdetailid;
        this.cartheaderid = cartheaderid;
        this.productid = productid;
        this.qty = qty;
    }

    public CartDetail(int cartdetailid, int cartheaderid, int productid, int qty, CartHeader header, Product product) {
        this.cartdetailid = cartdetailid;
        this.cartheaderid = cartheaderid;
        this.productid = productid;
        this.qty = qty;
        this.header = header;
        this.product = product;
    }
   
    public int getCartdetailid() {
        return cartdetailid;
    }

    public int getCartheaderid() {
        return cartheaderid;
    }

    public int getProductid() {
        return productid;
    }

    public int getQty() {
        return qty;
    }

    public CartHeader getHeader() {
        return header;
    }

    public Product getProduct() {
        return product;
    }

    public void setCartdetailid(int cartdetailid) {
        this.cartdetailid = cartdetailid;
    }

    public void setCartheaderid(int cartheaderid) {
        this.cartheaderid = cartheaderid;
    }

    public void setProductid(int productid) {
        this.productid = productid;
    }

    public void setQty(int qty) {
        this.qty = qty;
    }

    public void setHeader(CartHeader header) {
        this.header = header;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
}
