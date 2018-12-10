package net.skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import net.skhu.VO.Admin;
import net.skhu.VO.CategoryChange;
import net.skhu.VO.CulturalRequire;
import net.skhu.VO.Department;
import net.skhu.VO.MajorRequire;
import net.skhu.VO.Replacement;

@Mapper
public interface AdminMapper {

	List<CategoryChange> getAllStatus0();
	CategoryChange getChangeOne(@Param("id")int id);
	int ChangeAllow(@Param("id") int id, @Param("comment") String comment);
	int getRecordId(@Param("id")int id);
	int setCategoryException(@Param("id")int id,@Param("num") int num, @Param("category")String category);
	int ChangeReject(@Param("id")int id, @Param("comment")String comment);
	List<Department> getAllDepartment();
	String getDepartmentName(@Param("id")int id);

	List<MajorRequire> getMajorRequire(@Param("id")int id);
	List<CulturalRequire> getCulturalRequire(@Param("id")int id);
	MajorRequire getMajorById(@Param("id")int id);
	int EditMajor(MajorRequire editMajor);
	int DeleteMajorById(@Param("id")int id);
	int InputMajor(MajorRequire inputMajor);
	MajorRequire CheckMajor(@Param("year")String year,@Param("name") String name, @Param("departmentId")int departmentId);

	CulturalRequire CheckCul(@Param("year")String year,@Param("name") String name,@Param("departmentId") int departmentId);
	int InputCul(CulturalRequire inputCul);
	int SetMajorTotalCultural(@Param("id")int id,@Param("totalCultural") int totalCultural);
	int SetMajorTotalCultural2(@Param("totalCultural")int totalCultural,@Param("year") String year,@Param("name") String name,@Param("departmentId") int departmentId);
	CulturalRequire GetCulById(@Param("id")int id);
	int DeleteCulById(@Param("id")int id);
	int EditCul(CulturalRequire editCul);

	List<Admin> GetAdminList();
	int AddAdmin(Admin admin);
	List<Replacement> ReplaceList(@Param("departmentId")int departmentId);
	int ReplacementInput(Replacement replace);
	Replacement ReplacementEdit(@Param("id")int id);
	int ReplaceDelete(@Param("id")int id);
	int ReplaceEdit(Replacement replace);
}

