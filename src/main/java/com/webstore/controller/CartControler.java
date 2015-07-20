/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webstore.controller;

import com.webstore.model.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.webstore.model.CategoryDAO;
import com.webstore.model.Product;
import com.webstore.service.WebStoreService;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Kiki
 */
@Controller
public class CartControler {

    @Autowired
    CategoryDAO categorydao;

    @Autowired
    WebStoreService webStoreService;

    @RequestMapping("/cart")
    public String cart(HttpServletRequest request, ModelMap model) {

        List<Category> categories = categorydao.get();
        model.addAttribute("CategoryList", categories);

        List<Product> products = new ArrayList<>();

        HttpSession session = request.getSession();

        if (session.getAttribute("cart") != null) {
            HashMap<Integer, Product> sessionProducts = (HashMap<Integer, Product>) session.getAttribute("cart");
            sessionProducts.entrySet().stream().forEach((p) -> {
                products.add(p.getValue());
            });
        }

        model.addAttribute("ProductsList", products);

        return "cart";
    }

    @RequestMapping(value = "addtobasket", method = RequestMethod.POST)
    public String addToBasket(ModelMap map, HttpServletRequest request, @RequestParam("id") Integer id, @RequestParam("qty") String qty) {

        int q = Integer.parseInt(qty);
        HttpSession session = request.getSession();
        HashMap<Integer, Product> cart;
        if (session.getAttribute("cart") == null) {
            session.setAttribute("cart", new HashMap<>());
        }
        cart = (HashMap<Integer, Product>) session.getAttribute("cart");

        if (!cart.containsKey(id)) {
            Product product = (Product) webStoreService.getById(id).get(0);
            product.setOquantity(q);
            cart.put(id, product);
        } else {
            Product InCart = cart.get(id);
            InCart.setOquantity(InCart.getOquantity() + q);
        }

        return "redirect:/shop";
    }
        @RequestMapping(value="/remove", method = RequestMethod.POST)
    public String remove(ModelMap map, HttpServletRequest request, @RequestParam("id") Integer id){ 
       
        
        HttpSession session = request.getSession();
        if(session.getAttribute("cart")!=null){
            HashMap<Integer,Product> products = (HashMap<Integer,Product>)session.getAttribute("cart");
            if(products.containsKey(id)){
                products.remove(id);
            }
        }
        
        return "redirect:/cart";
    }
}