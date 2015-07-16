package com.webstore.model;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;  
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
public class CategoryDAO {
    
    @Autowired
    SessionFactory sessionFactory;
    
    public List<Category> get(){ 
        Session session = sessionFactory.getCurrentSession();
        List<Category> result = session.createCriteria(Category.class).list();
        return result;
    }
}
