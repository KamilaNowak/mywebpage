package com.nowak.dao;

import com.nowak.db_entities.Forms;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
public class FormDaoRepo implements FormDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<Forms> getForms() {
        Session session = sessionFactory.getCurrentSession();
        List<Forms> formsList = session.createQuery("from Forms").getResultList();
        return formsList;
    }

    @Override
    public void addForm(Forms form) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(form);
    }

    @Override
    public void deleteForm() {

    }
}
