package net.skhu.VO;

public class MajorRequire {

	private int id;
	private String code;
	private String name;
	private String year;
	private int requireMajor; //전공필수 학점
	private int totalMajor; 	//전공 학점
	private int totalCultural;//교양 학점
	private int total;				//전체 학점
	private int departmentId;
	private String departmentName;
	private String firstSemester;
	private String secondSemester;
	private String thirdSemester;
	private String fourthSemester;
	private String fifthSemester;
	private String sixthSemester;
	private String seventhSemester;
	private String eighthSemester;


	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getEighthSemester() {
		return eighthSemester;
	}
	public void setEighthSemester(String eighthSemester) {
		this.eighthSemester = eighthSemester;
	}
	public String getFirstSemester() {
		return firstSemester;
	}
	public void setFirstSemester(String firstSemester) {
		this.firstSemester = firstSemester;
	}
	public String getSecondSemester() {
		return secondSemester;
	}
	public void setSecondSemester(String secondSemester) {
		this.secondSemester = secondSemester;
	}
	public String getThirdSemester() {
		return thirdSemester;
	}
	public void setThirdSemester(String thirdSemester) {
		this.thirdSemester = thirdSemester;
	}
	public String getFourthSemester() {
		return fourthSemester;
	}
	public void setFourthSemester(String fourthSemester) {
		this.fourthSemester = fourthSemester;
	}
	public String getFifthSemester() {
		return fifthSemester;
	}
	public void setFifthSemester(String fifthSemester) {
		this.fifthSemester = fifthSemester;
	}
	public String getSixthSemester() {
		return sixthSemester;
	}
	public void setSixthSemester(String sixthSemester) {
		this.sixthSemester = sixthSemester;
	}
	public String getSeventhSemester() {
		return seventhSemester;
	}
	public void setSeventhSemester(String seventhSemester) {
		this.seventhSemester = seventhSemester;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getDepartmentId() {
		return departmentId;
	}
	public void setDepartmentId(int departmentId) {
		this.departmentId = departmentId;
	}
	public String getDepartmentName() {
		return departmentName;
	}
	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getRequireMajor() {
		return requireMajor;
	}
	public void setRequireMajor(int requireMajor) {
		this.requireMajor = requireMajor;
	}
	public int getTotalMajor() {
		return totalMajor;
	}
	public void setTotalMajor(int totalMajor) {
		this.totalMajor = totalMajor;
	}
	public int getTotalCultural() {
		return totalCultural;
	}
	public void setTotalCultural(int totalCultural) {
		this.totalCultural = totalCultural;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}


}
