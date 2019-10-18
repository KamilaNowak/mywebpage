package com.nowak.dao;

import com.nowak.db_entities.Forms;
import com.nowak.db_entities.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.hibernate.SessionFactory;
import org.hibernate.Session;
import org.hibernate.Query;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.NoResultException;
import java.util.List;

@Repository
@Transactional
public class UserDaoRepo implements UserDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public User findUser(String username) {
        Session session = sessionFactory.getCurrentSession();
        Query<User> findUserQuery = session.createQuery("from User  where username=:usernameToFind", User.class);
        findUserQuery.setParameter("usernameToFind", username);
        User searchUser = null;
        try {
            searchUser = findUserQuery.getSingleResult();
        } catch (NoResultException e) {
            e.printStackTrace();
        }
        return searchUser;
    }

    @Override
    public String currentlyLoggedUser() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String name = authentication.getName();
        return name;
    }

    @Override
    public void addUser(User user) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(user);
    }

    @Override
    public List<User> getUsers() {
        Session session=sessionFactory.getCurrentSession();
        List<User> userList = session.createQuery("select u from User u order by username").getResultList();
        return  userList;

    }
}
