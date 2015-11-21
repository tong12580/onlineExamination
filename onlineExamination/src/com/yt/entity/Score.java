package com.yt.entity;
//得分
public class Score {
	private Integer scoreid;	
	private String subject;		//科目
	private String studentid;	//学号
	private String username;	//姓名
	private String score;		//分数
	
	public Integer getScoreid() {
		return scoreid;
	}
	public void setScoreid(Integer scoreid) {
		this.scoreid = scoreid;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getStudentid() {
		return studentid;
	}
	public void setStudentid(String studentid) {
		this.studentid = studentid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	
	
}
