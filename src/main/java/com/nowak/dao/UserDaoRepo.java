package com.nowak.dao;

import com.nowak.db_entities.User;
import org.springframework.stereotype.Repository;

@Repository
public class UserDaoRepo implements UserDao {
    public void addUser(User user) {

    }

    public User findUser(String username) {
        return null;
    }
}
