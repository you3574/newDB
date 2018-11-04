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
	
	public List<String> getAllstudent(){
		return studentmapper.getAllstudent();
	}
}
