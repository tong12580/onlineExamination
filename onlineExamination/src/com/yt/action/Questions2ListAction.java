package com.yt.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.google.gson.GsonBuilder;
import com.opensymphony.xwork2.Action;
import com.yt.entity.ShortAnswer;
import com.yt.service.QuestionsService;
import com.yt.service.QuestionsServiceImpI;

public class Questions2ListAction implements Action {
	public QuestionsService questionsService=new QuestionsServiceImpI();
	@Override
	public String execute() throws Exception {
		ServletActionContext.getResponse().setCharacterEncoding("utf-8");
		String m=ServletActionContext.getRequest().getParameter("m");
		int page=0,rows=0;
		if(!"".equals(ServletActionContext.getRequest().getParameter("page"))&&ServletActionContext.getRequest().getParameter("page")!=null){
			page=Integer.parseInt(ServletActionContext.getRequest().getParameter("page"));
		}
		if(!"".equals(ServletActionContext.getRequest().getParameter("rows"))&&ServletActionContext.getRequest().getParameter("rows")!=null){
			rows=Integer.parseInt(ServletActionContext.getRequest().getParameter("rows"));
		}
		if("findWithPage".equals(m)){
			Map<String,Object> map=new HashMap<String,Object>();
			ShortAnswer shortAnswer=new ShortAnswer();
			
			shortAnswer.setScore(ServletActionContext.getRequest().getParameter("qScore"));
			List<ShortAnswer>list=questionsService.findShortAnswerWithPage(page, rows,shortAnswer);
			map.put("rows", list); 								//记录的数据
			map.put("total", questionsService.getShortAnswerRows());			//总共多少记录
			ServletActionContext.getResponse().getWriter().print(new GsonBuilder().create().toJson(map));
			ServletActionContext.getResponse().getWriter().flush();
			ServletActionContext.getResponse().getWriter().close();
		}else if ("saveQusetionsInfo".equals(m)) {
			ShortAnswer shortAnswer=new ShortAnswer();
			shortAnswer.setContent(ServletActionContext.getRequest().getParameter("content"));
			shortAnswer.setA(ServletActionContext.getRequest().getParameter("a"));
			shortAnswer.setB(ServletActionContext.getRequest().getParameter("b"));
			shortAnswer.setC(ServletActionContext.getRequest().getParameter("c"));
			shortAnswer.setD(ServletActionContext.getRequest().getParameter("d"));
			shortAnswer.setAnswer(ServletActionContext.getRequest().getParameter("answer"));
			shortAnswer.setScore(ServletActionContext.getRequest().getParameter("score"));
			if(questionsService.saveShortAnswer(shortAnswer)){
				ServletActionContext.getResponse().getWriter().print("true");
			}else{
				ServletActionContext.getResponse().getWriter().print("false");
			}
		}else if("findQusetionsInfoById".trim().equals(m)){
			int id=0;
			//如果id为int还需判断是否非空并转码
			if(!"".equals(ServletActionContext.getRequest().getParameter("fId"))&&ServletActionContext.getRequest().getParameter("fId")!=null){
				id=Integer.parseInt(ServletActionContext.getRequest().getParameter("fId"));
			}
			ServletActionContext.getResponse().getWriter().print(new GsonBuilder().create().toJson(questionsService.getShortAnswerInfo(id)));
			ServletActionContext.getResponse().getWriter().flush();
			ServletActionContext.getResponse().getWriter().close();
		}else if("updateQuestionsInfo".equals(m)){
			ShortAnswer shortAnswer=new ShortAnswer();
			//如果id为int还需判断是否非空并转码
			int id=0;
			if(!"".equals(ServletActionContext.getRequest().getParameter("id"))&&ServletActionContext.getRequest().getParameter("id")!=null){
				id=Integer.parseInt(ServletActionContext.getRequest().getParameter("id"));
			}
			shortAnswer.setId(id);
			shortAnswer.setContent(ServletActionContext.getRequest().getParameter("content"));
			shortAnswer.setA(ServletActionContext.getRequest().getParameter("a"));
			shortAnswer.setB(ServletActionContext.getRequest().getParameter("b"));
			shortAnswer.setC(ServletActionContext.getRequest().getParameter("c"));
			shortAnswer.setD(ServletActionContext.getRequest().getParameter("d"));
			shortAnswer.setAnswer(ServletActionContext.getRequest().getParameter("answer"));
			shortAnswer.setScore(ServletActionContext.getRequest().getParameter("score"));
			if(questionsService.updateShortAnswer(shortAnswer)){
				ServletActionContext.getResponse().getWriter().print("true");
			}else{
				ServletActionContext.getResponse().getWriter().print("false");
			}
		}else if ("deleteQuestionsInfoById".equals(m)) {
			ShortAnswer shortAnswer=new ShortAnswer();
			//如果id为int还需判断是否非空并转码
			int id=0;
			if(!"".equals(ServletActionContext.getRequest().getParameter("dId"))&&ServletActionContext.getRequest().getParameter("dId")!=null){
				id=Integer.parseInt(ServletActionContext.getRequest().getParameter("dId"));
			}
			shortAnswer.setId(id);
			if(questionsService.deleteShortAnswer(shortAnswer)){
				ServletActionContext.getResponse().getWriter().print("true");
			}else{
				ServletActionContext.getResponse().getWriter().print("false");
			}
		}
		return null;
	}

}
