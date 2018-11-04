package net.skhu.Controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import net.skhu.VO.MyCourseRecord;
import net.skhu.service.RegistryService;
import net.skhu.service.StudentService;

@Controller
public class ExcelController {

	@Autowired
	private RegistryService registryService;

	@Autowired
	private StudentService studentService;


	@PostMapping("/studentrecord")
	@ResponseBody
	public ResponseEntity<String> StudentrecordRegistry(@RequestParam(value="Bar") MultipartFile Bar) throws Exception{

		String fileName1 = Bar.getOriginalFilename();
		List<MyCourseRecord> list = new ArrayList<MyCourseRecord>();

		List<String> idList = studentService.getAllstudentId();

		//엑셀 데이터 저장
		if ( (fileName1.indexOf(".xlsx") > -1)  ) {
			list = registryService.Bar_xlsx(Bar.getInputStream(), list, idList );
		}

		//디비에 입력


		Boolean checkService = registryService.setMyRecord(list);
		if(checkService != null && checkService){
			return new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}else{
			return new ResponseEntity<String>("false", HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	/*
	@PostMapping("/replacement")
	@ResponseBody
	public ResponseEntity<String> ReplacementRegistry(	@RequestParam(value="BarMenu") MultipartFile BarMenu) throws Exception{

		String fileName2 = BarMenu.getOriginalFilename();
		List<BarMenus> menuList = new ArrayList<BarMenus>();


		//엑셀 데이터 저장
		if ( (fileName2.indexOf(".xlsx") > -1) ) {
			menuList = registryService.Menu_xlsx(BarMenu.getInputStream() , menuList );
		}

		//디비에 입력
		Boolean checkService = registryService.setMenus(menuList);
		if(checkService != null && checkService){
			return new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}else{
			return new ResponseEntity<String>("false", HttpStatus.INTERNAL_SERVER_ERROR);
		}

	}
	 */
}
