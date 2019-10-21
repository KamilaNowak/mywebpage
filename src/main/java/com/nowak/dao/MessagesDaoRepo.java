package com.nowak.dao;

import com.nowak.db_entities.Messages;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import org.hibernate.query.Query;
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
    public void addMessageToUser(Messages message,String username) {
        Session session= sessionFactory.getCurrentSession();
        session.saveOrUpdate(message);
    }

    @Override
    public List<Messages> getMessages() {
        Session session=sessionFactory.getCurrentSession();
        List<Messages> list= session.createQuery("from Messages").getResultList();
        return list;
    }

    @Override
    public Messages getMessagebyId(int id) {
        Session session=sessionFactory.getCurrentSession();
        Query query = session.createQuery("select m from Messages m where id=:id");
        query.setParameter("id",id);
        Messages msg = (Messages) query.getSingleResult();
        return msg;
    }

    @Override
    public void deleteMessage(int id) {
        Session session=sessionFactory.getCurrentSession();
        Query query = session.createQuery("delete from Messages where id=:id");
        query.setParameter("id",id);
        query.executeUpdate();
    }

    @Override
    public List<Messages> getOnlyUserMessages(String name) {
        Session session= sessionFactory.getCurrentSession();
        Query query = session.createQuery("select m from Messages m where username=:name ");
        query.setParameter("name",name);
        List<Messages> messages = query.getResultList();
        return messages;
    }
}
