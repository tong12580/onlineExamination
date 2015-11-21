package com.yt.action;

import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.yt.entity.Score;
import com.yt.service.PaperService;
import com.yt.service.PaperServiceImpI;

public class ReferAction implements Action {
	//从数据库中获取所有成绩查询方法
	@Override
	public String execute() throws Exception {
		Score score=new Score();
		String username=(String) ActionContext.getContext().getSession().get("username");
		score.setScore(username);
		PaperService paperService =new PaperServiceImpI();
		List<Score> arrayList=new ArrayList<Score>();
		arrayList= paperService.findAll(score);
		ActionContext context=ActionContext.getContext();
		context.getSession().put("arrayList", arrayList);
		return SUCCESS;
	}

}
