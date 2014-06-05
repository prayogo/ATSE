/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bean.PriceRange;
import bean.Product;
import bean.User;
import java.util.List;
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
                    "JOIN ltpricerange b on a.price between b.price1 and case when b.price2 = 0 then a.price else b.price2 end "+
                    "WHERE (a.name like '%"+_text+"%' or a.description like '%"+_text+"%') and "+
                    "b.pricerangeid = (case when "+_price+" = 0 then b.pricerangeid else "+_price+" end)";
        list = sess.createSQLQuery(query).addEntity(Product.class).list();
        return list;
    }
    
    public List getProduct(){
        String query = "SELECT a.* "+
                    "FROM msproduct a ORDER BY a.name";
        list = sess.createSQLQuery(query).addEntity(Product.class).list();
        return list;
    }
    
    public boolean insertUser(User _user){
        transaction = sess.beginTransaction();
        transaction.begin();
        try{
            sess.save(_user);            
            transaction.commit();
        }catch(Exception ex){
            transaction.rollback();
            return false;
        }
        
        return true;        
    }

}
