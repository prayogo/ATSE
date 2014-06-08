/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;

/**
 *
 * @author Prayogo
 */
public class TransactionHeader {

    private int transactionheaderid;
    private String orderdate;
    private User user;
    private Status status;
    private Set<TransactionDetail> details = new HashSet();

    public TransactionHeader() {
    }

    public TransactionHeader(int transactionheaderid, String orderdate) {
        this.transactionheaderid = transactionheaderid;
        this.orderdate = orderdate;
    }

    public TransactionHeader(int transactionheaderid, String orderdate, User user, Status status) {
        this.transactionheaderid = transactionheaderid;
        this.orderdate = orderdate;
        this.user = user;
        this.status = status;
    }

    public int getTransactionheaderid() {
        return transactionheaderid;
    }

    public String getOrderdate() {
        return orderdate;
    }

    public User getUser() {
        return user;
    }

    public Status getStatus() {
        return status;
    }

    public Set<TransactionDetail> getDetails() {
        return details;
    }

    public void setTransactionheaderid(int transactionheaderid) {
        this.transactionheaderid = transactionheaderid;
    }

    public void setOrderdate(String orderdate) {
        this.orderdate = orderdate;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    public void setDetails(Set<TransactionDetail> details) {
        this.details = details;
    }
}
