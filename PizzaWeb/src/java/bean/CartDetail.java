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
    private int qty;
    private CartHeader header;
    private Product product;

    public CartDetail() {
    }

    public CartDetail(int cartdetailid, int qty) {
        this.cartdetailid = cartdetailid;
        this.qty = qty;
    }

    public CartDetail(int cartdetailid, int qty, CartHeader header, Product product) {
        this.cartdetailid = cartdetailid;
        this.qty = qty;
        this.header = header;
        this.product = product;
    }
   
    public int getCartdetailid() {
        return cartdetailid;
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
