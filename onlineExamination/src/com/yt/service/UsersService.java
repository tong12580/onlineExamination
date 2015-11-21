package com.yt.service;

import java.util.List;

import com.yt.entity.Users;

public interface UsersService {
	
	boolean saveUsers(Users users);
	
	boolean  updateUsers(Users users);
	
	boolean  deleteUsers(Users users);
	
	//有条件分页查询
	List<Users>  findWithPage(int page,int rows,Users users);
	
	//统计分页数
	int getRows();
	
	//根据id查询一个用户
	Users getUsersInfo(String studentid);
	//无条件分页查询
	List<Users>  findWithPage(int page,int rows);
	//根据id查询一个用户是否存在
	boolean findUsersID(String studentid);
}
