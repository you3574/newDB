package net.skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface StudentMapper {

	List<String> getAllstudentId();

}
