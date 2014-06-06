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
public class CartHeader {
    private int cartheaderid;
    private int userid;
    private Date orderdate;
    private User user;
    private Set<CartDetail> details = new HashSet();

    public CartHeader() {
    }

    public CartHeader(int cartheaderid, int userid, Date orderdate) {
        this.cartheaderid = cartheaderid;
        this.userid = userid;
        this.orderdate = orderdate;
    }

    public CartHeader(int cartheaderid, int userid, Date orderdate, User user) {
        this.cartheaderid = cartheaderid;
        this.userid = userid;
        this.orderdate = orderdate;
        this.user = user;
    }

    public int getCartheaderid() {
        return cartheaderid;
    }

    public int getUserid() {
        return userid;
    }

    public Date getOrderdate() {
        return orderdate;
    }

    public User getUser() {
        return user;
    }

    public Set<CartDetail> getDetails() {
        return details;
    }
    
    public void setCartheaderid(int cartheaderid) {
        this.cartheaderid = cartheaderid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public void setOrderdate(Date orderdate) {
        this.orderdate = orderdate;
    }

    public void setDetails(Set<CartDetail> details) {
        this.details = details;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
