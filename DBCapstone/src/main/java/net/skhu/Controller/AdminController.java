package net.skhu.Controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import net.skhu.VO.Admin;
import net.skhu.VO.CulturalRequire;
import net.skhu.VO.MajorRequire;
import net.skhu.VO.MyCourseRecord;
import net.skhu.VO.Replacement;
import net.skhu.VO.Student;
import net.skhu.VO.SubjectColor;
import net.skhu.service.AdminService;
import net.skhu.service.StudentService;

@Controller
public class AdminController {

	private static final String courseA ="전공기초";
	private static final String courseB ="전공심화";
	private static final String courseC ="타과복수전공";
	private static final String courseD ="타과부전공";

	@Autowired
	private StudentService studentService;

	@Autowired
	private AdminService adminService;

	@RequestMapping("student_review")
	public String ShowStudent(Model model) {

		List<Student> students=studentService.getAllstudent();
		model.addAttribute("students",students);
		return "admin/student_review";
	}
	@RequestMapping(value="student_details", method=RequestMethod.GET)
	public String ShowStudentDetails(Model model, @RequestParam("id") int id) {
		Student student = studentService.getAStudent(id);

		model.addAttribute("student", student);

		//학생 개인 정보에 course(전공과정)이 없으면 계산 안하고 돌려보낸다.
		if( (student.getCourse()==null) || (student.getCourse().equals("")) ) {
			model.addAttribute("CheckData", true);
			return "admin/student_details";
		}

		//학생의 수강 데이터 내역이 있나 먼저 조회를 해야 함
		boolean check = studentService.getStudentRecordData(student.getStudentId());
		model.addAttribute("check",check);
		if(check == false) { //수강 데이터가 없을 경우 계산 안하고 돌려보낸다.
			return "admin/student_details";
		}else { //수강 데이터가 있을 경우

			//로그인한 사람의 학번 가져와서 앞의 4자리만 추출 -> 입학 년도
			String year = student.getStudentId().substring(0, 4);
			//전공 기초, 전공 심화일 경우
			if(student.getCourse().equals(courseA) || student.getCourse().equals(courseB)) {

				Map<String, Object> tempMap = studentService.getStudentRecord(year, student);
				model.addAttribute("Map", tempMap);

				//전필 리스트 가져오기
				List<List<SubjectColor>> nameList = studentService.getNameList(year, student,
						(List<MyCourseRecord>)tempMap.get("MajorList"));
				model.addAttribute("NameList", nameList);

				//채플, 사봉, 교필, 학과지정 교양 가져오기
				Map<String, Object> cultural = studentService.getCulturalList(year, student,
						(List<MyCourseRecord>)tempMap.get("CulturalList"));
				model.addAttribute("Cultural", cultural);

			}else if(student.getCourse().equals(courseC)) { //타과 복수전공일 경우
				Map<String, Object> tempMap = studentService.getStudentRecord(year, student);
				model.addAttribute("Map", tempMap);

				//전필 리스트 가져오기
				List<List<SubjectColor>> nameList = studentService.getNameList(year, student,
						(List<MyCourseRecord>)tempMap.get("MajorList"));
				model.addAttribute("NameList", nameList);

				//복전 전필 리스트 가져오기
				List<List<SubjectColor>> doubleNameList = studentService.getDoubleNameList(year, student,
						(List<MyCourseRecord>)tempMap.get("DoubleList"));
				model.addAttribute("DoubleNameList", doubleNameList);

				//교양 관련 가져오기
				Map<String, Object> cultural = studentService.getCulturalList(year, student,
						(List<MyCourseRecord>)tempMap.get("CulturalList"));

				model.addAttribute("Cultural", cultural);

			}else if(student.getCourse().equals(courseD)) { //타과 부전공일 경우
				Map<String, Object> tempMap = studentService.getStudentRecord(year, student);
				model.addAttribute("Map", tempMap);

				//전필 리스트 가져오기
				List<List<SubjectColor>> nameList = studentService.getNameList(year, student,
						(List<MyCourseRecord>)tempMap.get("MajorList"));
				model.addAttribute("NameList", nameList);

				//부전공 전필 리스트 가져오기
				List<List<SubjectColor>> minorNameList = studentService.getDoubleNameList(year, student,
						(List<MyCourseRecord>)tempMap.get("DoubleList"));
				model.addAttribute("minorNameList", minorNameList);

				//교양 관련 가져오기
				Map<String, Object> cultural = studentService.getCulturalList(year, student,
						(List<MyCourseRecord>)tempMap.get("CulturalList"));

				model.addAttribute("Cultural", cultural);
			}
		}

		return "admin/student_details";
	}

	@GetMapping("categoryChangeAllow")
	public String CategoryChangeAllow(Model model) {

		model.addAttribute("Status0", adminService.getAllStatus0());
		return "admin/categoryChangeAllow";
	}

	@GetMapping("getChangeOne")
	@ResponseBody
	public Map<String, Object> GetChangeOne(@RequestParam(value="id") int id,
			@RequestParam(value="studentId") String studentId) throws Exception{
		//System.out.println(id);
		Map<String, Object> map = new HashMap<>();

		map.put("ChangeOne",adminService.getChangeOne(id));
		map.put("StudentName",studentService.getStudentName(studentId));
		map.put("DepartName",studentService.getStudentDepartment(studentId));

		return map;
	}

	@GetMapping("changeallow")
	@ResponseBody
	public ResponseEntity<String> ChangeAllow(@RequestParam(value="id") int id,
			@RequestParam(value="changeCategory") String changeCategory,
			@RequestParam(value="comment") String comment) {

		try {
			boolean check = adminService.ChangeAllow(id, changeCategory, comment);
			if(check) {
				return new ResponseEntity("허가했습니다.", HttpStatus.OK);
			}else {
				return new ResponseEntity("오류입니다.", HttpStatus.INTERNAL_SERVER_ERROR);
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return new ResponseEntity("오류입니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	@GetMapping("changereject")
	@ResponseBody
	public ResponseEntity<String> ChangeReject(@RequestParam(value="id") int id,
			@RequestParam(value="comment") String comment) {
		//System.out.println(id+" "+changeCategory);

		try {
			boolean check = adminService.ChangeReject(id, comment);
			if(check) {
				return new ResponseEntity("거절했습니다.", HttpStatus.OK);
			}else {
				return new ResponseEntity("오류입니다.", HttpStatus.INTERNAL_SERVER_ERROR);
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return new ResponseEntity("오류입니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	@GetMapping("graduation_require")
	public String Graduation_require(Model model) {
		model.addAttribute("departList", adminService.getAllDepartment());
		return "admin/graduation_require";
	}

	@GetMapping("departrequirelist")
	public String SetRequire(@RequestParam(value="id") int id, Model model) {
		System.out.println("id="+id);

		if(id<=13) {
			//18학번 이전
			model.addAttribute("departmentId",id);
			model.addAttribute("MajorList", adminService.getMajorRequire(id));
			model.addAttribute("CulturalList", adminService.getCulturalRequire(id));
			return "admin/requirelist";

		}else {
			//18학번부터
			return "redirect:/";
		}

	}

	@GetMapping("addadmin")
	public String AddAdmin(Model model) {
		model.addAttribute("AdminList", adminService.GetAdminList());
		return "admin/addadmin";
	}

	@PostMapping("addadmin")
	public String AddAdminPost(Admin admin) {

		boolean check = adminService.AddAdmin(admin);
		if(check)
			return "redirect:admin";
		else
			return "redirect:addadmin";
	}

	@PostMapping("getMajorById")
	@ResponseBody
	public ResponseEntity<MajorRequire> GetMajorById(@RequestBody int id) {
		System.out.println("GetMajorById="+id);

		MajorRequire temp = adminService.getMajorById(id);
		if(temp != null) {
			return new ResponseEntity(temp, HttpStatus.OK);
		}else {
			return new ResponseEntity(HttpStatus.INTERNAL_SERVER_ERROR);
		}

	}

	@PostMapping("getCulById")
	@ResponseBody
	public ResponseEntity<CulturalRequire> GetCulById(@RequestBody int id){
		System.out.println("GetCulById="+id);

		CulturalRequire temp = adminService.GetCulById(id);
		if(temp != null) {
			return new ResponseEntity(temp, HttpStatus.OK);
		}else {
			return new ResponseEntity(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}


	@GetMapping("deleteMajorById")
	@ResponseBody
	public ResponseEntity<String> DeleteMajorById(@RequestParam(value="id") int id){
		System.out.println("DeleteMajorById="+id);
		boolean check = adminService.DeleteMajorById(id);

		if(check)
			return new ResponseEntity("success", HttpStatus.OK);
		else
			return new ResponseEntity("false", HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@GetMapping("deleteCulById")
	@ResponseBody
	public ResponseEntity<String> DeleteCulById(@RequestParam(value="id") int id){
		System.out.println("DeleteCulById="+id);
		boolean check = adminService.DeleteCulById(id);

		if(check)
			return new ResponseEntity("success", HttpStatus.OK);
		else
			return new ResponseEntity("false", HttpStatus.INTERNAL_SERVER_ERROR);

	}

	@PostMapping("editMajor")
	@ResponseBody
	public ResponseEntity<String> EditMajor(@RequestBody MajorRequire editMajor){

		try{
			boolean check = adminService.EditMajor(editMajor);

			if(check)
				return new ResponseEntity("success", HttpStatus.OK);
			else
				return new ResponseEntity("false", HttpStatus.INTERNAL_SERVER_ERROR);
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return new ResponseEntity(e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	@PostMapping("editCul")
	@ResponseBody
	public ResponseEntity<String> EditCul(@RequestBody  CulturalRequire editCul){

		try {
			boolean check = adminService.EditCul(editCul);
			if(check)
				return new ResponseEntity("success", HttpStatus.OK);
			else
				return new ResponseEntity("false", HttpStatus.INTERNAL_SERVER_ERROR);
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return new ResponseEntity(e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
		}

	}

	@PostMapping("inputMajor")
	@ResponseBody
	public ResponseEntity<String> InputMajor(@RequestBody MajorRequire inputMajor){

		inputMajor.setDepartmentName(adminService.getDepartmentName(inputMajor.getDepartmentId()));
		System.out.println(inputMajor.getDepartmentName());

		//해당 년도에 해당 name이 있나 확인 부터 하고 추가 해야함
		boolean check = adminService.InputMajor(inputMajor);

		if(check)
			return new ResponseEntity("success", HttpStatus.OK);
		else
			return new ResponseEntity("false", HttpStatus.INTERNAL_SERVER_ERROR);

	}


	@PostMapping("inputCul")
	@ResponseBody
	public ResponseEntity<String> InputCul(@RequestBody CulturalRequire inputCul){

		inputCul.setDepartmentName(adminService.getDepartmentName(inputCul.getDepartmentId()));

		try {
			boolean check = adminService.InputCul(inputCul);
			if(check)
				return new ResponseEntity("success", HttpStatus.OK);
			else
				return new ResponseEntity("false", HttpStatus.INTERNAL_SERVER_ERROR);

		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return new ResponseEntity(e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
		}

	}

	@GetMapping("departreplace")
	public String DepartReplace(Model model) {
		model.addAttribute("departList", adminService.getAllDepartment());
		return "admin/departreplace";
	}

	@GetMapping("replacelist")
	public String ReplaceList(@RequestParam(value="id") int id, Model model) {

		model.addAttribute("DepartmentName", adminService.getDepartmentName(id));
		model.addAttribute("DepartmentId", id);
		model.addAttribute("ReplaceList", adminService.ReplaceList(id));
		return "admin/replacelist";
	}

	@PostMapping("replacementinput")
	@ResponseBody
	public ResponseEntity<String> ReplacementInput(@RequestBody Replacement replace){
		System.out.println(replace.getAbolishName());
		boolean check = adminService.ReplacementInput(replace);
		if(check)
			return new ResponseEntity("success", HttpStatus.OK);
		else
			return new ResponseEntity("false", HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@PostMapping("replacementedit")
	@ResponseBody
	public Replacement ReplacementEdit(@RequestBody int id){
		System.out.println("ReplacementEdit="+id);

		Replacement temp = adminService.ReplacementEdit(id);
		System.out.println(temp.getAbolishName());
		return temp;
	}

	@PostMapping("replacedelete")
	@ResponseBody
	public ResponseEntity<String> ReplaceDelete(@RequestBody int id){
		System.out.println("ReplaceDelete="+id);

		boolean check = adminService.ReplaceDelete(id);
		if(check)
			return new ResponseEntity("success", HttpStatus.OK);
		else
			return new ResponseEntity("false", HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@PostMapping("replacesubmit")
	@ResponseBody
	public ResponseEntity<String> ReplaceEdit(@RequestBody Replacement replace){
		boolean check = adminService.ReplaceEdit(replace);
		if(check)
			return new ResponseEntity("success", HttpStatus.OK);
		else
			return new ResponseEntity("false", HttpStatus.INTERNAL_SERVER_ERROR);
	}


}
