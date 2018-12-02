package net.skhu.Controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
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
import org.springframework.web.multipart.MultipartFile;

import net.skhu.Exception.ExcelBlankException;
import net.skhu.VO.CategoryChange;
import net.skhu.VO.MyCourseRecord;
import net.skhu.VO.Student;
import net.skhu.VO.SubjectColor;
import net.skhu.service.RegistryService;
import net.skhu.service.SignService;
import net.skhu.service.StudentService;

@Controller
public class StudentController {

	private static final String courseA ="전공기초";
	private static final String courseB ="전공심화";
	private static final String courseC ="타과복수전공";
	private static final String courseD ="타과부전공";
	private static final String majorCondition0 = "주전공";
	private static final String majorCondition1 = "타과복수전공";
	private static final String majorCondition2 = "타과부전공";
	private static final String majorCondition3 = "복수전공";
	private static final String majorCondition4 = "부전공";

	@Autowired
	private SignService signService;
	@Autowired
	private StudentService studentService;
	@Autowired
	private RegistryService registryService;

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

		return "student/graduation";
	}


	@GetMapping("graduation/sampledownload")
	public void SampleDownload(HttpServletResponse response) throws Exception{
		System.out.println("다운로드합니다.");
		File file = new ClassPathResource("sample.xlsx").getFile();
		//new FileSystemResource
		byte fileByte[] = FileUtils.readFileToByteArray(file);
		System.out.println("파일을 읽었습니다.");

		if(fileByte.length == 0) {

		}
		else {
			response.setContentType("application/octet-stream");
			response.setContentLength(fileByte.length);
			response.setHeader("Content-Disposition", "attachment; fileName=sample.xlsx");
			response.setHeader("Content-Transfer-Encoding", "binary");
			response.getOutputStream().write(fileByte);
			response.getOutputStream().flush();
			response.getOutputStream().close();
		}
	}

	@PostMapping("/studentrecord")
	@ResponseBody
	public ResponseEntity<String> StudentrecordRegistry(@RequestParam(value="excelFile") MultipartFile excelFile,
			HttpSession session ) throws Exception{

		Student student = (Student)session.getAttribute("loginUser");
		String fileName = excelFile.getOriginalFilename();
		List<MyCourseRecord> list = new ArrayList<MyCourseRecord>();

		//수강 내역이 디비에 있으면 지워주고 다시 입력해야함
		//학생 개인 정보에 course(전공과정)이 없으면 계산 안하고 돌려보낸다.
		if( (student.getCourse()==null) || (student.getCourse().equals("")) ) {
			return new ResponseEntity<String>("학생의 전공과정이 설정되지 않았습니다.", HttpStatus.OK);
		}

		try {
			//학생의 수강 데이터 내역이 있나 먼저 조회를 해야 함
			boolean check1 = studentService.getStudentRecordData(student.getStudentId());
			if(check1) { //수강 내역이 있을 경우 삭제 후 입력한다.
				//삭제하기
				boolean check2 = studentService.deleteStudentRecord(student.getStudentId());
				if(check2==false) //삭제에 실패했을 경우
					return new ResponseEntity<String>("기존 수강 데이터 삭제에 실패했습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
			}

			//엑셀 파일을 읽어서 리스트로 저장하기
			if ( (fileName.indexOf(".xlsx") > -1)  )
				list = registryService.studentRecord(excelFile.getInputStream(), student.getStudentId());

			//데이터 베이스에 저장하기
			boolean checkService = registryService.setMyRecord(list);
			if(checkService){
				return new ResponseEntity<String>("데이터 입력에 성공하였습니다.", HttpStatus.OK);
			}else{
				return new ResponseEntity<String>("데이터 입력에 실패하였습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
			}

		}catch (ExcelBlankException e) {
			// TODO: handle exception
			e.printStackTrace();
			return new ResponseEntity<String>("비어있는 셀이 있습니다.",
					HttpStatus.INTERNAL_SERVER_ERROR);
		}catch (NumberFormatException | IllegalStateException e) {
			// TODO: handle exception
			e.printStackTrace();
			return new ResponseEntity<String>("엑셀 파일 양식 또는 셀 타입이 맞지 않습니다.",
					HttpStatus.INTERNAL_SERVER_ERROR);
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return new ResponseEntity<String>("알 수 없는 서버 오류입니다.",
					HttpStatus.INTERNAL_SERVER_ERROR);
		}

	}

	@GetMapping("/categorychange")
	public String CategoryChange(Model model,HttpSession session) {
		Student student = (Student)session.getAttribute("loginUser");

		model.addAttribute("MyRecord", studentService.getAllMyRecord(student.getStudentId()	));
		model.addAttribute("ApplyList", studentService.getStatus0(student.getStudentId()	));
		model.addAttribute("AllowList", studentService.getStatus1(student.getStudentId()	));
		model.addAttribute("RejectList", studentService.getStatus2(student.getStudentId()	));

		return "student/categoryChange";

	}

	@PostMapping("categorychangeapply")
	@ResponseBody
	public ResponseEntity<String> ChangeApply(@RequestBody CategoryChange categoryChange) throws Exception{

		//System.out.println(categoryChange.getCategory());
		//System.out.println(categoryChange.getChangeCategory());
		boolean check1 = studentService.getRecordId(categoryChange.getRecordId());

		//신청된게 없을 때->중복 신청이 아닐 때
		if(check1==false) {
			//데이터 입력
			boolean check2 = studentService.setCategotyChange(categoryChange);
			if(check2==true) {
				return new ResponseEntity<String>("데이터 입력에 성공하였습니다.", HttpStatus.OK);
			}
			return new ResponseEntity<String>("데이터 입력에 실패하였습니다.",HttpStatus.INTERNAL_SERVER_ERROR);
		}


		return new ResponseEntity<String>("중복 신청입니다.", HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
