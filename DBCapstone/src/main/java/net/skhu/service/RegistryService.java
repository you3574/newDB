package net.skhu.service;

import java.io.InputStream;
import java.util.List;

import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.skhu.VO.MyCourseRecord;
import net.skhu.mapper.ExcelMapper;

@Service
public class RegistryService {

	@Autowired
	private ExcelMapper excelMapper;

	public List<MyCourseRecord> Bar_xlsx(final InputStream bar, List<MyCourseRecord> list, List<String> idList ) throws Exception {

		XSSFWorkbook workbook = new XSSFWorkbook(bar);
		//int num = workbook.getActiveSheetIndex(); //70
		int num = workbook.getNumberOfSheets();


		for(int i=1 ; i<num ; i++) {

			XSSFSheet sheet = workbook.getSheetAt(i); //시트를 읽는다
			int rowMax = sheet.getPhysicalNumberOfRows(); //행의 최대 값을 얻는다.

			for(int rowIndex = 2 ; rowIndex < rowMax ; rowIndex++ ) { //행을 돈다
				MyCourseRecord temp = new MyCourseRecord();
				//if( (rowIndex==0) || (rowIndex==1) ) // 1행 2행 스킵
				//continue;

				XSSFRow row = sheet.getRow(rowIndex); //행을 얻는다

				//엑셀 파일이 이상해서 이런식으로 행 끝났는지 판단해야함
				XSSFCell checkCell = row.getCell(1);
				if(checkCell == null)
					break;
				if(checkCell.getCellType() == CellType.ERROR)
					break;
				if(checkCell.getCellType() == CellType._NONE)
					break;

				for(int cellIndex=1 ;  cellIndex < 8  ; cellIndex++) { //열을 돈다
					XSSFCell cell = row.getCell(cellIndex); //셀 하나를 얻는다.

					if(cellIndex==1) { //년도
						switch (cell.getCellTypeEnum() ) {
						case STRING:
							temp.setYear(Integer.parseInt(cell.getStringCellValue()));
							break;
						case NUMERIC:
							temp.setYear((int)cell.getNumericCellValue());
							break;
						default:
							break;
						}
					}else if(cellIndex==2) { //학기
						temp.setSemester(cell.getStringCellValue());
					}else if(cellIndex==3) { //과목코드
						temp.setCourseId(cell.getStringCellValue());
					}else if(cellIndex==6) { //학점
						switch (cell.getCellTypeEnum() ) {
						case STRING:
							temp.setCredits(Integer.parseInt(cell.getStringCellValue()));
							break;
						case NUMERIC:
							temp.setCredits((int)cell.getNumericCellValue());
							break;
						default:
							break;
						}
					}else if(cellIndex==7) { //성적등급
						temp.setGrade(cell.getStringCellValue());
					}else;
				} //열 돌기 끝

				temp.setStudentId(idList.get(i-1));
				list.add(temp);
			} //행 돌기 끝

		}//시트 돌기 끝
		/*
		for(int i=0 ; i<list.size() ; i++) {
			System.out.println("학번="+list.get(i).getStudentId()+" / 년도="+list.get(i).getYear()+
					" / 학기"+list.get(i).getSemester()+" / 과목코드="+list.get(i).getCourseId()+
					" 학점="+list.get(i).getCredits()+" / 성적등급="+list.get(i).getGrade());
		}
		System.out.println(list.size());*/
		workbook.close();
		return list;
	}

	public Boolean setMyRecord(List<MyCourseRecord> myList) {

		int num =  excelMapper.setMyRecord(myList);
		if(num>0)
			return true;
		else
			return false;
	}


}
