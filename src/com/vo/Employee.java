package com.vo;

import java.io.Serializable;

public class Employee  implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String empNo;
	private String empName;
	private String deptId;
	private String deptName;
	private String positionId;
	private String positionName;
	
	public Employee() {
		super();
	}
	
	public Employee(String empNo, String empName, String deptId,
			String deptName, String positionId, String positionName) {
		super();
		this.empNo = empNo;
		this.empName = empName;
		this.deptId = deptId;
		this.deptName = deptName;
		this.positionId = positionId;
		this.positionName = positionName;
	}
	
	public String getEmpNo() {
		return empNo;
	}
	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public String getDeptId() {
		return deptId;
	}
	public void setDeptId(String deptId) {
		this.deptId = deptId;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	public String getPositionId() {
		return positionId;
	}
	public void setPositionId(String positionId) {
		this.positionId = positionId;
	}
	public String getPositionName() {
		return positionName;
	}
	public void setPositionName(String positionName) {
		this.positionName = positionName;
	}
	
	@Override
	public String toString() {
		return "Employee [empNo=" + empNo + ", empName=" + empName
				+ ", deptId=" + deptId + ", deptName=" + deptName
				+ ", positionId=" + positionId + ", positionName="
				+ positionName + "]";
	}
	
	
	
	

}
