/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import java.io.Serializable;

/**
 *
 * @author Prayogo
 */
public class TransactionDetail implements Serializable{
    private int transactiondetailid;
    private int price;
    private int qty;
    private TransactionHeader header;
    private Product product;
    
    public TransactionDetail() {
    }

    public TransactionDetail(int transactiondetailid, int price, int qty) {
        this.transactiondetailid = transactiondetailid;
        this.price = price;
        this.qty = qty;
    }

    public TransactionDetail(int transactiondetailid, int price, int qty, TransactionHeader header, Product product) {
        this.transactiondetailid = transactiondetailid;
        this.price = price;
        this.qty = qty;
        this.header = header;
        this.product = product;
    }

    
    public int getTransactiondetailid() {
        return transactiondetailid;
    }

    public int getPrice() {
        return price;
    }

    public int getQty() {
        return qty;
    }

    public TransactionHeader getHeader() {
        return header;
    }

    public Product getProduct() {
        return product;
    }

    public void setTransactiondetailid(int transactiondetailid) {
        this.transactiondetailid = transactiondetailid;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public void setQty(int qty) {
        this.qty = qty;
    }

    public void setHeader(TransactionHeader header) {
        this.header = header;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
}
