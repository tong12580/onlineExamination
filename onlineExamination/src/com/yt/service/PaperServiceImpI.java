package com.yt.service;

import java.util.List;

import com.yt.dao.BaseDao;
import com.yt.dao.BaseDaoImpI;
import com.yt.entity.Completion;
import com.yt.entity.MultipleChoice;
import com.yt.entity.Score;
import com.yt.entity.ShortAnswer;


public class PaperServiceImpI implements PaperService {
	BaseDao baseDao=new BaseDaoImpI();
	@SuppressWarnings("unchecked")
	@Override
	public List<MultipleChoice> findAllPage(MultipleChoice multipleChoice) {
		StringBuilder HQL=new StringBuilder("from MultipleChoice where 1=1 ");
		return (List<MultipleChoice>) baseDao.findAllInfo(HQL.toString());
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Score> findAll(Score score) {
		StringBuilder HQL=new StringBuilder("from Score where 1=1 ");
		if(!"".equals(score.getUsername())&&score.getUsername()!=null){
			HQL.append("  and   username like '%"+score.getUsername()+"%'");
		}
		return (List<Score>) baseDao.findAllInfo(HQL.toString());
	}
	
	@Override
	public String getMultipleChoiceID(int id) {
		MultipleChoice multipleChoice=(MultipleChoice)baseDao.getObject("from MultipleChoice where id="+id);
		if(multipleChoice!=null){
			return multipleChoice.getAnswer();
		}else{
			return null;
		}
		
	}
	@Override
	public boolean saveScore(Score score) {
		try {
			baseDao.saveObject(score);
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	@Override
	public String getSubject(String subject) {
		Score score=(Score)baseDao.getObject("from MultipleChoice where subject="+subject);
		if(score!=null){
			return score.getScore();
		}else{
			return null;
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Score> findWithPage(int page, int rows) {
		
		return(List<Score>) baseDao.findWithPage((Math.abs(page-1)*rows), rows,"from Score" );
	}

	@Override
	public int getRows() {
		Object object=baseDao.getObject("select count(*) from Score");
		long tempObject=(Long)object;
		return (int)tempObject;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Score> findWithPage(int page, int rows, Score score) {
		StringBuilder HQL=new StringBuilder("from Score where 1=1 ");
		if(!"".equals(score.getUsername())&&score.getUsername()!=null){
			HQL.append("  and   username like '%"+score.getUsername()+"%'");
		}
		if(!"".equals(score.getSubject())&&score.getSubject()!=null){
			HQL.append("  and   Subject like '%"+score.getSubject()+"%'");
		}
		return(List<Score>) baseDao.findWithPage((Math.abs(page-1)*rows), rows,HQL.toString() );
	}

	@Override
	public String getMultipleChoiceScore(int id) {
		MultipleChoice multipleChoice=(MultipleChoice)baseDao.getObject("from MultipleChoice where id="+id);
		if(multipleChoice!=null){
			return multipleChoice.getScore();
		}else{
			return null;
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ShortAnswer> findAllPage(ShortAnswer shortAnswer) {
		StringBuilder HQL=new StringBuilder("from ShortAnswer where 1=1 ");
		return (List<ShortAnswer>) baseDao.findAllInfo(HQL.toString());
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Completion> findAllPage(Completion completion) {
		StringBuilder HQL=new StringBuilder("from Completion where 1=1 ");
		return (List<Completion>) baseDao.findAllInfo(HQL.toString());
	}


	@Override
	public boolean findPage(Score score) {
		StringBuilder HQL=new StringBuilder("from Score where 1=1 ");
		if(!"".equals(score.getUsername())&&score.getUsername()!=null){
			HQL.append("  and   username like '%"+score.getUsername()+"%'");
		}
		if(!"".equals(score.getSubject())&&score.getSubject()!=null){
			HQL.append("  and   Subject like '%"+score.getSubject()+"%'");
		}
		if ((Score) baseDao.getObject(HQL.toString())==null){
			return true;
		}else {
			return false;
		}
	}

	@Override
	public String getShortAnswerID(int id) {
		ShortAnswer shortAnswer=(ShortAnswer)baseDao.getObject("from ShortAnswer where id="+id);
		if(shortAnswer!=null){
			return shortAnswer.getAnswer();
		}else{
			return null;
		}
	}

	@Override
	public String getCompletionID(int id) {
		Completion completion=(Completion)baseDao.getObject("from Completion where id="+id);
		if(completion!=null){
			return completion.getAnswer();
		}else{
			return null;
		}
	}

	@Override
	public String getShortAnswerScore(int id) {
		ShortAnswer shortAnswer=(ShortAnswer)baseDao.getObject("from ShortAnswer where id="+id);
		if(shortAnswer!=null){
			return shortAnswer.getScore();
		}else{
			return null;
		}
	}

	@Override
	public String getCompletionScore(int id) {
		Completion completion=(Completion)baseDao.getObject("from Completion where id="+id);
		if(completion!=null){
			return completion.getScore();
		}else{
			return null;
		}
	}
}
