package net.skhu.mapper;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.VO.Answer;

@Mapper
public interface AnswerMapper {
	Answer getAnswer(int id);

}
