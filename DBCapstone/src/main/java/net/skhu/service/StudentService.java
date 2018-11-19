package net.skhu.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.skhu.VO.MyCourseRecord;
import net.skhu.VO.Student;
import net.skhu.mapper.StudentMapper;

@Service
public class StudentService {

	@Autowired
	private StudentMapper studentmapper;

	public List<String> getAllstudentId(){

		return studentmapper.getAllstudentId();
	}

	public List<net.skhu.VO.Student> getAllstudent(){
		return studentmapper.getAllstudent();
	}

	public Student getAStudent(int id) {

		return studentmapper.getAStudent(id);
	}

	public Student findByStudentId(int id) {

		return studentmapper.findByStudentId(id);
	}

	//	public List<Student> getfindAll(){
	//		return studentmapper.findAll();
	//	}

	public Map<String, Object> getStudentRecord(String studentId) {
		List<MyCourseRecord> list = studentmapper.getStudentRecord(studentId);

		/*
		for(int i=0 ; i<list.size() ; i++) {
			System.out.println("year : "+list.get(i).getYear()+" / 학기 : "+list.get(i).getSemester()+" / courseId : "+
					list.get(i).getCourseId()+" / 평점 : "+list.get(i).getGrade()+" / 학점 : "+list.get(i).getCredits());
		}
		 */

		List<MyCourseRecord> majorList = new ArrayList<>();
		List<MyCourseRecord> culturalList = new ArrayList<>();
		int totalSum=0;
		int majorSum=0;
		int culturalSum=0;

		//name 채워주기
		for(int i=0 ; i<list.size() ; i++) {

			//논패스나 F가 아닌 경우게 합산 저장
			if( !(list.get(i).getGrade().equals("NP")) || !(list.get(i).getGrade().equals("F")))
				totalSum = totalSum + list.get(i).getCredits();

			//전공 과목일 경우 이름 저장 + 전공 수강 majorList에 추가
			String temp = studentmapper.getMajorCourseName(list.get(i));
			if(temp != null) {
				list.get(i).setName(temp);
				majorList.add(list.get(i));
				//논패스나 F가 아닌 경우게 합산 저장
				if( !(list.get(i).getGrade().equals("NP")) || !(list.get(i).getGrade().equals("F")))
					majorSum = majorSum + list.get(i).getCredits();
			}
			//교양과목일 경우 이름 저장 + 전공 수강 majorList에 추가
			else if(temp == null || temp.equals("")) {
				temp = studentmapper.getCulturalCourseName(list.get(i) );
				list.get(i).setName(temp);
				culturalList.add(list.get(i));
				//논패스나 F가 아닌 경우게 합산 저장
				if( !(list.get(i).getGrade().equals("NP")) || !(list.get(i).getGrade().equals("F")))
					culturalSum = culturalSum + list.get(i).getCredits();
			}

			//System.out.println("year : "+list.get(i).getYear()+" / 학기 : "+list.get(i).getSemester()+" / courseId : "+
			//		list.get(i).getCourseId()+" / 이름 : "+list.get(i).getName()+" / 평점 : "+list.get(i).getGrade()+" / 학점 : "+list.get(i).getCredits());
		}
		/*
		System.out.println("--전공--");
		for(int i=0 ; i<majorList.size() ; i++) {
			System.out.println("이름 : "+majorList.get(i).getName());
		}
		System.out.println("--교양--");
		for(int i=0 ; i<culturalList.size() ; i++) {
			System.out.println("이름 : "+culturalList.get(i).getName());
		}*/

		Map<String, Object> tempMap = new HashMap<String, Object>();
		tempMap.put("AllList", list);
		tempMap.put("CulturalList", culturalList);
		tempMap.put("MajorList", majorList);

		//Math.round((((double) answerCount/sum*100) * 100) / 100.0 )

		tempMap.put("totalSum",totalSum);
		tempMap.put("majorSum",majorSum);
		tempMap.put("culturalSum",culturalSum);
		//130, 60, 47은 임시로 준 값
		double totalPercentage = Math.round(  (((double)totalSum/130*100)*100) / 100.0  );
		if(totalPercentage>100)
			totalPercentage = 100;
		tempMap.put("totalPercentage",totalPercentage);

		double majorPercentage = Math.round(  (((double)majorSum/60*100)*100) / 100.0  );
		if(majorPercentage>100)
			majorPercentage = 100;
		tempMap.put("majorPercentage",majorPercentage);

		double culturalPercentage = Math.round(  (((double)culturalSum/47*100) *100 ) / 100.0  );
		if(culturalPercentage>100)
			culturalPercentage = 100;
		tempMap.put("culturalPercentage",culturalPercentage);

		return tempMap;
	}
}
