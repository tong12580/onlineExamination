package com.yt.utils;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;

public class HibernateUtils {

	private static SessionFactory    sessionFactory =null;
	//连接数据库
	//获得工厂类对象
	//	SessionFactory该类获得session对象
	static{
		Configuration cfg=new Configuration().configure();
		//sessionFactory=cfg.buildSessionFactory();//(这是过时的Hibernate方法)
		ServiceRegistry  sr = new ServiceRegistryBuilder().applySettings(cfg.getProperties()).buildServiceRegistry();           
        sessionFactory  = cfg.buildSessionFactory(sr);  
	}

	/**
	 * Session:它是hibernate提供操作数据库的接口，该接口中有操作数据库的增删改查方法，所以要获得该接口
	 * @return
	 */
	public static  Session getSession(){
		return sessionFactory.openSession();
	}
	/**
	 * 关闭连接，释放资源
	 * @param session
	 */
	public static void closeSession(Session session){
		if(session!=null){
			session.close();
		}
	}


}
