package com.yt.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;

import com.yt.utils.HibernateUtils;

public class BaseDaoImpI implements BaseDao {

	@Override
	public void saveObject(Object object) {
		Session session=HibernateUtils.getSession();
		try {
			session.getTransaction().begin();
			session.save(object);
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}finally{
			HibernateUtils.closeSession(session);
		}
	}

	@Override
	public void updateObject(Object object) {
		Session session=HibernateUtils.getSession();
		try {
			session.getTransaction().begin();
			session.update(object);
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}finally{
			HibernateUtils.closeSession(session);
		}
	}

	@Override
	public void deleteObject(Object object) {
		Session session=HibernateUtils.getSession();
		try {
			session.getTransaction().begin();
			session.delete(object);
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}finally{
			HibernateUtils.closeSession(session);
		}
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List<?> findWithPage(int page, int rows, String HQL) {
		Session session=HibernateUtils.getSession();
		List<?> list=new ArrayList();
		try {
			list=session.createQuery(HQL).setFirstResult(page).setMaxResults(rows).list();
		} catch (Exception e) {
			e.printStackTrace();
			
		}finally{
			HibernateUtils.closeSession(session);
		}
		return list;
	}

	@Override
	public Object getObject(String HQL) {
		Session session=HibernateUtils.getSession();
		Object obj=null;
		try {
			obj=session.createQuery(HQL).uniqueResult();
		} catch (Exception e) {
			e.printStackTrace();
			
		}finally{
			HibernateUtils.closeSession(session);
		}
		return obj;
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List<?> findAllInfo(String HQL) {
		List<?> list=new ArrayList();
		Session session=HibernateUtils.getSession();
		try {
			list=session.createQuery(HQL).list();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			HibernateUtils.closeSession(session);
		}
		return list;
	}

}
