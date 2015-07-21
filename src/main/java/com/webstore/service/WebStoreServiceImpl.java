/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webstore.service;

import com.webstore.model.Orders;
import com.webstore.model.Product;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author bmilenkovic
 */
@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
public class WebStoreServiceImpl implements WebStoreService {
    @Autowired
    SessionFactory sessionFactory;
    public static final String SQUANTITY = "squantity";
    @Override
    public List<Product> getAllProducts() {
        Session session = sessionFactory.getCurrentSession();
        List<Product> list = session.createCriteria(Product.class).add(Restrictions.gt(SQUANTITY, 0)).list();
        return list;
    }
    
    public List<Product> getByCategory(int id){
        Session session = sessionFactory.getCurrentSession();
        List<Product> list = session.getNamedQuery("Product.findByCategory").setInteger("category", id).list();
        return list;
    }
    
     public List<Product> getById(int id){
        Session session = sessionFactory.getCurrentSession();
        List<Product> list = (List<Product>) session.getNamedQuery("Product.findByProductId").setInteger("productId", id).list();
        return list;
    }
    public List<Product> getSearch(String q){
        Session session = sessionFactory.getCurrentSession();
        List<Product> list = session.createCriteria(Product.class).add(Restrictions.like("name", "%"+q+"%")).list();
        return list;
    }
    
    public void updateProductQty(HashMap cart){
        
      Session session = sessionFactory.getCurrentSession();
       
      HashMap<Integer, Product> sessionProducts = cart;
        for (Map.Entry<Integer, Product> p : sessionProducts.entrySet()) {
            Query q=session.createSQLQuery("UPDATE products SET squantity = squantity - " + p.getValue().getOquantity() + " WHERE product_id = " + p.getValue().getProductId());
            q.executeUpdate();
        }
          
//           
        
    }

    @Override
    public void placeOrder(Orders merchantOrder) {
        Session session = sessionFactory.getCurrentSession();
        session.save(merchantOrder);
    }
    
}
