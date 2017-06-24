package com.dlmu.circle.util;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;

/**
 * Created by cf on 2017/4/8.
 */
public class HibernateUtil {
    private static final SessionFactory sessionFactory=buildSessionFactory();
    private static SessionFactory buildSessionFactory(){
        Configuration configuration=new Configuration().configure();
        ServiceRegistry serviceRegistry=new ServiceRegistryBuilder().applySettings(configuration.getProperties()).buildServiceRegistry();
        return configuration.buildSessionFactory(serviceRegistry);
    }

    public static SessionFactory getSessionFactory(){
        return sessionFactory;
    }

    public static void main(String[] args) {
        HibernateUtil.getSessionFactory();
    }
}
