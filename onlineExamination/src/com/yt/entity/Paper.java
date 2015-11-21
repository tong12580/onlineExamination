package com.yt.entity;
	//试卷类
public class Paper {
	private Integer id ;				//试卷编码
	private String papername;			//试卷类型
	private String test_questions;		//试题
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getPapername() {
		return papername;
	}
	public void setPapername(String papername) {
		this.papername = papername;
	}
	public String getTest_questions() {
		return test_questions;
	}
	public void setTest_questions(String test_questions) {
		this.test_questions = test_questions;
	}
	
}
