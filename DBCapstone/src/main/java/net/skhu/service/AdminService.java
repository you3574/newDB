package net.skhu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.skhu.VO.MajorConnect;
import net.skhu.VO.MajorRequire;
import net.skhu.mapper.GraduationMapper;

@Service
public class AdminService {

	@Autowired
	private GraduationMapper graduationMapper;

	public List<MajorConnect> testList(){
		return graduationMapper.testList();
	}

	public List<MajorConnect> testList2(){
		return graduationMapper.testList2();
	}

	public String getCode(int id) {
		return graduationMapper.getCode(id);
	}

	public List<MajorRequire> getMajorRequire(String code){
		return graduationMapper.getMajorRequire(code);
	}

	public int majorInput(MajorRequire input) {
		return graduationMapper.majorInput(input);
	}

	public MajorRequire getMajorRequireById(int id) {
		return graduationMapper.getMajorRequireById(id);
	}

	public int editMajor(MajorRequire edit) {
		return graduationMapper.editMajor(edit);
	}

	public void deleteMajor(int id) {
		graduationMapper.deleteMajor(id);
	}
}
