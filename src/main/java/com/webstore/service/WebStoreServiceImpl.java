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

/**
 *
 * @author bmilenkovic
 */
public class WebStoreServiceImpl implements WebStoreService {

    @Override
    public List<Product> getAllProducts() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public UUID placeOrder(Order merchantOrder) {
        // calculate tax for each item
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
