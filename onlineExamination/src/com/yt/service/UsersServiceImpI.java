package com.yt.service;

import java.util.List;

import com.yt.dao.BaseDao;
import com.yt.dao.BaseDaoImpI;
import com.yt.entity.Users;

public class UsersServiceImpI implements UsersService {

	public BaseDao baseDao=new BaseDaoImpI();
	
	@Override
	public boolean saveUsers(Users users) {
		try {
			baseDao.saveObject(users);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public boolean updateUsers(Users users) {
		try {
			baseDao.updateObject(users);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public boolean deleteUsers(Users users) {
		try {
			baseDao.deleteObject(users);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Users> findWithPage(int page, int rows, Users users) {
		StringBuilder HQL=new StringBuilder("from Users where 1=1 ");
		if(!"".equals(users.getUsername())&&users.getUsername()!=null){
			HQL.append("  and   username like '%"+users.getUsername()+"%'");
		}
		if(!"".equals(users.getSex())&&users.getSex()!=null){
			HQL.append("  and   sex like '%"+users.getSex()+"%'");
		}
		if(!"".equals(users.getPower())&&users.getPower()!=null){
			HQL.append("  and   power like '%"+users.getPower()+"%'");
		}
		return (List<Users>) baseDao.findWithPage((Math.abs(page-1)*rows), rows,HQL.toString() );
	}

	@Override
	public int getRows() {
		Object object=baseDao.getObject("select count(*) from Users");
		long tempObject=(Long)object;
		return (int)tempObject;
	}

	@Override
	public Users getUsersInfo(String studentid) {
		return (Users)baseDao.getObject("from Users where studentid="+studentid);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Users> findWithPage(int page, int rows) {
		return (List<Users>) baseDao.findWithPage((Math.abs(page-1)*rows), rows,"from Users" );
	}

	@Override
	public boolean findUsersID(String studentid) {
		if(((Users)baseDao.getObject("from Users where studentid="+studentid))==null){
			return true;
		}else{
			return false;
		}
	}

}
