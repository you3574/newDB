package net.skhu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.skhu.VO.Replacement;
import net.skhu.mapper.SubjectMapper;

@Service
public class SubjectService {

	@Autowired
	private SubjectMapper subjectMapper;

	public List<Replacement> getReplacement(String studentId){
		return subjectMapper.getReplacement(studentId);

	}

	public List<Replacement> getReplaceRequest(int id){
		return subjectMapper.getReplaceRequest(id);
	}
}
