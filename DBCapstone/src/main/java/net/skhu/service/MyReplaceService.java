package net.skhu.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.skhu.VO.MyReplace;
import net.skhu.mapper.MyReplaceMapper;


@Service
public class MyReplaceService {

	@Autowired MyReplaceMapper myreplaceMapper;


    /*public void delete(int id) {
       myreplaceMapper.delete(id);
    }
*/

	public boolean insertreplace(String studentId, MyReplace myreplace) {

		Map<String,Object> tempMap = new HashMap<String,Object>();
		tempMap.put("studentId",studentId);
		tempMap.put("myreplace",myreplace);

		int num = myreplaceMapper.insertreplace(tempMap);
		//System.out.println("num="+num);

		if(num>0)
			return true;
		return false;
	}



	public List<MyReplace> getAllreplace(String studentId) {

		return myreplaceMapper.getAllreplace(studentId);
	}



}
