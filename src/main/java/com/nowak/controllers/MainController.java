package com.nowak.controllers;

import com.nowak.dao.UserDao;
import com.nowak.db_entities.Forms;
import com.nowak.db_entities.Messages;
import com.nowak.db_entities.User;
import com.nowak.service.UserDetailsService;
import com.nowak.validation.ValidationUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.validation.Valid;
import java.util.List;

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
    public String showAdminPage(Model model) {
        List<Forms> forms = userDetailsService.getForms();
        List<Messages> messages = userDetailsService.getMessages();
        model.addAttribute("formsList", forms);
        model.addAttribute("messagesList", messages);
        return "admin-page";
    }
    @RequestMapping("/adminManager/users")
    public String showUsers(Model model){
        List<User> users = userDetailsService.getUsers();
        model.addAttribute("usersList", users);
        return "admin-page-users";
    }

    @RequestMapping("/accessDenied")
    public String showErrorPage() {
        return "error-page";
    }

    @RequestMapping("/contactForm")
    public String showContactForm(Model model) {
        Forms form = new Forms();
        form.setUsername(userDetailsService.currentlyLoggedUser());
        model.addAttribute("dataFromContactForm", form);
        return "form-page";
    }

    @RequestMapping("/sendForm")
    public String sendForm(@ModelAttribute("dataFromContactForm") Forms form, Model model) {
        //  form.setUsername(userDetailsService.currentlyLoggedUser());
        userDetailsService.addForm(form);
        model.addAttribute("passedAlert", "Formularz wysłany!");
        return "form-page";
    }

    @RequestMapping("/contactMessage")
    public String showMsgForm(Model model) {
        Messages message = new Messages();
        message.setUsername(userDetailsService.currentlyLoggedUser());
        model.addAttribute("messageModel", message);
        return "message-page";
    }

    @RequestMapping("/proceedSendingMessage")
    public String sendMessage(@ModelAttribute("messageModel") Messages message, Model model) {
        userDetailsService.addMessage(message);
        model.addAttribute("passedAlert", "Wiadomość wysłana!");
        return "message-page";
    }

    @RequestMapping("/managerForm/deleteRecord")
    public String deleteUserAccount() {
        return null;
    }

    @RequestMapping("/managerForm/deleteMessage")
    public String deleteMessage() {
        return null;
    }
    @RequestMapping("/managerForm/deleteUser")
    public String deleteUser() {
        return null;
    }
}
