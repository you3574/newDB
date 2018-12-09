package net.skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.VO.CategoryChange;

@Mapper
public interface AdminMapper {

	List<CategoryChange> getAllStatus0();
	CategoryChange getChangeOne(int id);
	int ChangeAllow(int id, String comment);
	int getRecordId(int id);
	int setCategoryException(int id, int num, String category);
	int ChangeReject(int id, String comment);
}
