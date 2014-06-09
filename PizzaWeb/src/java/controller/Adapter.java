/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bean.*;
import java.util.ArrayList;
import java.util.List;
import org.apache.jasper.tagplugins.jstl.core.ForEach;
import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author prk
 */
public class Adapter {

    Session sess;
    Transaction transaction;
    List list;

    public Adapter() {
        sess = HibernateUtil.getSessionFactory().openSession();
    }

    public User getUserSingle(String _user, String _pass) {
        User _userClass = null;
        list = sess.createSQLQuery("SELECT * FROM msuser WHERE (username = '" + _user
                + "' or email = '" + _user + "') and password = '" + _pass + "'").addEntity(User.class).list();
        if (list.size() > 0) {
            _userClass = (User) list.get(0);
            Hibernate.initialize(_userClass.getRole());
        }
        sess.close();
        return _userClass;
    }

    public List getPriceRange() {
        list = sess.createSQLQuery("SELECT * FROM ltpricerange").addEntity(PriceRange.class).list();
        sess.close();
        return list;
    }

    public List getProduct(String _text, String _price) {
        String query = "SELECT a.* "
                + "FROM msproduct a "
                + "JOIN ltpricerange b on a.price between b.price1 and case when b.price2 = 0 then a.price else b.price2 end "
                + "WHERE (a.name like '%" + _text + "%' or a.description like '%" + _text + "%') and "
                + "b.pricerangeid = (case when " + _price + " = 0 then b.pricerangeid else " + _price + " end)";
        list = sess.createSQLQuery(query).addEntity(Product.class).list();
        sess.close();
        return list;
    }

    public List getProduct() {
        String query = "SELECT a.* "
                + "FROM msproduct a ORDER BY a.name";
        list = sess.createSQLQuery(query).addEntity(Product.class).list();
        sess.close();
        return list;
    }

    public List getProduct(String _productId) {
        String query = "SELECT a.* "
                + "FROM msproduct a WHERE a.productid = " + _productId;
        list = sess.createSQLQuery(query).addEntity(Product.class).list();
        sess.close();
        return list;
    }

    public List getListUser(String _user) {
        String query = "Select * from msuser where username like '%" + _user + "%'";
        list = sess.createSQLQuery(query).addEntity(User.class).list();
        for (User _userClass : (List<User>) list) {
            Hibernate.initialize(_userClass.getRole());
        }
        sess.close();
        return list;
    }

    public Product getProductSingle(String _productId) {
        String query = "SELECT * from msproduct where productId = " + _productId;
        list = sess.createSQLQuery(query).addEntity(Product.class).list();

        Product _product = new Product();

        if (!list.isEmpty()) {
            _product = (Product) list.get(0);
        }
        sess.close();
        return _product;
    }

    public List getTransactionReport() {
        String query = "select * from trTransactionHeader order by orderdate";
        list = sess.createSQLQuery(query).addEntity(TransactionHeader.class).list();

        List<TransactionReport> _listReport = new ArrayList<TransactionReport>();
        for (TransactionHeader _header : (List<TransactionHeader>) list) {
            for (TransactionDetail _detail : _header.getDetails()) {
                TransactionReport _report = new TransactionReport();
                _report.setTransactionheaderid(_header.getTransactionheaderid());
                _report.setOrderdate(_header.getOrderdate());
                _report.setStatus(_header.getStatus().getStatus());
                _report.setUsername(_header.getUser().getUsername());
                _report.setPrice(_detail.getPrice());
                _report.setQty(_detail.getQty());
                _report.setName(_detail.getProduct().getName());
                _listReport.add(_report);
            }
        }
        sess.close();
        return _listReport;
    }

    public User getUser(String column, String value) {

        User _user = null;

        String query = "select * from msuser where " + column + " ='" + value + "'";
        list = sess.createSQLQuery(query).addEntity(User.class).list();

        if (!list.isEmpty()) {
            _user = (User) list.get(0);
            Hibernate.initialize(_user.getRole());
        }
        sess.close();
        return _user;
    }

    public List getListUser(String column, String value, String _userId) {
        String query = "select * from msuser where " + column + " ='" + value + "' and userid <> " + _userId;
        list = sess.createSQLQuery(query).addEntity(User.class).list();
        sess.close();
        return list;
    }

    public List getListRole() {
        String query = "select * from ltrole";
        list = sess.createSQLQuery(query).addEntity(Role.class).list();
        sess.close();
        return list;
    }

    public Role getRole(int _roleId) {
        String query = "select * from ltrole where roleid = " + _roleId;
        list = sess.createSQLQuery(query).addEntity(Role.class).list();
        sess.close();
        Role _role = null;
        if (list.size() > 0) {
            _role = (Role) list.get(0);
        }
        return _role;
    }
    //new by Sun

    public List getListStatus() {
        String query = "select * From ltstatus";
        list = sess.createSQLQuery(query).addEntity(Status.class).list();
        sess.close();
        return list;
    }
    //new by Sun

    public List getListTransaction() {
        String query = "select * from trTransactionHeader order by orderdate desc";
        list = sess.createSQLQuery(query).addEntity(TransactionHeader.class).list();
        for (TransactionHeader _header : (List<TransactionHeader>) list) {
            Hibernate.initialize(_header.getUser());
            Hibernate.initialize(_header.getDetails());
            Hibernate.initialize(_header.getStatus());
        }
        sess.close();
        return list;
    }
    //new by Sun

    public TransactionHeader getTrHeader(String _trHeaderId) {
        String query = "select * from trTransactionHeader where transactionheaderid =" + _trHeaderId;
        list = sess.createSQLQuery(query).addEntity(TransactionHeader.class).list();

        TransactionHeader _trHeader = null;
        if (!list.isEmpty()) {
            _trHeader = (TransactionHeader) list.get(0);
            Hibernate.initialize(_trHeader.getUser());
            Hibernate.initialize(_trHeader.getDetails());
            Hibernate.initialize(_trHeader.getStatus());
        }
        sess.close();
        return _trHeader;
    }

    public boolean insertUser(User _user) {
        transaction = sess.beginTransaction();
        transaction.begin();
        try {
            sess.save(_user);
            transaction.commit();
        } catch (Exception ex) {
            transaction.rollback();
            sess.close();
            return false;
        }
        sess.close();
        return true;
    }

    public boolean updateUser(User _user) {
        transaction = sess.beginTransaction();
        transaction.begin();
        try {
            sess.update(_user);
            transaction.commit();
        } catch (Exception ex) {
            transaction.rollback();
            sess.close();
            return false;
        }
        sess.close();
        return true;
    }

    public boolean deleteUser(User _user) {
        transaction = sess.beginTransaction();
        transaction.begin();
        try {
            sess.delete(_user);
            transaction.commit();
        } catch (Exception ex) {
            transaction.rollback();
            sess.close();
            return false;
        }
        sess.close();
        return true;
    }

    public boolean insertCart(Cart _cart) {
        transaction = sess.beginTransaction();
        transaction.begin();
        try {
            sess.saveOrUpdate(_cart);
            transaction.commit();
        } catch (Exception ex) {
            transaction.rollback();
            sess.close();
            return false;
        }
        sess.close();
        return true;
    }

    // new by Sun
    public boolean insertProduct(Product _product) {
        transaction = sess.beginTransaction();
        transaction.begin();
        try {
            sess.save(_product);
            transaction.commit();
        } catch (Exception ex) {
            transaction.rollback();
            sess.close();
            return false;
        }
        sess.close();
        return true;
    }

    // new by Sun
    public boolean updateProduct(Product _product) {
        transaction = sess.beginTransaction();
        transaction.begin();
        try {
            sess.update(_product);
            transaction.commit();
        } catch (Exception ex) {
            transaction.rollback();
            sess.close();
            return false;
        }
        sess.close();
        return true;
    }

    // new by Sun
    public boolean deleteProduct(Product _product) {
        transaction = sess.beginTransaction();
        transaction.begin();
        try {
            sess.delete(_product);
            transaction.commit();
        } catch (Exception ex) {
            transaction.rollback();
            sess.close();
            return false;
        }
        sess.close();
        return true;
    }

    // new by Sun
    public boolean updateTransactionStatus(TransactionHeader _trHeader) {
        transaction = sess.beginTransaction();
        transaction.begin();
        try {
            sess.update(_trHeader);
            transaction.commit();
        } catch (Exception ex) {
            transaction.rollback();
            sess.close();
            return false;
        }
        sess.close();
        return true;
    }

    //create new 18:11PM 7 Jun
    public List getCartList(int _userId) {
        String query = "SELECT a.* "
                + "FROM trcart a join msproduct b on a.productid = b.productid WHERE a.userid = " + _userId + " order by b.name";
        list = sess.createSQLQuery(query).addEntity(Cart.class).list();
        for (Cart _cart : (List<Cart>) list) {
            Hibernate.initialize(_cart.getProduct());
            Hibernate.initialize(_cart.getUser());
        }
        sess.close();
        return list;
    }

    //create new 18:11PM 7 Jun
    public boolean deleteCart(List _cartList) {
        transaction = sess.beginTransaction();
        transaction.begin();
        try {
            Cart _cart;
            for (int i = 0; i < _cartList.size(); i++) {
                _cart = (Cart) _cartList.get(i);
                sess.delete(_cart);
            }
            transaction.commit();
        } catch (Exception ex) {
            transaction.rollback();
            sess.close();
            return false;
        }
        sess.close();
        return true;
    }

    public boolean confirmCart(TransactionHeader _header, List _details, List _carts) {
        transaction = sess.beginTransaction();
        transaction.begin();
        try {
            sess.save(_header);
            TransactionDetail _detail;
            Cart _cart;

            for (int i = 0; i < _details.size(); i++) {
                _detail = (TransactionDetail) _details.get(i);
                _detail.setHeader(_header);
                sess.save(_detail);
            }

            for (int i = 0; i < _carts.size(); i++) {
                _cart = (Cart) _carts.get(i);
                sess.delete(_cart);
            }
            transaction.commit();
        } catch (HibernateException ex) {
            transaction.rollback();
            sess.close();
            return false;
        }
        sess.close();
        return true;
    }

    public List getTransactionHeader() {
        String query = "SELECT * "
                + "FROM trtransactionheader order by orderdate desc";
        list = sess.createSQLQuery(query).addEntity(TransactionHeader.class).list();
        for (TransactionHeader _header : (List<TransactionHeader>) list) {
            Hibernate.initialize(_header.getUser());
            Hibernate.initialize(_header.getDetails());
            Hibernate.initialize(_header.getStatus());
        }
        sess.close();
        return list;
    }

    public List getTransactionHeader(int _userId) {
        String query = "SELECT * "
                + "FROM trtransactionheader WHERE userid = " + _userId + " order by orderdate asc";
        list = sess.createSQLQuery(query).addEntity(TransactionHeader.class).list();
        for (TransactionHeader _header : (List<TransactionHeader>) list) {
            Hibernate.initialize(_header.getUser());
            Hibernate.initialize(_header.getDetails());
            Hibernate.initialize(_header.getStatus());
        }
        sess.close();
        return list;
    }

    public List getTransactionHeader(int _userId, int _headerId) {
        String query = "SELECT * "
                + "FROM trtransactionheader WHERE userid = " + _userId + " and transactionheaderid = " + _headerId;
        list = sess.createSQLQuery(query).addEntity(TransactionHeader.class).list();
        for (TransactionHeader _header : (List<TransactionHeader>) list) {
            Hibernate.initialize(_header.getUser());
            Hibernate.initialize(_header.getDetails());
            Hibernate.initialize(_header.getStatus());
        }
        sess.close();
        return list;
    }

    public List getCartId(int _userId, int _productId) {
        String query = "SELECT * "
                + "FROM trcart WHERE userid = " + _userId + " and productid = " + _productId;
        list = sess.createSQLQuery(query).addEntity(Cart.class).list();
        for (Cart _cart : (List<Cart>) list) {
            Hibernate.initialize(_cart.getProduct());
            Hibernate.initialize(_cart.getUser());
        }
        sess.close();
        return list;
    }
}
