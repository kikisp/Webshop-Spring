/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webstore.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.webstore.model.User;
import com.webstore.model.UserDAO;

/**
 *
 * @author Kiki
 */
@Controller
public class LoginRegControler {

    @Autowired
    UserDAO userdao;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String getlogin(ModelMap map) {
        return "index";
    }

    @RequestMapping(value = "/shop", method = RequestMethod.POST)
    public String submitlogin(@RequestParam("username") String username, @RequestParam("password") String password, ModelMap map,HttpServletRequest request) {
        String cusername = username.trim().replace("--", "");
        String cpassword = password.trim().replace("--", "");
        User user = userdao.get(cusername, cpassword);
        if (user == null) {
            map.addAttribute("msg", "Wrong username or password!!");
            return "index";
        } else {
            HttpSession hsession = request.getSession();
            hsession.setAttribute("user", user.getUsername());
            return "shop";
        }
    }

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String Register(ModelMap map) {
        return "register";  
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String submitRegister(@RequestParam("username") String username, @RequestParam("password") String password, @RequestParam("email") String email, ModelMap map) {

        boolean bmail = email.matches("\"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\\.[a-zA-Z0-9-.]+$\"");
        boolean busername = username != null && ((username = username.trim()).length() > 0);
        boolean bpassword = password != null && ((password = password.trim()).length() > 0);

        if (!busername || !bpassword ) {
            
            return "register";
           
        } else {
            userdao.add(username, password, email);
            return "index";
        }
    }
}
