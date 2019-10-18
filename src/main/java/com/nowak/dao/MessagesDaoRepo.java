package com.nowak.dao;

import com.nowak.db_entities.Messages;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

@Repository
@Transactional
public class MessagesDaoRepo implements MessagesDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void addMessage(Messages message) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(message);
    }

    @Override
    public List<Messages> getMessages() {
        Session session=sessionFactory.getCurrentSession();
        List<Messages> list= session.createQuery("from Messages").getResultList();
        return list;
    }
}
