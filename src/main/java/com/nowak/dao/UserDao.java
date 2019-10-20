package com.nowak.dao;

import com.nowak.db_entities.User;
import com.nowak.validation.ValidationUser;

import java.util.List;

public interface UserDao {

    User findUser(String username);
    String currentlyLoggedUser();
    void addUser(User user);
    void changePassword(String password);
    void updateUser(User user);
    List<User> getUsers();
    void deleteUser(int id);
    User convertToUser(ValidationUser validationUser);
    ValidationUser convertToValidationUser(User user);
}
