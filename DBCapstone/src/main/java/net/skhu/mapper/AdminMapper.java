package net.skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.VO.Admin;
import net.skhu.VO.CategoryChange;
import net.skhu.VO.CulturalRequire;
import net.skhu.VO.Department;
import net.skhu.VO.MajorRequire;

@Mapper
public interface AdminMapper {

	List<CategoryChange> getAllStatus0();
	CategoryChange getChangeOne(int id);
	int ChangeAllow(int id, String comment);
	int getRecordId(int id);
	int setCategoryException(int id, int num, String category);
	int ChangeReject(int id, String comment);
	List<Department> getAllDepartment();
	String getDepartmentName(int id);

	List<MajorRequire> getMajorRequire(int id);
	List<CulturalRequire> getCulturalRequire(int id);
	MajorRequire getMajorById(int id);
	int EditMajor(MajorRequire editMajor);
	int DeleteMajorById(int id);
	int InputMajor(MajorRequire inputMajor);
	MajorRequire CheckMajor(String year, String name, int departmentId);

	CulturalRequire CheckCul(String year, String name, int departmentId);
	int InputCul(CulturalRequire inputCul);
	int SetMajorTotalCultural(int id, int totalCultural);
	int SetMajorTotalCultural2(int totalCultural, String year, String name, int departmentId);
	CulturalRequire GetCulById(int id);
	int DeleteCulById(int id);
	int EditCul(CulturalRequire editCul);

	List<Admin> GetAdminList();
	int AddAdmin(Admin admin);
}

