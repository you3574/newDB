package net.skhu.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import net.skhu.service.StudentService;

@Controller
public class AdminController {

	@Autowired
	private StudentService studentService;


	@RequestMapping("student_review")
	public String ShowStudent(Model model) {

		List<net.skhu.VO.Student> students=studentService.getAllstudent();
		model.addAttribute("students",students);
		return "admin/student_review";
	}
	@RequestMapping(value="student_details", method=RequestMethod.GET)
	public String ShowStudentDetails(Model model, @RequestParam("id") int id) {
		 net.skhu.VO.Student student = studentService.getAStudent(id);

	     model.addAttribute("student", student);


		return "admin/student_details";
	}


}
