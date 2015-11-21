package com.yt.service;

import java.util.List;

import com.yt.entity.Completion;
import com.yt.entity.MultipleChoice;
import com.yt.entity.Score;
import com.yt.entity.ShortAnswer;


public interface PaperService {

	//试卷1查询所有记录
	List<MultipleChoice> findAllPage(MultipleChoice multipleChoice);
	//试卷2查询所有记录
	List<ShortAnswer> findAllPage(ShortAnswer shortAnswer);
	//试卷3查询所有记录
	List<Completion> findAllPage(Completion completion);
	//根据MultipleChoice试题id查答案
	String getMultipleChoiceID(int id);
	//根据ShortAnswer试题id查答案
	String getShortAnswerID(int id);
	//根据ShortAnswer试题id查答案
		String getCompletionID(int id);
	//根据MultipleChoice试题id查分数
	String getMultipleChoiceScore(int id);
	//根据MultipleChoice试题id查分数
	String getShortAnswerScore(int id);
	//根据MultipleChoice试题id查分数
	String getCompletionScore(int id);
	//根据考试科目查询一条记录
	String getSubject(String subject);
	//查询所有成绩记录
	List<Score> findAll(Score score);
	//更新一个用户分数
	boolean saveScore(Score score);
	//统计分页数（成绩）
	int getRows();
	//分页查询所以记录
	List<Score>  findWithPage(int page,int rows);
	//按条件分页查询
	List<Score>  findWithPage(int page,int rows,Score score);
	//不分条件页查询
	boolean findPage(Score score);
	
}
