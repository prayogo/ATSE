/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

/**
 *
 * @author Prayogo
 */
public class Product {
    private int productid;
    private String name;
    private String description;
    private int price;
    private String image;

    public Product() {
    }

    public Product(int productid, String name, String description, int price, String image) {
        this.productid = productid;
        this.name = name;
        this.description = description;
        this.price = price;
        this.image = image;
    }

    public int getProductid() {
        return productid;
    }

    public String getName() {
        return name;
    }

    public String getDescription() {
        return description;
    }

    public int getPrice() {
        return price;
    }

    public String getImage() {
        return image;
    }

    public void setProductid(int productid) {
        this.productid = productid;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public void setImage(String image) {
        this.image = image;
    }
}
