/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webstore.service;

import com.webstore.model.Order;
import com.webstore.model.Product;
import java.util.List;
import java.util.UUID;
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

    @Override
    public List<Product> getAllProducts() {
        Session session = sessionFactory.getCurrentSession();
        List<Product> list = session.createCriteria(Product.class).add(Restrictions.gt("squantity", 0)).list();
        return list;
        
        
    }

    @Override
    public UUID placeOrder(Order merchantOrder) {
        // calculate tax for each item
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
