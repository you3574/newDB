package net.skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.VO.Replacement;

@Mapper
public interface SubjectMapper {

	List<Replacement> getReplacement(String studentId);

}
