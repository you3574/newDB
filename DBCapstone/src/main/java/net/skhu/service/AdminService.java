package net.skhu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.skhu.VO.CategoryChange;
import net.skhu.VO.MajorConnect;
import net.skhu.VO.MajorRequire;
import net.skhu.mapper.AdminMapper;
import net.skhu.mapper.GraduationMapper;

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

	@Autowired
	private GraduationMapper graduationMapper;

	@Autowired
	private AdminMapper adminMapper;

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

}
