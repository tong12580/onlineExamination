package com.yt.action;

import java.util.*;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.yt.entity.Completion;
import com.yt.entity.MultipleChoice;
import com.yt.entity.Score;
import com.yt.entity.ShortAnswer;
import com.yt.service.PaperService;
import com.yt.service.PaperServiceImpI;

public class ChagerAction implements Action{
	public	PaperService paperService =new PaperServiceImpI();
	@Override
	public String execute() throws Exception {
	
		//将所选科目放入Session；
		String subject =ServletActionContext.getRequest().getParameter("subject");
		String username=(String) ActionContext.getContext().getSession().get("username"); 
		Score score=new Score();
		score.setUsername(username);
		score.setSubject(subject);
		PaperService paperService =new PaperServiceImpI();
		if(paperService.findPage(score)==true){
			ActionContext context=ActionContext.getContext();
			context.getSession().put("subject", subject);
			
			//定义一个0-2的随机数
			int math=(int)(Math.random()*3);
			String paper=null;
			//添加从数据库中查找到的数据
			if(math==0){
				List<MultipleChoice> list=new ArrayList<MultipleChoice>();
				MultipleChoice multipleChoice=new MultipleChoice();
				list= paperService.findAllPage(multipleChoice);
				context.getSession().put("list", list);
				paper="A";
				context.getSession().put("paper", paper);
			}else if(math==1){
				List<ShortAnswer> list=new ArrayList<ShortAnswer>();
				ShortAnswer shortAnswer=new ShortAnswer();
				list=paperService.findAllPage(shortAnswer);
				context.getSession().put("list", list);
				paper="B";
				context.getSession().put("paper",paper);
			}else if(math==2){
				List<Completion> list=new ArrayList<Completion>();
				Completion completion=new Completion();
				list=paperService.findAllPage(completion);
				context.getSession().put("list", list);
				paper="C";
				context.getSession().put("paper",paper);
			} 
			return SUCCESS;
		}else{
			return ERROR;
		}
	}
	
}
