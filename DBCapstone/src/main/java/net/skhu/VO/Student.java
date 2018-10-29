package net.skhu.VO;

public class Student {

	private int id;
	private String pw;
	private String studentId;
	private String name;
	private int departmentId;
	private int professorId;
	private int grade;
	private int majorCredit;
	private int culturalCredit;
	private boolean socialService;
	private String dname;


	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getStudentId() {
		return studentId;
	}
	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getDepartmentId() {
		return departmentId;
	}
	public void setDepartmentId(int departmentId) {
		this.departmentId = departmentId;
	}
	public int getProfessorId() {
		return professorId;
	}
	public void setProfessorId(int professorId) {
		this.professorId = professorId;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public int getMajorCredit() {
		return majorCredit;
	}
	public void setMajorCredit(int majorCredit) {
		this.majorCredit = majorCredit;
	}
	public int getCulturalCredit() {
		return culturalCredit;
	}
	public void setCulturalCredit(int culturalCredit) {
		this.culturalCredit = culturalCredit;
	}
	public boolean isSocialService() {
		return socialService;
	}
	public void setSocialService(boolean socialService) {
		this.socialService = socialService;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
}
