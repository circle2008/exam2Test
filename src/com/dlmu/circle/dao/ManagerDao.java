package com.dlmu.circle.dao;

import com.dlmu.circle.model.Manager;
import com.dlmu.circle.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 * Created by cf on 2017/4/11.
 */
public class ManagerDao {
    public Manager login(Manager manager)throws Exception{
        Session session= HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        Query query=session.createQuery("from Manager as m where m.userName=:userName and m.password=:password");

        query.setString("userName", manager.getUserName());
        query.setString("password", manager.getPassword());
        Manager resultMan=(Manager)query.uniqueResult();

        session.getTransaction().commit();
        return resultMan;
    }
}
