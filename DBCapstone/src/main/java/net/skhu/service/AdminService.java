package net.skhu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.skhu.VO.Admin;
import net.skhu.VO.CategoryChange;
import net.skhu.VO.CulturalRequire;
import net.skhu.VO.Department;
import net.skhu.VO.MajorRequire;
import net.skhu.mapper.AdminMapper;

@Service
public class AdminService {

	private static final String A = "전필";
	private static final String B = "전선";
	private static final String C = "교필";
	private static final String D = "교선";
	private static final String E = "복필";
	private static final String F = "복선";
	private static final String G = "부필";
	private static final String H = "부선";

	//@Autowired
	//private GraduationMapper graduationMapper;

	@Autowired
	private AdminMapper adminMapper;

	/*
	public List<MajorConnect> testList(){
		return graduationMapper.testList();
	}

	public List<MajorConnect> testList2(){
		return graduationMapper.testList2();
	}

	public String getCode(int id) {
		return graduationMapper.getCode(id);
	}

	public List<MajorRequire> getMajorRequire(String code){
		return graduationMapper.getMajorRequire(code);
	}

	public int majorInput(MajorRequire input) {
		return graduationMapper.majorInput(input);
	}

	public MajorRequire getMajorRequireById(int id) {
		return graduationMapper.getMajorRequireById(id);
	}

	public int editMajor(MajorRequire edit) {
		return graduationMapper.editMajor(edit);
	}

	public void deleteMajor(int id) {
		graduationMapper.deleteMajor(id);
	}
	 */

	public List<CategoryChange> getAllStatus0(){
		return adminMapper.getAllStatus0();
	}

	public CategoryChange getChangeOne(int id) {
		return adminMapper.getChangeOne(id);
	}

	@Transactional(rollbackFor={Exception.class})
	public boolean ChangeAllow(int id, String changeCategory, String comment) throws Exception {

		//해당 id 로 category 테이블에서 status 변경하기, comment 변경하기
		int num1 = adminMapper.ChangeAllow(id, comment);
		int num2;
		//record 가저옴
		int recordId = adminMapper.getRecordId(id);

		//my_course_record 에서 카테고리랑 exception 변경해주기
		if(changeCategory.equals(A)) {
			num2 = adminMapper.setCategoryException(recordId, 1,A);
		}else if(changeCategory.equals(B)) {
			num2 = adminMapper.setCategoryException(recordId, 2,B);
		}else if(changeCategory.equals(C)) {
			num2 = adminMapper.setCategoryException(recordId,3 ,C);
		}else if(changeCategory.equals(D)) {
			num2 = adminMapper.setCategoryException(recordId, 4,D);
		}else if(changeCategory.equals(E)) {
			num2 = adminMapper.setCategoryException(recordId, 5,E);
		}else if(changeCategory.equals(F)) {
			num2 = adminMapper.setCategoryException(recordId,6 ,F);
		}else if(changeCategory.equals(G)) {
			num2 = adminMapper.setCategoryException(recordId,7,G);
		}else {
			num2 = adminMapper.setCategoryException(recordId, 8,H);
		}

		if(num1==0 || num2==0)
			throw new Exception();

		if(num1>0 && num2>0)
			return true;
		else
			return false;
	}

	public boolean ChangeReject(int id, String comment) throws Exception {

		int num1 = adminMapper.ChangeReject(id, comment);
		if(num1>0)
			return true;
		else
			return false;
	}

	public List<Department> getAllDepartment(){
		return adminMapper.getAllDepartment();
	}

	public List<MajorRequire> getMajorRequire(int id){
		return adminMapper.getMajorRequire(id);
	}

	public List<CulturalRequire> getCulturalRequire(int id){
		return adminMapper.getCulturalRequire(id);
	}

	public MajorRequire getMajorById(int id) {
		return adminMapper.getMajorById(id);
	}

	public boolean EditMajor(MajorRequire editMajor) throws Exception {
		MajorRequire temp = adminMapper.CheckMajor(editMajor.getYear(), editMajor.getName(), editMajor.getDepartmentId());

		if(temp==null) {
			System.out.println("수정합니다.");
			int num = adminMapper.EditMajor(editMajor);
			if(num>0)
				return true;
			else
				return false;
		}else {
			throw new Exception("해당 졸업 요건이 중복입니다.");
		}


	}

	public boolean DeleteMajorById(int id) {
		int num = adminMapper.DeleteMajorById(id);
		if(num>0)
			return true;
		else
			return false;
	}

	public boolean DeleteCulById(int id) {
		int num = adminMapper.DeleteCulById(id);
		if(num>0)
			return true;
		else
			return false;
	}

	public String getDepartmentName(int id) {
		return adminMapper.getDepartmentName(id);
	}

	public boolean InputMajor(MajorRequire inputMajor) {
		System.out.println(inputMajor.getYear());
		System.out.println(inputMajor.getName());
		MajorRequire temp = adminMapper.CheckMajor(inputMajor.getYear(), inputMajor.getName(), inputMajor.getDepartmentId());

		if(temp==null) {
			System.out.println("입력합니다.");
			int num = adminMapper.InputMajor(inputMajor);
			if(num>0)
				return true;
			else
				return false;
		}else {
			System.out.println("해당 졸업 요건이 있습니다.");
			return false;
		}
	}

	public boolean InputCul(CulturalRequire inputCul) throws Exception{

		//해당 이름의 전공이 있나 먼저 확인->있어야 한다 MajorRequire checkMajor
		MajorRequire temp1 = adminMapper.CheckMajor(inputCul.getYear(), inputCul.getName(), inputCul.getDepartmentId());
		if(temp1 == null) {
			throw new Exception("먼저 전공 과목을 설정하세요.");
		}else {
			//해당 이름의 교양이 있나 확인
			CulturalRequire temp2 = adminMapper.CheckCul(inputCul.getYear(), inputCul.getName(), inputCul.getDepartmentId());
			if(temp2 != null) {
				throw new Exception("해당 교양 조건이 이미 존재합니다.");
			}else {
				int num1 = adminMapper.InputCul(inputCul);
				int num2 = adminMapper.SetMajorTotalCultural(temp1.getId(), inputCul.getTotalCultural());
				if(num1>0 && num2>0)
					return true;
				else
					return false;
			}
		}

	}

	public boolean EditCul(CulturalRequire editCul) throws Exception{

		System.out.println("수정합니다.");
		int num1 = adminMapper.EditCul(editCul);
		System.out.println(editCul.getTotalCultural()); //0
		System.out.println(editCul.getYear()); //null
		System.out.println(editCul.getName()); //전공기초
		System.out.println(editCul.getDepartmentId()); //0
		int num2 = adminMapper.SetMajorTotalCultural2(editCul.getTotalCultural(), editCul.getYear(),
				editCul.getName(), editCul.getDepartmentId());
		System.out.println(num1+" "+num2);
		if(num1>0 && num2>0)
			return true;
		else
			return false;

	}

	public CulturalRequire GetCulById(int id) {
		return adminMapper.GetCulById(id);
	}

	public List<Admin> GetAdminList(){
		return adminMapper.GetAdminList();
	}

	public boolean AddAdmin(Admin admin) {
		int num = adminMapper.AddAdmin(admin);

		if(num>0)
			return true;
		else
			return false;
	}
}
