package com.nowak.service;

import com.nowak.db_entities.User;
import com.nowak.validation.ValidationUser;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

public interface UserDetailsService extends org.springframework.security.core.userdetails.UserDetailsService {

    User findUserByUsername(String username);

    void addUser(ValidationUser validationUser);
}
