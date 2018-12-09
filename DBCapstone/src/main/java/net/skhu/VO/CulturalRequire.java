package net.skhu.VO;

public class CulturalRequire {

	private int id;
	private String code;
	private int departmentId;
	private String departmentName;
	private String name;
	private String year;
	private int chapel;
	private String requireSubject;
	private int voluntary;
	private String voluntarySubject;
	private int totalCultural;
	private String additionalSubject;


	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
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
	public int getChapel() {
		return chapel;
	}
	public void setChapel(int chapel) {
		this.chapel = chapel;
	}
	public String getRequireSubject() {
		return requireSubject;
	}
	public void setRequireSubject(String requireSubject) {
		this.requireSubject = requireSubject;
	}
	public int getVoluntary() {
		return voluntary;
	}
	public void setVoluntary(int voluntary) {
		this.voluntary = voluntary;
	}
	public String getVoluntarySubject() {
		return voluntarySubject;
	}
	public void setVoluntarySubject(String voluntarySubject) {
		this.voluntarySubject = voluntarySubject;
	}
	public int getTotalCultural() {
		return totalCultural;
	}
	public void setTotalCultural(int totalCultural) {
		this.totalCultural = totalCultural;
	}
	public String getAdditionalSubject() {
		return additionalSubject;
	}
	public void setAdditionalSubject(String additionalSubject) {
		this.additionalSubject = additionalSubject;
	}


}
