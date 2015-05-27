package com.vo;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;

public class Reservation implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String reservedNo;
	private Date enrolledDate;
	private String buildingNo;
	private String roomNo;
	private String empNo;
	private Date reservedStart;
	private Date reservedEnd;

	public Reservation() {
		super();
	}

	// insert �� ������ : reservedNo �� ������, enrolledDate �� sysdate �� �ٷε�!
	public Reservation(String buildingNo, String roomNo, String empNo, Date reservedStart,
			Date reservedEnd) {
		super();
		this.buildingNo = buildingNo;
		this.roomNo = roomNo;
		this.reservedStart = reservedStart;
		this.reservedEnd = reservedEnd;
		this.empNo = empNo;
	}

	public Reservation(String reservedNo, Date enrolledDate, String buildingNo, String roomNo,
			String empNo, Date reservedStart, Date reservedEnd) {
		super();
		this.reservedNo = reservedNo;
		this.enrolledDate = enrolledDate;
		this.buildingNo = buildingNo;
		this.roomNo = roomNo;
		this.reservedStart = reservedStart;
		this.reservedEnd = reservedEnd;
		this.empNo = empNo;
	}

	public String getReservedNo() {
		return reservedNo;
	}

	public void setReservedNo(String reservedNo) {
		this.reservedNo = reservedNo;
	}

	public Date getEnrolledDate() {
		return enrolledDate;
	}

	public void setEnrolledDate(Date enrolledDate) {
		this.enrolledDate = enrolledDate;
	}

	public String getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(String roomNo) {
		this.roomNo = roomNo;
	}

	public String getEmpNo() {
		return empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}

	public Date getReservedStart() {
		return reservedStart;
	}

	public void setReservedStart(Date reservedStart) {
		this.reservedStart = reservedStart;
	}

	public Date getReservedEnd() {
		return reservedEnd;
	}

	public void setReservedEnd(Date reservedEnd) {
		this.reservedEnd = reservedEnd;
	}

	
	public String getBuildingNo() {
		return buildingNo;
	}

	public void setBuildingNo(String buildingNo) {
		this.buildingNo = buildingNo;
	}

	@Override
	public String toString() {
		return "Reservation [reservedNo=" + reservedNo + ", enrolledDate="
				+ enrolledDate + ", roomNo=" + roomNo + ", empNo=" + empNo
				+ ", reservedStart=" + reservedStart + ", reservedEnd="
				+ reservedEnd + "]";
	}

}
