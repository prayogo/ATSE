/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bean.Cart;
import bean.PriceRange;
import bean.Role;
import bean.Product;
import bean.User;
import java.util.List;
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

    public User getUserSingle(String _user, String _pass){
        User _userClass = null;
        list = sess.createSQLQuery("SELECT * FROM msuser WHERE (username = '" + _user 
                + "' or email = '"+ _user +"') and password = '"+ _pass +"'").addEntity(User.class).list();
        if (list.size() > 0){
            _userClass = (User)list.get(0);
        }
        return _userClass;
    }
    
    public List getPriceRange(){
        list = sess.createSQLQuery("SELECT * FROM ltpricerange").addEntity(PriceRange.class).list();
        return list;
    }
    
    public List getProduct(String _text, String _price){
        String query = "SELECT a.* "+
                    "FROM msproduct a "+
                    "JOIN ltpricerange b on a.price between b.price1 and b.price2 "+
                    "WHERE (a.name like '%"+_text+"%' or a.description like '%"+_text+"%') and "+
                    "b.pricerangeid = (case when "+_price+" = 0 then b.pricerangeid else "+_price+" end)";
        list = sess.createSQLQuery(query).addEntity(Product.class).list();
        return list;
    }
      
   public List getListUser(String _user){
       String query = "Select * from msuser where username like '%" + _user + "%'";
       list = sess.createSQLQuery(query).addEntity(User.class).list();
       
       return list;
   }
    
    public Product getProductSingle(String _productId){
        String query = "SELECT * from msproduct where productId = " + _productId;        
        list = sess.createSQLQuery(query).addEntity(Product.class).list();
        
        Product _product = new Product();
        
        if(!list.isEmpty())
            _product = (Product)list.get(0);
        
        return _product;
    }
    
   public User getUser(String column, String value){
       
       User _user = new User();
       
       String query = "select * from msuser where " + column + " ='" + value + "'";
       list = sess.createSQLQuery(query).addEntity(User.class).list();
       
       if(!list.isEmpty())
           _user = (User)list.get(0);
       
       return _user;
   }   
   
   public List getListRole(){
       String query = "select * from ltrole";
       list = sess.createSQLQuery(query).addEntity(Role.class).list();
       
       return list;
   }
   
    public boolean insertUser(User _user){
        transaction = sess.beginTransaction();
        transaction.begin();
        try{
            sess.save(_user);            
            transaction.commit();
        }catch(Exception ex){            
            transaction .rollback();
            return false;
        }        
        return true;        
    }
  
    public boolean updateUser(User _user){
        transaction = sess.beginTransaction();
        transaction.begin();
        try{
            sess.update(_user);            
            transaction.commit();
        }catch(Exception ex){            
            transaction .rollback();
            return false;
        }        
        return true;        
    }
    
    public boolean deleteUser(User _user){
        transaction = sess.beginTransaction();
        transaction.begin();
        try{
            sess.delete(_user);            
            transaction.commit();
        }catch(Exception ex){            
            transaction .rollback();
            return false;
        }        
        return true;        
    }

    public List getProduct() {
        String query = "SELECT a.* "
                + "FROM msproduct a ORDER BY a.name";
        list = sess.createSQLQuery(query).addEntity(Product.class).list();
        return list;
    }

    public List getProduct(String _productId) {
        String query = "SELECT a.* "
                + "FROM msproduct a WHERE a.productid = " + _productId;
        list = sess.createSQLQuery(query).addEntity(Product.class).list();
        return list;
    }

    public boolean insertCart(Cart _cart) {
        transaction = sess.beginTransaction();
        transaction.begin();
        try {
            sess.saveOrUpdate(_cart);
            transaction.commit();
        } catch (Exception ex) {
            transaction.rollback();
            return false;
        }

        return true;
    }
    
    public List getCartId(int _userId, int _productId){
        String query = "SELECT * "
                + "FROM trcart WHERE userid = " + _userId + " and productid = " + _productId;
        list = sess.createSQLQuery(query).addEntity(Cart.class).list();
        return list;
    }
    
    protected void finalize ()  {
        if (sess.isOpen()){
            sess.close();
        }
    }
}