
package bean;

public class TransactionReport {
    private int transactionheaderid;
    private String orderdate;
    private String status;
    private String username;
    private String name;
    private int price;
    private int qty;

    public TransactionReport() {
    }

    public TransactionReport(int transactionheaderid, String orderdate, String status, String username, String name, int price, int qty) {
        this.transactionheaderid = transactionheaderid;
        this.orderdate = orderdate;
        this.status = status;
        this.username = username;
        this.name = name;
        this.price = price;
        this.qty = qty;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getOrderdate() {
        return orderdate;
    }

    public void setOrderdate(String orderdate) {
        this.orderdate = orderdate;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getQty() {
        return qty;
    }

    public void setQty(int qty) {
        this.qty = qty;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getTransactionheaderid() {
        return transactionheaderid;
    }

    public void setTransactionheaderid(int transactionheaderid) {
        this.transactionheaderid = transactionheaderid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
    
}
