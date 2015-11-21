package com.yt.action;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;
import com.yt.entity.Users;
import com.yt.service.UsersService;
import com.yt.service.UsersServiceImpI;

public class RegisterAction implements Action{

	@Override
	public String execute() throws Exception {
		
		String studentid=ServletActionContext.getRequest().getParameter("studentid");
		String username=ServletActionContext.getRequest().getParameter("username"); 
		String sex=ServletActionContext.getRequest().getParameter("sex");
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
		if(usersService.findUsersID(studentid)==true){
			if(usersService.saveUsers(users)==true){
				return SUCCESS;
			}else {
				return ERROR;
			}
		}else{
			return ERROR;
		}
	}
}
