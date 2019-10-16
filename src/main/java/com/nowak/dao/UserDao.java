package com.nowak.dao;

import com.nowak.db_entities.User;

import java.util.List;

public interface UserDao {

    public User findUser(String username);
    public void addUser(User user);
    List<User> getUsers();
}
