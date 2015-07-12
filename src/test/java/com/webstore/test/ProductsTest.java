package com.webstore.test;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import com.webstore.model.Product;
import com.webstore.service.WebStoreService;
import com.webstore.service.WebStoreServiceImpl;
import java.util.List;
import org.junit.Test;
import static org.junit.Assert.*;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 *
 * @author Kiki
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath*:applicationContext.xml"})
public class ProductsTest {


    @Autowired
    WebStoreServiceImpl ws;
    @Test
    public void TestGetProducts() {
        List<Product> list = ws.getAllProducts();
        if (list != null) {
            assertEquals("Coca Cola", list.get(0).getName());
        }

    }
}
