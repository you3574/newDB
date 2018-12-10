package net.skhu.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import net.skhu.VO.CategoryChange;
import net.skhu.VO.CulturalRequire;
import net.skhu.VO.MajorRequire;
import net.skhu.VO.MyCourseRecord;
import net.skhu.VO.Student;

@Mapper
public interface StudentMapper {


	List<Student> getAllstudent();

	//학생 테이블에 존재하는 모든 학생의 학번만을 조회
	List<String> getAllstudentId();

	//학생의 기본키를 가지고 해당 학생 한 명을 조회하여 그 객체 반환
	Student getAStudent(int id);

	//학생의 학번을 가지고  해당 학생 한 명을 조회하여 그 객체 반환
	Student findByStudentId(int studentId);

	String getStudentName(String studentId);
	String getStudentDepartment(String studentId);
	//
	//	//학생 테이블에 존재하는 모든 학생의 객체들을 반환
	//	List<Student> findAll();
	//
	//	//학생 객체를 학생 테이블에 추가
	//	void insert(Student student);
	//
	//	//학생테이블에 존재하는 학생 정보 수정
	//	void update(Student student);
	//
	//	//해당 id의 학생 정보 삭제
	//	void delete(int id);

	List<MyCourseRecord> getStudentRecord(@Param("studentId")String studentId);
	List<MyCourseRecord> getStudentRecordPass(@Param("studentId")String studentId);
	String getMajorCourseName(MyCourseRecord record);
	String getCulturalCourseName(MyCourseRecord record);
	String getTableName(final String condition,@Param("departId") int departId,@Param("year") String year);
	String getCode(final String condition,@Param("departId") int departId,@Param("year") String year);
	MajorRequire getMajorRequire(@Param("year") String year, @Param("course") String course,@Param("departmentId") int departmentId);

	String getMajorName(Map<String, Object> map);
	String getMajorName2(Map<String, Object> map);

	String getMajorCourseName2(@Param("courseId")String courseId, @Param("year")int year, @Param("semester")String semester, @Param("departmentId")int departmentId);
	String getMajorRequireCourseName(@Param("courseId")String courseId,@Param("year") int year, @Param("semester")String semester,@Param("departmentId") int departmentId);
	String getDoubleCourseName(MyCourseRecord record, @Param("departmentId")int departmentId);

	//String getCulturalTableName(final String condition, int departId, String year);
	//String getCulturalCode(final String condition, int departId, String year);
	CulturalRequire getCulturalRequire(@Param("year") String year,@Param("course") String course,@Param("departmentId") int departmentId);

	int deleteStudentRecord(@Param("studentId")String studentId);

	Integer getRecordId(@Param("recordId")int recordId);
	int setCategotyChange(CategoryChange categoryChange);
	List<CategoryChange> getStatus0(@Param("studentId")String studentId);
	List<CategoryChange> getStatus1(@Param("studentId")String studentId);
	List<CategoryChange> getStatus2(@Param("studentId")String studentId);

	int updateUser1(@Param("departmentId")int departmentId, @Param("course")String course, @Param("studentId")String studentId);
	int updateUser2(@Param("departmentId")int departmentId, @Param("course")String course,@Param("anotherMajorDepart") int anotherMajorDepart,@Param("studentId") String studentId, @Param("semester")int semester);
	int SetPassOne(@Param("studentId")String studentId);
}

