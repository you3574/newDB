package net.skhu.Controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import net.skhu.VO.MyCourseRecord;
import net.skhu.VO.Student;
import net.skhu.VO.SubjectColor;
import net.skhu.service.SignService;
import net.skhu.service.StudentService;

@Controller
public class StudentController {

	private static final String courseA ="전공기초";
	private static final String courseB ="전공심화";
	private static final String courseC ="타과복수전공";
	private static final String courseD ="타과부전공";
	private static final String majorCondition0 = "주전공";

	@Autowired
	private SignService signService;
	@Autowired
	private StudentService studentService;

	@SuppressWarnings("unchecked")
	@RequestMapping(value="graduation", method=RequestMethod.GET)
	public String Graduation(Model model,HttpSession session) {
		Student student = (Student)session.getAttribute("loginUser");

		//학생 개인 정보에 course(전공과정)이 없으면 계산 안하고 돌려보낸다.
		if( (student.getCourse()==null) || (student.getCourse().equals("")) ) {
			model.addAttribute("CheckData", true);
			return "student/graduation";
		}

		//학생의 수강 데이터 내역이 있나 먼저 조회를 해야 함
		boolean check = studentService.getStudentRecordData(student.getStudentId());
		model.addAttribute("check",check);
		if(check == false) { //수강 데이터가 없을 경우 계산 안하고 돌려보낸다.
			return "student/graduation";
		}else { //수강 데이터가 있을 경우

			//로그인한 사람의 학번 가져와서 앞의 4자리만 추출 -> 입학 년도
			//String condition = student.getStudentId().substring(0, 4);
			String year = student.getStudentId().substring(0, 4);
			//전공 기초, 전공 심화일 경우
			if(student.getCourse().equals(courseA) || student.getCourse().equals(courseB)) {
				Map<String, Object> tempMap = studentService.getStudentRecord(year, student.getStudentId(),
						student.getCourse(), student.getDepartmentId());
				model.addAttribute("Map", tempMap);

				//전필 리스트 가져오기
				List<List<SubjectColor>> nameList = studentService.getNameList(year, student.getCourse(),
						(List<MyCourseRecord>)tempMap.get("MajorList"), student.getDepartmentId());
				model.addAttribute("NameList", nameList);

				//채플, 사봉, 교필, 학과지정 교양 가져오기
				Map<String, Object> cultural = studentService.getCulturalList(majorCondition0,
						(List<MyCourseRecord>)tempMap.get("CulturalList"), year, student.getDepartmentId(), student.getStudentId());

				model.addAttribute("Cultural", cultural);
				//return "student/graduation";
			}else if(student.getCourse().equals(courseC)) { //타과 복수전공일 경우
				//System.out.println("타과 복전입니다.");
				int anotherMajorDepart = student.getAnotherMajorDepart();
				Map<String, Object> tempMap = studentService.getDoubleMajorRecord(year, student.getDepartmentId(),
						anotherMajorDepart, student.getStudentId());
				model.addAttribute("Map", tempMap);

				//전필 리스트 가져오기
				List<List<SubjectColor>> nameList = studentService.getNameList(year, student.getCourse(),
						(List<MyCourseRecord>)tempMap.get("MajorList"), student.getDepartmentId());
				model.addAttribute("NameList", nameList);

				//복전 전필 리스트 가져오기
				List<List<SubjectColor>> doubleNameList = studentService.getDoubleNameList(year, courseC,
						(List<MyCourseRecord>)tempMap.get("DoubleList"), student.getAnotherMajorDepart());
				model.addAttribute("DoubleNameList", doubleNameList);

				//교양 관련 가져오기
				Map<String, Object> cultural = studentService.getCulturalList(courseC, (List<MyCourseRecord>)tempMap.get("CulturalList"),
						year, student.getDepartmentId(), student.getStudentId());

				model.addAttribute("Cultural", cultural);

			}else if(student.getCourse().equals(courseD)) { //타과 부전공일 경우
				//System.out.println("타과 부전공입니다.");
				int anotherMinorDepart = student.getAnotherMajorDepart();
				Map<String, Object> tempMap = studentService.getDoubleMajorRecord(year, student.getDepartmentId(),
						anotherMinorDepart, student.getStudentId());
				model.addAttribute("Map", tempMap);

				//전필 리스트 가져오기
				List<List<SubjectColor>> nameList = studentService.getNameList(year, student.getCourse(),
						(List<MyCourseRecord>)tempMap.get("MajorList"), student.getDepartmentId());
				model.addAttribute("NameList", nameList);

				//부전공 전필 리스트 가져오기
				List<List<SubjectColor>> minorNameList = studentService.getDoubleNameList(year, courseD,
						(List<MyCourseRecord>)tempMap.get("DoubleList"), student.getAnotherMajorDepart());
				model.addAttribute("minorNameList", minorNameList);

				//교양 관련 가져오기
				Map<String, Object> cultural = studentService.getCulturalList(courseD, (List<MyCourseRecord>)tempMap.get("CulturalList"),
						year, student.getDepartmentId(), student.getStudentId());

				model.addAttribute("Cultural", cultural);
			}
		}

		return "student/graduation";
	}

}
