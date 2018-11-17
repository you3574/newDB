package net.skhu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

	public net.skhu.VO.Student getAStudent(int id) {

		return studentmapper.getAStudent(id);
	}
	
	public net.skhu.VO.Student findByStudentId(int id) {

		return studentmapper.findByStudentId(id);
	}

//	public List<Student> getfindAll(){
//		return studentmapper.findAll();
//	}
}
