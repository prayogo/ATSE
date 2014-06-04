/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 *
 * @author Prayogo
 */
public class TransactionHeader {
    private int transactionheaderid;
    private int userid;
    private Date orderdate;
    private int statusid;
    private User user;
    private Status status;
    private Set<TransactionDetail> details = new HashSet();

    public TransactionHeader() {
    }

    public TransactionHeader(int transactionheaderid, int userid, Date orderdate, int statusid) {
        this.transactionheaderid = transactionheaderid;
        this.userid = userid;
        this.orderdate = orderdate;
        this.statusid = statusid;
    }

    public TransactionHeader(int transactionheaderid, int userid, Date orderdate, int statusid, User user, Status status) {
        this.transactionheaderid = transactionheaderid;
        this.userid = userid;
        this.orderdate = orderdate;
        this.statusid = statusid;
        this.user = user;
        this.status = status;
    }
    
    public int getTransactionheaderid() {
        return transactionheaderid;
    }

    public int getUserid() {
        return userid;
    }

    public Date getOrderdate() {
        return orderdate;
    }

    public int getStatusid() {
        return statusid;
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

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public void setOrderdate(Date orderdate) {
        this.orderdate = orderdate;
    }

    public void setStatusid(int statusid) {
        this.statusid = statusid;
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
