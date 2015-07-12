/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webstore.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author Kiki
 */
@Controller
public class LinkControler {


    
     @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index (ModelMap map) {
        return "index";
    }
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout (ModelMap map,HttpServletRequest request) {
         HttpSession hsession = request.getSession();
         hsession.invalidate();
        return "index";
    }
}
