package com.nowak.dao;

import com.nowak.db_entities.User;

import java.util.List;

public interface UserDao {

    User findUser(String username);
    String currentlyLoggedUser();
    void addUser(User user);
    List<User> getUsers();
    void deleteUser(int id);
}
