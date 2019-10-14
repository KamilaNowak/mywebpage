package com.nowak.dao;

import com.nowak.db_entities.User;

public interface UserDao {

    public User findUser(String username);
    public void addUser(User user);
}
