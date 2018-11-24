package net.skhu.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import net.skhu.VO.Answer;

@Mapper
public interface AnswerMapper {

	Answer getAnswer(int id);

	void insert(Answer answer);
	void update(@Param("message") String message,@Param("id") int id);

}
