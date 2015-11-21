package com.yt.service;

import java.util.List;

import com.yt.dao.BaseDao;
import com.yt.dao.BaseDaoImpI;
import com.yt.entity.Completion;
import com.yt.entity.MultipleChoice;
import com.yt.entity.ShortAnswer;

public class QuestionsServiceImpI implements QuestionsService {
	
	public BaseDao baseDao=new BaseDaoImpI();
	
	@Override
	public int getRows() {
		
		Object object=baseDao.getObject("select count(*) from MultipleChoice");
		long tempObject=(Long)object;
		return (int)tempObject;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<MultipleChoice> findWithPage(int page, int rows) {
		return (List<MultipleChoice>) baseDao.findWithPage((Math.abs(page-1)*rows), rows,"from MultipleChoice" );
	}

	@Override
	public boolean saveMultipleChoice(MultipleChoice multipleChoice) {
		try {
			baseDao.saveObject(multipleChoice);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public boolean updateMultipleChoice(MultipleChoice multipleChoice) {
		try {
			baseDao.updateObject(multipleChoice);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public boolean deleteMultipleChoice(MultipleChoice multipleChoice) {
		try {
			baseDao.deleteObject(multipleChoice);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<MultipleChoice> findWithPage(int page, int rows,
			MultipleChoice multipleChoice) {
		StringBuilder HQL=new StringBuilder("from MultipleChoice where 1=1 ");
		if(!"".equals(multipleChoice.getScore())&&multipleChoice.getScore()!=null){
			HQL.append("  and   score like '%"+multipleChoice.getScore()+"%'");
		}
		return (List<MultipleChoice>) baseDao.findWithPage((Math.abs(page-1)*rows), rows,HQL.toString() );
	}

	@Override
	public MultipleChoice getMultipleChoiceInfo(int id) {
		return (MultipleChoice)baseDao.getObject("from MultipleChoice where id="+id);
	}

	@Override
	public ShortAnswer getShortAnswerInfo(int id) {
		return (ShortAnswer)baseDao.getObject("from ShortAnswer where id="+id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ShortAnswer> findShortAnswerWithPage(int page, int rows,
			ShortAnswer shortAnswer) {
		StringBuilder HQL=new StringBuilder("from ShortAnswer where 1=1 ");
		if(!"".equals(shortAnswer.getScore())&&shortAnswer.getScore()!=null){
			HQL.append("  and   score like '%"+shortAnswer.getScore()+"%'");
		}
		return (List<ShortAnswer>) baseDao.findWithPage((Math.abs(page-1)*rows), rows,HQL.toString() );
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ShortAnswer> findShortAnswerWithPage(int page, int rows) {
		return (List<ShortAnswer>) baseDao.findWithPage((Math.abs(page-1)*rows), rows,"from ShortAnswer" );
	}

	@Override
	public boolean saveShortAnswer(ShortAnswer shortAnswer) {
		try {
			baseDao.saveObject(shortAnswer);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public boolean updateShortAnswer(ShortAnswer shortAnswer) {
		try {
			baseDao.updateObject(shortAnswer);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public boolean deleteShortAnswer(ShortAnswer shortAnswer) {
		try {
			baseDao.deleteObject(shortAnswer);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public Completion getCompletionInfo(int id) {
		return (Completion)baseDao.getObject("from Completion where id="+id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Completion> findCompletionWithPage(int page, int rows,
			Completion completion) {
		StringBuilder HQL=new StringBuilder("from Completion where 1=1 ");
		if(!"".equals(completion.getScore())&&completion.getScore()!=null){
			HQL.append("  and   score like '%"+completion.getScore()+"%'");
		}
		return (List<Completion>) baseDao.findWithPage((Math.abs(page-1)*rows), rows,HQL.toString() );
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Completion> findCompletionWithPage(int page, int rows) {
		return (List<Completion>) baseDao.findWithPage((Math.abs(page-1)*rows), rows,"from Completion" );
	}

	@Override
	public boolean saveCompletion(Completion completion) {
		try {
			baseDao.saveObject(completion);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public boolean updateCompletion(Completion completion) {
		try {
			baseDao.updateObject(completion);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public boolean deleteCompletion(Completion completion) {
		try {
			baseDao.deleteObject(completion);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public int getShortAnswerRows() {

		Object object=baseDao.getObject("select count(*) from ShortAnswer");
		long tempObject=(Long)object;
		return (int)tempObject;
	}

	@Override
	public int getCompletionRows() {
		Object object=baseDao.getObject("select count(*) from Completion");
		long tempObject=(Long)object;
		return (int)tempObject;
	}

}
