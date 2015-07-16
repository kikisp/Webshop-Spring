package com.webstore.test;

import com.webstore.model.Category;
import com.webstore.model.CategoryDAO;
import static org.junit.Assert.*;

import java.util.List;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

/**
 *
 * @author Kiki
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:testContext.xml"})
@WebAppConfiguration
public class CategoriesTest {

    @Autowired
    CategoryDAO categorydao;

    @Test
    public void testGetProducts() {
        List<Category> list = categorydao.get();
        assertNotNull(list);
        assertEquals("Soft Drinks".trim(), list.get(0).getName().trim());

    }
}
