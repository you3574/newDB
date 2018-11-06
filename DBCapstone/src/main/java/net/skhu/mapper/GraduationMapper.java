package net.skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.VO.MajorConnect;
import net.skhu.VO.MajorRequire;

@Mapper
public interface GraduationMapper {

	List<MajorConnect> testList();
	List<MajorConnect> testList2();
	String getCode(int id);
	List<MajorRequire> getMajorRequire(String code);
	int majorInput(MajorRequire input);
	MajorRequire getMajorRequireById(int id);
	int editMajor(MajorRequire edit);
	void deleteMajor(int id);
}
