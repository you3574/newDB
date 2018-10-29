package net.skhu.Controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import net.skhu.VO.Admin;
import net.skhu.VO.Student;
import net.skhu.dto.SignUpDto;
import net.skhu.service.SignService;

@Controller
public class MainController {

	@Autowired
	private SignService signService;

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
			session.setAttribute("loginUser", admin);
			return "redirect:admin";
		}else if(student != null) {
			session.setAttribute("loginUser", student);
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

	@GetMapping("excel")
	public String excel() {
		return "excel";
	}


}
