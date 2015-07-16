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

    private String uname;
    private String pwd;
    private String mail;

    @Autowired
    UserDAO userdao;
    
        @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String getindex(ModelMap map) {
        return "index";
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String getlogin(ModelMap map) {
        return "index";
    }

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String getregister(ModelMap map) {
        return "register";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String submitRegister(@RequestParam("username") String username, @RequestParam("password") String password, @RequestParam("email") String email, ModelMap map) {

        uname = username.trim().replace("--", "");
        pwd = password.trim().replace("--", "");
        mail = email.trim().replace("--", "");

        User user = userdao.compare(uname);

        if (user != null) {
            map.addAttribute("msg", "User already exsist.");
            return "register";

        } else {
            userdao.add(uname, pwd, mail);
            map.addAttribute("msg", "Registration is successfull.");
            return "index";
        }
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(ModelMap map, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        return "index";
    }
}
