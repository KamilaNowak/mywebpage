package com.nowak.service;

import com.nowak.dao.AuthorityDao;
import com.nowak.dao.UserDao;
import com.nowak.db_entities.Authority;

import com.nowak.db_entities.User;
import com.nowak.validation.ValidationUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Arrays;
import java.util.Collection;
import java.util.stream.Collectors;

@Service

public class UserDetailsServiceClass implements UserDetailsService {

    @Autowired
    private UserDao userDao;

    @Autowired
    private AuthorityDao authorityDao;

    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    @Override
    @Transactional(value = "transactionManager", rollbackFor = java.lang.Exception.class)
    public User findUserByUsername(String username) {
        return userDao.findUser(username);
    }

    private Collection<SimpleGrantedAuthority> mapToAuthorities(Collection<Authority> authorities) {
        return authorities.stream().map(a-> new SimpleGrantedAuthority(a.getAuthority())).collect(Collectors.toList());
    }

    @Override
    @Transactional(value = "transactionManager", rollbackFor = java.lang.Exception.class)
    public UserDetails loadUserByUsername(String usr) throws UsernameNotFoundException {
        User user = userDao.findUser(usr);
        if(user==null)
            throw new UsernameNotFoundException("User not exists.");
        return new org.springframework.security.core.userdetails.User(user.getUsername(),user.getPassword(),mapToAuthorities(user.getAuthority()));
    }

    @Override
    @Transactional(value = "transactionManager", rollbackFor = java.lang.Exception.class)
    public void addUser(ValidationUser validationUser) {
        User user= new User();
        user.setUsername(validationUser.getUsername());
        user.setPassword(passwordEncoder.encode(validationUser.getPassword()));
        user.setEmail(validationUser.getPassword());
        user.setAuthority(Arrays.asList(authorityDao.findAuthority("ROLE_USER")));
        userDao.addUser(user);
    }
}
