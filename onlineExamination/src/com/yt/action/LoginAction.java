package com.yt.action;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.yt.service.LoginService;
import com.yt.service.LoginServiceImpI;

public class LoginAction implements Action{

	@Override
	public String execute() throws Exception {
		String studentid =ServletActionContext.getRequest().getParameter("studentid");
		String password =ServletActionContext.getRequest().getParameter("password");
		String power =ServletActionContext.getRequest().getParameter("power");
		LoginService ls=new LoginServiceImpI();
		String username=ls.login(studentid, password);
		String sp=ls.power(studentid, password);
		String sex=ls.sex(studentid, password);
		if(power!=null&&username!=null){
			if(power.equals(sp)&&power.equals("1")){
				ActionContext context=ActionContext.getContext();
				context.getSession().put("username", username);
				context.getSession().put("studentid", studentid);
				context.getSession().put("sex", sex);
				return LOGIN;
			}else if(power.equals(sp)&&power.equals("2")) {
				ActionContext context=ActionContext.getContext();
				context.getSession().put("username", username);
				return SUCCESS;
			}else {
				return ERROR;
			}
		}else {
			return ERROR;
		}
	}
}
