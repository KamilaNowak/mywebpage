package com.nowak.controllers;

import com.nowak.dao.UserDao;
import com.nowak.db_entities.User;
import com.nowak.service.UserDetailsService;
import com.nowak.validation.ValidationUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.validation.Valid;

@Controller
public class MainController {

    @Autowired
    private UserDao userDao;

    @Autowired
    private UserDetailsService userDetailsService;

    @RequestMapping("/")
    public String showMainPage() {
        return "main-page";
    }

    @RequestMapping("/cpu")
    public String showCpus() {
        return "cpu-page";
    }

    @RequestMapping("/login")
    public String showLoginPage() {
        return "login-page";
    }


    // Mappings for registeration

    @RequestMapping("/register")
    public String showRegisterationPage(Model model) {
        model.addAttribute("validationUser", new ValidationUser());
        return "register-page";
    }

    @RequestMapping("/proceedRegisteration")
    public String proceedRegisteration(@Valid @ModelAttribute("validationUser") ValidationUser validationUser, BindingResult result, Model model) {
        if (result.hasErrors()) {
            model.addAttribute("fieldError", result.getFieldError().getDefaultMessage());
            return "register-page";
        }
        String userName = validationUser.getUsername();
        User isUserExisting = userDao.findUser(userName);
        if (isUserExisting != null) {
            model.addAttribute("fieldError", "User with that username already exists!");
            return "register-page";
        } else if (result.hasErrors() == false) {
            model.addAttribute("successRegisterMessage", "User successfully registered ");
        }
        userDetailsService.addUser(validationUser);
        return "register-page";
    }

    @RequestMapping("/adminManager")
    public String showAdminPage(){
        return "admin-page";
    }
    @RequestMapping("/accessDenied")
    public String showErrorPage(){
        return "error-page";
    }

    @RequestMapping("/contactForm")
    public String showContactForm(){
        return"form-page";
    }

}
