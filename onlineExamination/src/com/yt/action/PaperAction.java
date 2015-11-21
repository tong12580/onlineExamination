package com.yt.action;



import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.yt.entity.Score;
import com.yt.service.PaperService;
import com.yt.service.PaperServiceImpI;


public class PaperAction implements Action{
	public PaperService paperService =new PaperServiceImpI();
	public int socer(){
			int socer=0;
			String answer=null;
			String paperID=(String) ActionContext.getContext().getSession().get("paper");
			for(int i=0;i<21;i++){
			String s=ServletActionContext.getRequest().getParameter(""+i);
			if(paperID.equals("A")){
				 answer= paperService.getMultipleChoiceID(i);	//调用根据ID查题目答案
					if(s!=null&&s.equals(answer)){
						int as=Integer.parseInt(paperService.getMultipleChoiceScore(i));	//调用根据ID查题目分值
						socer=socer+as;
						ActionContext context=ActionContext.getContext();
						context.getSession().put("socer", socer);	
					}else{
						ActionContext context=ActionContext.getContext();
						context.getSession().put("socer", socer);
					} 
			}else if(paperID.equals("B")) {
				 answer=paperService.getShortAnswerID(i);
					if(s!=null&&s.equals(answer)){
						int as=Integer.parseInt(paperService.getShortAnswerScore(i));	//调用根据ID查题目分值
						socer=socer+as;
						ActionContext context=ActionContext.getContext();
						context.getSession().put("socer", socer);	
					}else{
						ActionContext context=ActionContext.getContext();
						context.getSession().put("socer", socer);
					}
			}else if(paperID.equals("c")){
				answer=paperService.getCompletionID(i);
				if(s!=null&&s.equals(answer)){
					int as=Integer.parseInt(paperService.getCompletionScore(i));	//调用根据ID查题目分值
					socer=socer+as;
					ActionContext context=ActionContext.getContext();
					context.getSession().put("socer", socer);	
				}else{
					ActionContext context=ActionContext.getContext();
					context.getSession().put("socer", socer);
				}
			}
		}
			return socer;
	}
	@Override
	public String execute() throws Exception {
		int socer = this.socer();
			ActionContext context=ActionContext.getContext();
			context.getSession().put("socer", socer);
			
			String username=(String) ActionContext.getContext().getSession().get("username");
			String studentid=(String) ActionContext.getContext().getSession().get("studentid");
			String subject =(String) ActionContext.getContext().getSession().get("subject");
			
			Score sc=new Score();	
			sc.setScore(""+socer);
			sc.setStudentid(studentid);
			sc.setSubject(subject);
			sc.setUsername(username);
			
			PaperService paperService =new PaperServiceImpI();
			if(paperService.saveScore(sc)==true){
					
				return SUCCESS;	
			}else{
				
				return SUCCESS;
			}
	}
}
