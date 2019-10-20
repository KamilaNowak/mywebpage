package com.nowak.service;

import com.nowak.db_entities.Forms;
import com.nowak.db_entities.Messages;
import com.nowak.db_entities.User;
import com.nowak.validation.ValidationUser;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import java.util.List;

public interface UserDetailsService extends org.springframework.security.core.userdetails.UserDetailsService {

    User findUserByUsername(String username);

    List<User> getUsers();

    void addUser(ValidationUser validationUser);

    void updateUser(ValidationUser validationUser);

    List<Forms> getForms();

    void addForm(Forms form);

    String currentlyLoggedUser();

    void addMessage(Messages messages);

    List<Messages> getMessages();

    void deleteForm(int id);

    void deleteUser(int id);

    void deleteMessage(int id);

    List<Forms> getOnlyUserForms(String name);

    List<Messages> getOnlyUserMessages(String name);

    User convertToUser(ValidationUser validationUser);

    ValidationUser convertToValidationUser(User user);

    String encodePassword(String psw);

    void changePassword(String password);
}
