package com.webstore.test;

import static org.junit.Assert.*;

import java.util.List;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import com.webstore.model.Product;
import com.webstore.service.WebStoreService;
import org.springframework.test.context.web.WebAppConfiguration;

/**
 *
 * @author Kiki
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
        {
            "file:src/main/webapp/WEB-INF/applicationContext.xml",
            "file:src/main/webapp/WEB-INF/spring_database.xml",}
)
@WebAppConfiguration
public class ProductsTest {

    @Autowired
    WebStoreService webStoreService;

    @Test
    public void testGetProducts() {
        List<Product> list = webStoreService.getAllProducts();
        assertNotNull(list);
        assertEquals("Coca Cola".trim(), list.get(0).getName().trim());

    }
}
