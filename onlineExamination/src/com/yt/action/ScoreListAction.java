package com.yt.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.google.gson.GsonBuilder;
import com.opensymphony.xwork2.Action;
import com.yt.entity.Score;
import com.yt.service.PaperService;
import com.yt.service.PaperServiceImpI;

public class ScoreListAction implements Action {
	public PaperService paperService=new PaperServiceImpI();
	@Override
	public String execute() throws Exception {
		
		ServletActionContext.getResponse().setCharacterEncoding("utf-8");
		String m=ServletActionContext.getRequest().getParameter("m");;
		int page=0,rows=0;
		if(!"".equals(ServletActionContext.getRequest().getParameter("page"))&&ServletActionContext.getRequest().getParameter("page")!=null){
			page=Integer.parseInt(ServletActionContext.getRequest().getParameter("page"));
		}
		if(!"".equals(ServletActionContext.getRequest().getParameter("rows"))&&ServletActionContext.getRequest().getParameter("rows")!=null){
			rows=Integer.parseInt(ServletActionContext.getRequest().getParameter("rows"));
		}
		if("findWithPage".equals(m)){
			Map<String,Object> map=new HashMap<String,Object>();
			Score score=new Score();
			//从查询按钮获取参数
			score.setUsername(ServletActionContext.getRequest().getParameter("sName"));
			score.setSubject(ServletActionContext.getRequest().getParameter("sSubject"));
			List<Score>list=paperService.findWithPage(page, rows,score);
			map.put("rows", list); 								//记录的数据
			map.put("total", paperService.getRows());			//总共多少记录
			ServletActionContext.getResponse().getWriter().print(new GsonBuilder().create().toJson(map));
			ServletActionContext.getResponse().getWriter().flush();
			ServletActionContext.getResponse().getWriter().close();
		}
		return null;
	}

}
