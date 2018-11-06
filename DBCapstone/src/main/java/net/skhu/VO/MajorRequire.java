package net.skhu.VO;

public class MajorRequire {

	private int id;
	private String code;
	private String name;
	private int requireMajor;
	private int totalMajor;
	private int totalCultural;
	private int total;
	private int departmentId;
	private String departmentName;


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
