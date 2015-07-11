/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webstore.model;

import java.math.BigDecimal;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Kiki
 */
@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
public class UserDAO {

    @Autowired
    SessionFactory sessionFactory;

    public User get(String username, String password) {
        Query query = sessionFactory.getCurrentSession()
                .createQuery("from User where username = :username and  password = :password");
        query.setParameter("username", username);
        query.setParameter("password", password);
        return (User) query.uniqueResult();
    }
    public void add(String username, String password,String email) {
       
        Session session = sessionFactory.getCurrentSession();
        
        User u = new User();
        u.setUsername(username);
        u.setPassword(password);
        u.setEmail(email);
        session.save(u);
       
    }
}
