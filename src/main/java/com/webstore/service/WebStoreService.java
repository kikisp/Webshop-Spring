/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webstore.service;


import com.webstore.model.Orders;
import com.webstore.model.Product;
import java.util.List;
import java.util.UUID;

/**
 *
 * @author bmilenkovic
 */
public interface WebStoreService {
    
    public List<Product> getAllProducts();
    public List<Product> getByCategory(int id);
    public List<Product> getSearch(String  q);
    public UUID placeOrder(Orders merchantOrder);
    
    
}
