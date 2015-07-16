/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webstore.controller;

import com.webstore.model.Category;
import com.webstore.model.CategoryDAO;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.webstore.model.Product;
import com.webstore.model.User;
import com.webstore.model.UserDAO;
import com.webstore.service.WebStoreService;
import org.springframework.web.bind.annotation.PathVariable;

/**
 *
 * @author Kiki
 */
@Controller
public class ShopControler {

    private String uname;
    private String pwd;
    private String mail;

    @Autowired
    UserDAO userdao;

    @Autowired
    CategoryDAO categorydao;

    @Autowired
    WebStoreService webStoreService;

    @RequestMapping(value = "/shop", method = RequestMethod.GET)
    public String getshop(ModelMap map) {

        List<Category> categories = categorydao.get();
        List<Product> products = webStoreService.getAllProducts();
        map.addAttribute("ProductList", products);
        map.addAttribute("CategoryList", categories);

        return "shop";
    }

    @RequestMapping(value = "/shop", method = RequestMethod.POST)
    public String submitlogin(@RequestParam("username") String username, @RequestParam("password") String password, ModelMap map, HttpServletRequest request) {
        uname = username.trim().replace("--", "");
        pwd = password.trim().replace("--", "");
        User user = userdao.get(uname, pwd);
        if (user == null) {
            map.addAttribute("msg", "Wrong username or password!!");
            return "index";
        } else {
            HttpSession session = request.getSession(false);
            if (session != null) {
                session.setAttribute("user", user.getUsername());
            }
            List<Category> categories = categorydao.get();
            List<Product> products = webStoreService.getAllProducts();
            map.addAttribute("ProductList", products);
            map.addAttribute("CategoryList", categories);
            return "shop";
        }
    }

    @RequestMapping(value = "/shop/{id}", method = RequestMethod.GET)
    public String getbyCategory(@PathVariable int id, ModelMap map) {
        List<Category> categories = categorydao.get();
        List<Product> products = webStoreService.getByCategory(id);
        map.addAttribute("ProductList", products);
        map.addAttribute("CategoryList", categories);
        return "shop";

    }
    @RequestMapping(value = "/shop/search", method = RequestMethod.POST)
    public String search(@RequestParam("search") String q, ModelMap map) {
        List<Category> categories = categorydao.get();
        List<Product> products = webStoreService.getSearch(q);
        map.addAttribute("ProductList", products);
        map.addAttribute("CategoryList", categories);
        return "shop";
    }
}
