/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

/**
 *
 * @author Prayogo
 */
public class Cart {
    private int cartid;
    private int qty;
    private User user;
    private Product product;

    public Cart() {
    }

    public Cart(int cartid, int qty, User user, Product product) {
        this.cartid = cartid;
        this.qty = qty;
        this.user = user;
        this.product = product;
    }

    public int getCartid() {
        return cartid;
    }

    public Product getProduct() {
        return product;
    }

    public int getQty() {
        return qty;
    }

    public User getUser() {
        return user;
    }

    public void setCartid(int cartid) {
        this.cartid = cartid;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public void setQty(int qty) {
        this.qty = qty;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
