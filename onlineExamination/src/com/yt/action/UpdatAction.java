package com.yt.action;


import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.yt.entity.Users;
import com.yt.service.UsersService;
import com.yt.service.UsersServiceImpI;

public class UpdatAction implements Action{

	@Override
	public String execute() throws Exception {
		
	String username=(String) ActionContext.getContext().getSession().get("username");
	String studentid=(String) ActionContext.getContext().getSession().get("studentid");
	String sex=(String) ActionContext.getContext().getSession().get("sex");
	String password=ServletActionContext.getRequest().getParameter("pwd");
	String adds=ServletActionContext.getRequest().getParameter("adds");
	String mail=ServletActionContext.getRequest().getParameter("email");
	String tel=ServletActionContext.getRequest().getParameter("tel");
	
	Users users=new Users();
	users.setStudentid(studentid);
	users.setUsername(username);
	users.setSex(sex);
	users.setPassword(password);
	users.setAdds(adds);
	users.setMail(mail);
	users.setTel(tel);
	users.setPower("1");
	
	UsersService usersService=new UsersServiceImpI();
		if(usersService.updateUsers(users)==true){
			return SUCCESS;
		}else {
			return ERROR;
		}
		
	}

}
