package com.yt.dao;

import java.util.List;

public interface BaseDao {
	
	//保存一个对象
	void saveObject(Object object);
	
	//更新一个对象
	void updateObject(Object object);
	
	//删除一个对象
	void  deleteObject(Object object);
	
	//分页查询全部
	List<?>  findWithPage(int page,int rows, String HQL);
	
	//查询一条数据
	Object getObject(String HQL);
	
	//查询全部数据
	List<?>findAllInfo(String HQL);
}
