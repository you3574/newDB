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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import net.skhu.VO.Student;
import net.skhu.service.AdminService;
import net.skhu.service.StudentService;

@Controller
public class AdminController {

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

}
