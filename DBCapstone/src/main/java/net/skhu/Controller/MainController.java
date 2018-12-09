package net.skhu.Controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.servlet.ModelAndView;

import net.skhu.VO.Admin;
import net.skhu.VO.MyReplace;
import net.skhu.VO.Replacement;
import net.skhu.VO.Student;
import net.skhu.dto.SignUpDto;
import net.skhu.service.AdminService;
import net.skhu.service.MyReplaceService;
import net.skhu.service.QnAService;
import net.skhu.service.SignService;
import net.skhu.service.StudentService;
import net.skhu.service.SubjectService;


@Controller
public class MainController {

	@Autowired
	private SignService signService;
	@Autowired
	private StudentService studentService;
	@Autowired
	private AdminService adminService;
	@Autowired
	private SubjectService subjectService;
	@Autowired
	private MyReplaceService myReplaceService;
	@Autowired
	private QnAService qnaService;


	@GetMapping("/")
	public ModelAndView LoginPage() {

		ModelAndView response = new ModelAndView("/login");

		return response;
	}

	@PostMapping("login")
	public String Login(@RequestParam(value="usernumber") String usernumber,
			@RequestParam(value="pass") String pass,
			HttpSession session) throws Exception{

		Map<String, Object> loginMap = new HashMap<String, Object>();
		loginMap.put("usernumber", usernumber);
		loginMap.put("pass", pass);

		Admin admin = signService.adminLogin(loginMap);
		Student student = signService.studentLogin(loginMap);


		if(admin != null) {
			session.setAttribute("loginUser", admin); //세션에 로그인 정보 넣어두기.
			return "redirect:admin";
		}else if(student != null) {
			session.setAttribute("loginUser", student); //loginUser에 알맞은 객체 넣기.
			return "redirect:student";
		}else {
			return "redirect:/";
		}
	}

	@GetMapping("admin")
	public String Admin(Model model) {

		model.addAttribute("articles",qnaService.findTopFive());
		return "admin/admin";


	}

	@GetMapping("student")
	public String Student() {
		return "student/student";
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();						//session 전체 초기화

		return "redirect:/";
	}


	@PostMapping("signup")
	@ResponseBody
	public boolean SignUp(@RequestBody SignUpDto signUpDto) throws Exception{

		int temp = signService.SignUp(signUpDto);
		if(temp>0)
			return true;
		else
			return false;
	}

	@PostMapping("studentChange")
	@ResponseBody
	public boolean studentChange(@RequestBody String password,
			HttpSession session) throws Exception{


		Student student = (Student)session.getAttribute("loginUser");
		student.setPw(password);


		int temp2 = signService.studentChange(student);
		if(temp2>0)
			return true;
		else
			return false;
	}

	@PostMapping("replaceRequest")
	@ResponseBody
	public Replacement replaceRequest(@RequestBody int id,
			HttpServletResponse response) throws Exception{

		Replacement code=subjectService.getReplaceRequest(id);

		return code;

	}

	//@PostMapping(value="myreplace", produces="application/json; charset=UTF-8")
	@RequestMapping(value="myreplace", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Boolean> myreplace(@RequestBody MyReplace myreplace , HttpSession session, Model model) throws Exception{
		Student student= (Student)session.getAttribute("loginUser");

		boolean check = myReplaceService.insertreplace(student.getStudentId(), myreplace);

		if(check)
			return new ResponseEntity(true, HttpStatus.OK);
		return new ResponseEntity(false, HttpStatus.INTERNAL_SERVER_ERROR);

	}



	@GetMapping("request")
	public String ShowReplacement(Model model, HttpSession session) throws Exception{

		Student student = (Student)session.getAttribute("loginUser");
		List<MyReplace> myreplace = myReplaceService.getAllreplace(student.getStudentId());

		model.addAttribute("myreplace",myreplace);
		model.addAttribute("replacement", subjectService.getReplacement(student.getStudentId()));


		return "student/request";
	}
	//
	@GetMapping("excel")
	public String excel() {
		return "excel";
	}


	@GetMapping("uesrinfo")
	public String uesrinfo() {
		return "student/uesrinfo";
	}


	@PostMapping("uesrinfo")
	public String uesrinfoChange(@RequestParam("departmentId") int departmentId,
			@RequestParam("course") int course, @RequestParam("anotherId") int anotherId,
			@RequestParam("semester") int semester, HttpSession session) {

		Student student = (Student)session.getAttribute("loginUser");

		boolean check = false;
		try {
			check = studentService.updateUser2(departmentId, course, anotherId, student.getStudentId(), semester);

			if(check==true)
				return "redirect:/";
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "student/uesrinfo";
		}

		return "student/uesrinfo";
	}

}
/*
package net.skhu.Controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.servlet.ModelAndView;

import net.skhu.VO.Admin;
import net.skhu.VO.MyReplace;
import net.skhu.VO.Replacement;
import net.skhu.VO.Student;
import net.skhu.dto.SignUpDto;
import net.skhu.service.AdminService;
import net.skhu.service.MyReplaceService;
import net.skhu.service.SignService;
import net.skhu.service.StudentService;
import net.skhu.service.SubjectService;


@Controller
public class MainController {

	@Autowired
	private SignService signService;
	@Autowired
	private StudentService studentService;
	@Autowired
	private AdminService adminService;
	@Autowired
	private SubjectService subjectService;
	@Autowired
	private MyReplaceService myReplaceService;


	@GetMapping("/")
	public ModelAndView LoginPage() {

		ModelAndView response = new ModelAndView("/login");

		return response;
	}

	@PostMapping("login")
	public String Login(@RequestParam(value="usernumber") String usernumber,
			@RequestParam(value="pass") String pass,
			HttpSession session) throws Exception{

		Map<String, Object> loginMap = new HashMap<String, Object>();
		loginMap.put("usernumber", usernumber);
		loginMap.put("pass", pass);

		Admin admin = signService.adminLogin(loginMap);
		Student student = signService.studentLogin(loginMap);


		if(admin != null) {
			session.setAttribute("loginUser", admin); //세션에 로그인 정보 넣어두기.
			return "redirect:admin";
		}else if(student != null) {
			session.setAttribute("loginUser", student); //loginUser에 알맞은 객체 넣기.
			return "redirect:student";
		}else {
			return "redirect:/";
		}
	}

	@GetMapping("admin")
	public String Admin() {
		return "admin/admin";


	}

	@GetMapping("student")
	public String Student() {
		return "student/student";
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();						//session 전체 초기화

		return "redirect:/";
	}


	@PostMapping("signup")
	@ResponseBody
	public boolean SignUp(@RequestBody SignUpDto signUpDto) throws Exception{

		int temp = signService.SignUp(signUpDto);
		if(temp>0)
			return true;
		else
			return false;
	}

	@PostMapping("studentChange")
	@ResponseBody
	public boolean studentChange(@RequestBody String password,
			HttpSession session) throws Exception{


		Student student = (Student)session.getAttribute("loginUser");
		student.setPw(password);


		int temp2 = signService.studentChange(student);
		if(temp2>0)
			return true;
		else
			return false;
	}

	@PostMapping("replaceRequest")
	@ResponseBody
	public Replacement replaceRequest(@RequestBody int id,
			HttpServletResponse response) throws Exception{

		Replacement code=subjectService.getReplaceRequest(id);

		return code;

	}

	@RequestMapping(value="myreplace", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Boolean> myreplace(@RequestBody MyReplace myreplace , HttpSession session, Model model) throws Exception{
		Student student= (Student)session.getAttribute("loginUser");

		boolean check = myReplaceService.insertreplace(student.getStudentId(), myreplace);

		if(check)
			return new ResponseEntity(true, HttpStatus.OK);
		return new ResponseEntity(false, HttpStatus.INTERNAL_SERVER_ERROR);

	}



	@GetMapping("request")
	public String ShowReplacement(Model model, HttpSession session) throws Exception{

		Student student = (Student)session.getAttribute("loginUser");
		List<MyReplace> myreplace = myReplaceService.getAllreplace(student.getStudentId());

		model.addAttribute("myreplace",myreplace);
		model.addAttribute("replacement", subjectService.getReplacement(student.getStudentId()));


		return "student/request";
	}

	@GetMapping("excel")
	public String excel() {
		return "excel";
	}



	@GetMapping("cultural_require")
	public ModelAndView cultural_require() {

		ModelAndView response = new ModelAndView("admin/cultural_require");

		return response;
	}

	@GetMapping("cultural_require18")
	public ModelAndView cultural_require18() {

		ModelAndView response = new ModelAndView("admin/cultural_require18");

		return response;
	}


	@GetMapping("major_require18")
	public ModelAndView major_require18() {
		ModelAndView response = new ModelAndView("admin/major_require18");

		return response;
	}

	@GetMapping("uesrinfo")
	public String uesrinfo() {
		return "student/uesrinfo";
	}

	@PostMapping("uesrinfo")
	public String uesrinfoChange(@RequestParam("departmentId") int departmentId,
			@RequestParam("course") int course, @RequestParam("anotherId") int anotherId,
			@RequestParam("semester") int semester, HttpSession session) {

		Student student = (Student)session.getAttribute("loginUser");

		boolean check = false;
		try {
			check = studentService.updateUser2(departmentId, course, anotherId, student.getStudentId(), semester);

			if(check==true)
				return "redirect:/";
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "student/uesrinfo";
		}

		return "student/uesrinfo";
	}
}
 */
