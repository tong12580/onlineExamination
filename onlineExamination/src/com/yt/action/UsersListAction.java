package com.yt.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.yt.entity.Users;
import com.google.gson.GsonBuilder;
import com.opensymphony.xwork2.Action;
import com.yt.service.UsersService;
import com.yt.service.UsersServiceImpI;

public class UsersListAction implements Action {
	private UsersService usersService=new UsersServiceImpI();
	@Override
	public String execute() throws Exception {
		
		ServletActionContext.getResponse().setCharacterEncoding("utf-8");
		String m=ServletActionContext.getRequest().getParameter("m");;
		int page=0,rows=0;
		//分页页码为int类型需要类型转换，并防止为空
		if(!"".equals(ServletActionContext.getRequest().getParameter("page"))&&ServletActionContext.getRequest().getParameter("page")!=null){
			page=Integer.parseInt(ServletActionContext.getRequest().getParameter("page"));
		}
		if(!"".equals(ServletActionContext.getRequest().getParameter("rows"))&&ServletActionContext.getRequest().getParameter("rows")!=null){
			rows=Integer.parseInt(ServletActionContext.getRequest().getParameter("rows"));
		}
		if("findWithPage".equals(m)){
			Map<String,Object> map=new HashMap<String,Object>();
			Users users=new Users();
			//从前台获取要查的用户名
			users.setUsername(ServletActionContext.getRequest().getParameter("uName"));
			users.setSex(ServletActionContext.getRequest().getParameter("uSex"));
			users.setPower(ServletActionContext.getRequest().getParameter("uPower"));
			List<Users>list=usersService.findWithPage(page, rows,users);
			map.put("rows", list); 								//记录的数据
			map.put("total", usersService.getRows());			//总共多少记录
			ServletActionContext.getResponse().getWriter().print(new GsonBuilder().create().toJson(map));
			ServletActionContext.getResponse().getWriter().flush();
			ServletActionContext.getResponse().getWriter().close();
		}else if ("saveUsersInfo".equals(m)) {
			Users users=new Users();
			users.setStudentid(ServletActionContext.getRequest().getParameter("studentid"));
			users.setUsername(ServletActionContext.getRequest().getParameter("username"));
			users.setPassword(ServletActionContext.getRequest().getParameter("password"));
			users.setSex(ServletActionContext.getRequest().getParameter("sex"));
			users.setPower(ServletActionContext.getRequest().getParameter("power"));
			users.setAdds(ServletActionContext.getRequest().getParameter("adds"));
			users.setMail(ServletActionContext.getRequest().getParameter("mail"));
			users.setTel(ServletActionContext.getRequest().getParameter("tel"));
			if(usersService.saveUsers(users)){
				ServletActionContext.getResponse().getWriter().print("true");
			}else{
				ServletActionContext.getResponse().getWriter().print("false");
			}
		}else if ("deleteUserInfoById".equals(m)) {
			Users users=new Users();
			//如果id为int还需判断是否非空并转码
			users.setStudentid(ServletActionContext.getRequest().getParameter("dId"));
			if(usersService.deleteUsers(users)){
				ServletActionContext.getResponse().getWriter().print("true");
			}else{
				ServletActionContext.getResponse().getWriter().print("false");
			}
		}else if("findUserInfoById".equals(m)){
			String id=null;
			//如果id为int还需判断是否非空并转码
			id=ServletActionContext.getRequest().getParameter("fId");
			ServletActionContext.getResponse().getWriter().print(new GsonBuilder().create().toJson(usersService.getUsersInfo(id)));
			ServletActionContext.getResponse().getWriter().flush();
			ServletActionContext.getResponse().getWriter().close();
		}else if("updateUserInfo".equals(m)){
			Users users=new Users();
			//如果id为int还需判断是否非空并转码
			users.setStudentid(ServletActionContext.getRequest().getParameter("studentid"));
			users.setUsername(ServletActionContext.getRequest().getParameter("username"));
			users.setPassword(ServletActionContext.getRequest().getParameter("password"));
			users.setSex(ServletActionContext.getRequest().getParameter("sex"));
			users.setPower(ServletActionContext.getRequest().getParameter("power"));
			users.setAdds(ServletActionContext.getRequest().getParameter("adds"));
			users.setMail(ServletActionContext.getRequest().getParameter("mail"));
			users.setTel(ServletActionContext.getRequest().getParameter("tel"));
			if(usersService.updateUsers(users)){
				ServletActionContext.getResponse().getWriter().print("true");
			}else{
				ServletActionContext.getResponse().getWriter().print("false");
			}
		}
		return null;
	}

}
