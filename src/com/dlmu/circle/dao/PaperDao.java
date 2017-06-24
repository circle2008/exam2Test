package com.dlmu.circle.dao;

import com.dlmu.circle.model.Paper;
import com.dlmu.circle.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;

import java.util.List;

/**
 * Created by cf on 2017/4/8.
 */
public class PaperDao {
    public List<Paper> getPapers()throws Exception{
        Session session= HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        Query query=session.createQuery("from Paper ");
        List<Paper> paperList=(List<Paper>)query.list();
        session.getTransaction().commit();
        return paperList;

    }
    public Paper getPaper(String paperId) throws Exception{
        Session session= HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        Paper paper=(Paper) session.get(Paper.class,Integer.parseInt(paperId));
        session.getTransaction().commit();
        return paper;
    }
    public void paperDelete(Paper paper)throws Exception{
        Session session= HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        session.delete(paper);
        session.getTransaction().commit();
    }
    public void savePaper(Paper paper)throws Exception{
        Session session= HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        session.merge(paper);
        session.getTransaction().commit();
    }
}
