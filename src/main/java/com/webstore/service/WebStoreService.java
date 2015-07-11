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
public interface WebStoreService {
    
    public List<Product> getAllProducts();
    public UUID placeOrder(Order merchantOrder);
    
}
