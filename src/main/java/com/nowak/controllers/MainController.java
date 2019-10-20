package com.nowak.controllers;

import com.nowak.dao.UserDao;
import com.nowak.db_entities.Forms;
import com.nowak.db_entities.Messages;
import com.nowak.db_entities.User;
import com.nowak.service.UserDetailsService;
import com.nowak.validation.ValidationPassword;
import com.nowak.validation.ValidationUser;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.persistence.criteria.CriteriaBuilder;
import javax.validation.Valid;
import java.util.List;

@Controller
public class MainController {

    @Autowired
    private UserDao userDao;

    @Autowired
    private UserDetailsService userDetailsService;

    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

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
        List<User> users = userDetailsService.getUsers();
        model.addAttribute("usersList", users);
        model.addAttribute("formsList", forms);
        model.addAttribute("messagesList", messages);
        return "admin-page";
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

    @RequestMapping("/adminManager/deleteRecord")
    public String deleteUserAccount(@RequestParam("User_id") int id) {
        userDetailsService.deleteForm(id);
        return "redirect:/adminManager";
    }

    @RequestMapping("/adminManager/deleteMessage")
    public String deleteMessage(@RequestParam("Message_id") int id) {
        userDetailsService.deleteMessage(id);
        return "redirect:/adminManager";
    }

    @RequestMapping("/adminManager/deleteUser")
    public String deleteUser(@RequestParam("User_id") int id) {
        userDetailsService.deleteUser(id);
        return "redirect:/adminManager";
    }

    @RequestMapping("/account")
    public String myAccount(Model model) {
        User user = userDetailsService.findUserByUsername(userDetailsService.currentlyLoggedUser());
        List<Forms> formsList = userDetailsService.getOnlyUserForms(userDetailsService.currentlyLoggedUser());
        List<Messages> messagesList = userDetailsService.getOnlyUserMessages(userDetailsService.currentlyLoggedUser());
        if (user.getPhone() == 0) {
            user.setPhone(0);
        }
        if (user.getBirthDate() == null) {
            user.setBirthDate("Brak danych");
        }
        model.addAttribute("user", user);
        model.addAttribute("forms", formsList);
        model.addAttribute("messages", messagesList);
        return "account-page";
    }

    @RequestMapping("/account/edit-account")
    public String editAccount(Model model) {
        User user = userDetailsService.findUserByUsername(userDetailsService.currentlyLoggedUser());
        ValidationUser validationUser = userDetailsService.convertToValidationUser(user);
        model.addAttribute("validationUser",validationUser);
        return "edit-account-page";
    }
    @RequestMapping("account/proceedEditAccount")
    public String editAccountProceed(@Valid @ModelAttribute("validationUser") ValidationUser validationUser, BindingResult bindingResult, Model model){
        User user = userDetailsService.convertToUser(validationUser);
        if (bindingResult.hasErrors()) {
            model.addAttribute("fieldError", bindingResult.getFieldError().getDefaultMessage());
                return "edit-account-page";
        }
//       String userName = validationUser.getUsername();
//        User isUserExisting = userDao.findUser(userName);
//        if (isUserExisting != null) {
//            model.addAttribute("fieldError", "User with that username already exists!");
//            return "edit-account-page";
        else if (bindingResult.hasErrors() == false) {
            model.addAttribute("successRegisterMessage", "Zaktualizowano szczegóły konta ");
        }
        userDetailsService.updateUser(validationUser);
        return"edit-account-page";
    }
    @RequestMapping("/account/change-password")
    public String changePassword(Model model){
        model.addAttribute("validationPassword", new ValidationPassword());
        return "change-password-page";
    }
  //  @PreAuthorize("hasRole('ROLE_USER')")
    @RequestMapping("/account/proceedChangePassword")
    public String proceedChangePassword(@Valid @ModelAttribute("validationPassword") ValidationPassword validationPassword, BindingResult bindingResult, Model model){
        User user= userDetailsService.findUserByUsername(userDetailsService.currentlyLoggedUser());
        String username = user.getUsername();
        String old = userDetailsService.encodePassword(validationPassword.getOldPassword());
        if(passwordEncoder.matches(validationPassword.getOldPassword(),user.getPassword())==false){
            model.addAttribute("fieldError", "Niepoprawne obecne hasło!");
            return "change-password-page";
        }
        else if(bindingResult.hasErrors()==false){
            model.addAttribute("successRegisterMessage", "Hasło zostało zmienione");
        }
        userDetailsService.changePassword(validationPassword.getNewPassword());
        return "change-password-page";

    }
    @RequestMapping("/adminManager/updateForm")
    public String userUpdateForm() {
        return null;
    }

    @RequestMapping("/adminManager/updateMessage")
    public String updateMessage() {
        return null;
    }
}
