package com.yt.service;

import java.util.List;

import com.yt.entity.Completion;
import com.yt.entity.MultipleChoice;
import com.yt.entity.ShortAnswer;

public interface QuestionsService {
		//统计分页数
		int getRows();
		/*第一套题
		 * */
			//根据ID查询一条记录
			MultipleChoice getMultipleChoiceInfo(int id);
			//按条件分页试卷查询记录
			List<MultipleChoice> findWithPage(int page,int rows,MultipleChoice multipleChoice);
			//分页试卷查询所有记录
			List<MultipleChoice> findWithPage(int page,int rows);
			//保存一道试题
			boolean saveMultipleChoice(MultipleChoice multipleChoice);
			//更新一道试题
			boolean updateMultipleChoice(MultipleChoice multipleChoice);
			//删除一道试题
			boolean deleteMultipleChoice(MultipleChoice multipleChoice);
		/*第二套题
		 * */
			//统计分页数
			int getShortAnswerRows();
				//根据ID查询一条记录
				ShortAnswer getShortAnswerInfo(int id);
				//按条件分页试卷查询记录
				List<ShortAnswer> findShortAnswerWithPage(int page,int rows,ShortAnswer shortAnswer);
				//分页试卷查询所有记录
				List<ShortAnswer> findShortAnswerWithPage(int page,int rows);
				//保存一道试题
				boolean saveShortAnswer(ShortAnswer shortAnswer);
				//更新一道试题
				boolean updateShortAnswer(ShortAnswer shortAnswer);
				//删除一道试题
				boolean deleteShortAnswer(ShortAnswer shortAnswer);
		/*第三套题
		 * */
				//统计分页数
				int getCompletionRows();
				//根据ID查询一条记录
				Completion getCompletionInfo(int id);
				//按条件分页试卷查询记录
				List<Completion> findCompletionWithPage(int page,int rows,Completion completion);
				//分页试卷查询所有记录
				List<Completion> findCompletionWithPage(int page,int rows);
				//保存一道试题
				boolean saveCompletion(Completion completion);
				//更新一道试题
				boolean updateCompletion(Completion completion);
				//删除一道试题
				boolean deleteCompletion(Completion completion);
}
