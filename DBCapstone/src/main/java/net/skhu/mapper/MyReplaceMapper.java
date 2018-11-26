package net.skhu.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.VO.MyReplace;

@Mapper
public interface MyReplaceMapper {

	int insertreplace(Map<String, Object> map);

	List<MyReplace> getAllreplace(String studentId);

}
