package com.nowak.dao;

import com.nowak.db_entities.User;

public interface UserDao{

    void addUser(User user);
    User findUser(String username);
}
