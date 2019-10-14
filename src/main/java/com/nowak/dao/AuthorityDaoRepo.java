package com.nowak.dao;

import com.nowak.db_entities.Authority;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.NoResultException;

@Repository
@Transactional
public class AuthorityDaoRepo implements AuthorityDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public Authority findAuthority(String authorityToFind) {
        Session session = sessionFactory.getCurrentSession();
        Authority authority = null;
        Query<Authority> queryToFindAuthority = session.createQuery("from Authority where authority=:authorityToFind", Authority.class);
        queryToFindAuthority.setParameter("authorityToFind", authorityToFind);
        try {
            authority = queryToFindAuthority.getSingleResult();
        } catch (NoResultException e) {
            e.printStackTrace();
        }
        return authority;
    }
}
