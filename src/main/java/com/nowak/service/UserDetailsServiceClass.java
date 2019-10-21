package com.nowak.service;

import com.nowak.dao.AuthorityDao;
import com.nowak.dao.FormDao;
import com.nowak.dao.MessagesDao;
import com.nowak.dao.UserDao;
import com.nowak.db_entities.Authority;

import com.nowak.db_entities.Forms;
import com.nowak.db_entities.Messages;
import com.nowak.db_entities.User;
import com.nowak.validation.ValidationUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.util.Arrays;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class UserDetailsServiceClass implements UserDetailsService {

    @Autowired
    private UserDao userDao;

    @Autowired
    private AuthorityDao authorityDao;

    @Autowired
    private FormDao formDao;

    @Autowired
    private MessagesDao messagesDao;

    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    @Override
    @Transactional(value = "transactionManager", rollbackFor = java.lang.Exception.class)
    public User findUserByUsername(String username) {
        return userDao.findUser(username);
    }

    private Collection<SimpleGrantedAuthority> mapToAuthorities(Collection<Authority> authorities) {
        return authorities.stream().map(a -> new SimpleGrantedAuthority(a.getAuthority())).collect(Collectors.toList());
    }

    @Override
    @Transactional(value = "transactionManager", rollbackFor = java.lang.Exception.class, isolation = Isolation.READ_COMMITTED)
    public UserDetails loadUserByUsername(String usr) throws UsernameNotFoundException {
        User user = userDao.findUser(usr);
        if (user == null)
            throw new UsernameNotFoundException("User not exists.");
        return new org.springframework.security.core.userdetails.User(user.getUsername(), user.getPassword(), mapToAuthorities(user.getAuthority()));
    }

    @Override
    @Transactional(value = "transactionManager", rollbackFor = java.lang.Exception.class, isolation = Isolation.READ_COMMITTED)
    public void addUser(ValidationUser validationUser) {
        User user = new User();
        user.setUsername(validationUser.getUsername());
        user.setPassword(passwordEncoder.encode(validationUser.getPassword()));
        user.setEmail(validationUser.getEmail());
        System.out.println(user.getUsername()+" "+
        user.getPassword()+" "+
        user.getEmail());
        user.setAuthority(Arrays.asList(authorityDao.findAuthority("ROLE_USER")));
        userDao.addUser(user);
    }
    @Override
    public String encodePassword(String psw){
        return passwordEncoder.encode(psw);
    }

    @Override
    @Transactional
    public void changePassword(String password) {
        userDao.changePassword(passwordEncoder.encode(password));
    }

    @Override
    @Transactional
    public void updateUser(ValidationUser validationUser) {
        User user = new  User();
        user.setId(userDao.findUser(currentlyLoggedUser()).getId());
        user.setUsername(userDao.findUser(currentlyLoggedUser()).getUsername());
        user.setPassword(userDao.findUser(currentlyLoggedUser()).getPassword());
        user.setEmail(validationUser.getEmail());
        user.setPhone(validationUser.getPhone());
        user.setBirthDate(validationUser.getBirthDate());
        user.setAuthority(Arrays.asList(authorityDao.findAuthority("ROLE_USER")));
        userDao.updateUser(user);
    }


    @Transactional
    @Override
    public List<User> getUsers() {
        return userDao.getUsers();
    }

    @Transactional(isolation = Isolation.READ_COMMITTED)
    @Override
    public List<Forms> getForms() {
        return formDao.getForms();
    }

    @Override
    @Transactional(isolation = Isolation.READ_COMMITTED)
    public void addForm(Forms form) {
        formDao.addForm(form);
    }

    @Override
    @Transactional
    public String currentlyLoggedUser() {
        return userDao.currentlyLoggedUser();
    }


    @Override
    @Transactional
    public void addMessageToUser(Messages message, String username) {
        try {
            message.setDate(setCurrentDate());
            message.setUsername(findUserByUsername(currentlyLoggedUser()).getUsername());
            message.setRecipient(username);
        } catch (ParseException e) {
            e.printStackTrace();
        }
    }

    @Override
    @Transactional
    public void addMessage(Messages message) {
        try {
            message.setDate(setCurrentDate());
            message.setUsername(findUserByUsername(currentlyLoggedUser()).getUsername());
            message.setRecipient("admin");
        } catch (ParseException e) {
            e.printStackTrace();
        }
        messagesDao.addMessage(message);
    }

    @Override
    @Transactional
    public List<Messages> getMessages() {
        return messagesDao.getMessages();
    }

    @Override
    @Transactional
    public Messages getMessagebyId(int id) {
        return messagesDao.getMessagebyId(id);
    }

    @Override
    @Transactional
    public void deleteForm(int id) {
        formDao.deleteForm(id);
    }

    @Override
    @Transactional
    public void deleteUser(int id) {
        userDao.deleteUser(id);
    }

    @Override
    @Transactional
    public void deleteMessage(int id) {
        messagesDao.deleteMessage(id);
    }

    @Override
    @Transactional
    public List<Forms> getOnlyUserForms(String name) {
        return formDao.getOnlyUserForms(name);
    }

    @Override
    @Transactional
    public List<Messages> getOnlyUserMessages(String name) {
        return messagesDao.getOnlyUserMessages(name);
    }

    @Override
    @Transactional
    public User convertToUser(ValidationUser validationUser) {
        return userDao.convertToUser(validationUser);
    }

    @Override
    @Transactional
    public ValidationUser convertToValidationUser(User user) {
        return userDao.convertToValidationUser(user);
    }

    public Date setCurrentDate() throws ParseException {
        Date now = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String str = formatter.format(now);
        now = formatter.parse(str);
        return now;
    }
}
