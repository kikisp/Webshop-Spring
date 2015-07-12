package com.webstore.test;

import static org.junit.Assert.assertEquals;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.webstore.model.Product;
import com.webstore.service.WebStoreService;

/**
 *
 * @author Kiki
 */
@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration(locations = {"classpath*:applicationContext.xml"})
//@ContextConfiguration ( classes = { CoreServiceTestConfig.class })
//@ContextConfiguration("file:src/main/webapp/WEB-INF/applicationContext.xml")

@ContextConfiguration
(
  {
   "file:src/main/webapp/WEB-INF/applicationContext.xml",
   "file:src/main/webapp/WEB-INF/spring_database.xml",

  }
)

public class ProductsTest {

	@Autowired
    WebStoreService webStoreService;
    
    
    @Test
    public void TestGetProducts() {
        List<Product> list = webStoreService.getAllProducts();
        if (list != null) {
            assertEquals("Coca Cola", list.get(0).getName());
        }

    }
}
