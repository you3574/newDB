package net.skhu.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.skhu.VO.MajorColor;
import net.skhu.VO.MajorRequire;
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

	public Map<String, Object> getStudentRecord(String studentId, String course) {
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

		//수료 학점 가져오기
		String year = studentId.substring(0, 4);
		String tableName = studentmapper.getTableName(year);
		String code = studentmapper.getCode(year);
		//System.out.println(tableName+"  "+code);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("tableName", tableName);
		map.put("code", code);
		map.put("course", course);
		MajorRequire temp = studentmapper.getMajorRequire(map);
		int total = temp.getTotal();
		int totalMajor = temp.getTotalMajor();
		int totalCultural = temp.getTotalCultural();

		double totalPercentage = Math.round(  (((double)totalSum/total*100)*100) / 100.0  );
		if(totalPercentage>100)
			totalPercentage = 100;
		tempMap.put("totalPercentage",totalPercentage);

		double majorPercentage = Math.round(  (((double)majorSum/totalMajor*100)*100) / 100.0  );
		if(majorPercentage>100)
			majorPercentage = 100;
		tempMap.put("majorPercentage",majorPercentage);

		double culturalPercentage = Math.round(  (((double)culturalSum/totalCultural*100) *100 ) / 100.0  );
		if(culturalPercentage>100)
			culturalPercentage = 100;
		tempMap.put("culturalPercentage",culturalPercentage);

		return tempMap;
	}

	public List<List<MajorColor>> getNameList(String year, String course, List<MyCourseRecord> majorList) {

		String tableName = studentmapper.getTableName(year);
		String code = studentmapper.getCode(year);
		System.out.println(tableName+"  "+code);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("tableName", tableName);
		map.put("code", code);
		map.put("course", course);

		MajorRequire temp = studentmapper.getMajorRequire(map);
		List<List<String>> list = new ArrayList<>();


		//문자열 -> 배열 -> 리스트

		list.add(new ArrayList<>(Arrays.asList(temp.getFirstSemester().split(","))));
		list.add(new ArrayList<>(Arrays.asList(temp.getSecondSemester().split(","))));
		list.add(new ArrayList<>(Arrays.asList(temp.getThirdSemester().split(","))));
		list.add(new ArrayList<>(Arrays.asList(temp.getFourthSemester().split(","))));
		list.add(new ArrayList<>(Arrays.asList(temp.getFifthSemester().split(","))));
		list.add(new ArrayList<>(Arrays.asList(temp.getSixthSemester().split(","))));
		list.add(new ArrayList<>(Arrays.asList(temp.getSeventhSemester().split(","))));

		List<List<MajorColor>> nameList = new ArrayList<>();

		//리스트를 가지고 과목 이름으로 가져오기
		for(int i=0 ; i<list.size() ; i++) {
			List<MajorColor> tempList =  new ArrayList<>();
			for(int k=0 ; k<list.get(i).size() ; k++) {
				MajorColor tempColor = new MajorColor();
				Map<String, Object> tempMap = new HashMap<String, Object>();
				tempMap.put("courseId", list.get(i).get(k));
				tempMap.put("year", year);

				tempColor.setName(studentmapper.getMajorName(tempMap));
				tempColor.setCourseId(list.get(i).get(k));
				tempColor.setCheck(false);
				tempList.add(tempColor);
				//System.out.println(tempColor.getName());
			}
			nameList.add(tempList);
		}

		//수강한 과목인지 채크값 넣어주기
		for(int i=0 ; i<nameList.size() ; i++) {
			for(int k=0 ; k<nameList.get(i).size() ; k++) {
				for(int n=0 ; n<majorList.size() ; n++) {
					//nameList.get(i).get(k).getName() -> C프로그래밍Ⅰ
					if(nameList.get(i).get(k).getCourseId().equals(majorList.get(n).getCourseId())) {
						nameList.get(i).get(k).setCheck(true);
						break;
					}
				}
			}
		}

		/*
		for(int i=0 ; i<nameList.size() ; i++) {
			for(int k=0 ; k<nameList.get(i).size() ; k++) {
				System.out.println(nameList.get(i).get(k).getCourseId()+" "+ nameList.get(i).get(k).getName() +" "+ nameList.get(i).get(k).isCheck());
			}
		}
		 */

		return nameList;

	}
}
