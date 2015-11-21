package com.yt.service;

import com.yt.dao.BaseDao;
import com.yt.dao.BaseDaoImpI;
import com.yt.entity.Users;

public class LoginServiceImpI implements LoginService {
	
	private BaseDao baseDao= new BaseDaoImpI();
	
	@Override
	public String login(String studentid, String password) {
		Users users=null;
		users=(Users) baseDao.getObject(" from Users where studentid='"+studentid+"'  and  password='"+password+"'");
		if(users!=null){
			return users.getUsername();
		}else{
			return null;
		}
	}
	@Override
	public String power(String studentid, String password){
		Users users=null;
		users=(Users) baseDao.getObject(" from Users where studentid='"+studentid+"'  and  password='"+password+"'");
		if(users!=null){
			return users.getPower();
		}else{
			return null;
		}
	}
	@Override
	public String sex(String studentid, String password) {
		Users users=null;
		users=(Users) baseDao.getObject(" from Users where studentid='"+studentid+"'  and  password='"+password+"'");
		if(users!=null){
			return users.getSex();
		}else{
			return null;
		}
	}
}
