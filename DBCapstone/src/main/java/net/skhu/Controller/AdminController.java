package net.skhu.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import net.skhu.service.SignService;
import net.skhu.service.StudentService;

@Controller
public class AdminController {

	@Autowired
	private SignService signService;
	@Autowired
	private StudentService studentService;


	@RequestMapping("admin/student_review")
	public String ShowStudent(Model model) {

		List<net.skhu.VO.Student> students=studentService.getAllstudent();
		model.addAttribute("students",students);
		return "admin/student_review";
	}
	@RequestMapping("admin/student_details")
	public String ShowStudentDetails() {


		return "admin/student_details";
	}


}
