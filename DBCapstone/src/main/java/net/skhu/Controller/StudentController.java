package net.skhu.Controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import net.skhu.VO.MajorColor;
import net.skhu.VO.MyCourseRecord;
import net.skhu.VO.Student;
import net.skhu.service.SignService;
import net.skhu.service.StudentService;

@Controller
public class StudentController {

	private static final String courseA ="전공기초";
	private static final String courseB ="전공심화";
	private static final String courseC ="복수전공";
	private static final String courseD ="부전공";

	@Autowired
	private SignService signService;
	@Autowired
	private StudentService studentService;

	@RequestMapping(value="graduation", method=RequestMethod.GET)
	public String Graduation(Model model,HttpSession session) {
		Student student = (Student)session.getAttribute("loginUser");

		//학생 개인 정보에 course(전공과정)이 없으면 계산 안하고 돌려보낸다.
		if( (student.getCourse()==null) || (student.getCourse().equals("")) ) {
			return "student/graduation";
		}

		//학생의 수강 데이터 내역이 있나 먼저 조회를 해야 함
		boolean check = studentService.getStudentRecordData(student.getStudentId());

		if(check == false) { //수강 데이터가 없을 경우 계산 안하고 돌려보낸다.
			return "student/graduation";
		}else { //수강 데이터가 있을 경우

			//전공 기초, 전공 심화일 경우
			if(student.getCourse().equals(courseA) || student.getCourse().equals(courseB)) {
				//로그인한 사람의 학번 가져와서 앞의 4자리만 추출
				String condition = student.getStudentId().substring(0, 4);

				Map<String, Object> tempMap = studentService.getStudentRecord(condition, student.getStudentId(),
						student.getCourse(), student.getDepartmentId());
				model.addAttribute("Map", tempMap);

				List<List<MajorColor>> nameList = studentService.getNameList(condition, student.getCourse(),
						(List<MyCourseRecord>)tempMap.get("MajorList"), student.getDepartmentId());
				model.addAttribute("NameList", nameList);
				return "student/graduation";
			}else if(student.getCourse().equals(courseC)) { //복수전공일 경우
				//System.out.println("복전입니다.");
				int anotherMajorDepart = student.getAnotherMajorDepart();
				Map<String, Object> tempMap = studentService.getDoubleMajorRecord(student.getDepartmentId(), anotherMajorDepart, student.getStudentId());
				model.addAttribute("Map", tempMap);

			}
		}

		return "student/graduation";
	}

}
