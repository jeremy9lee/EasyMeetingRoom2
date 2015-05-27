package com.vo;

import java.io.Serializable;

public class Meetingroom implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String roomNo;
	private String buildingNo;
	private String capacity;
	private String floor;
	
	public Meetingroom() {
		super();
	}
	
	public Meetingroom(String roomNo, String buildingNo, String capacity,
			String floor) {
		super();
		this.roomNo = roomNo;
		this.buildingNo = buildingNo;
		this.capacity = capacity;
		this.floor = floor;
	}
	
	public String getRoomNo() {
		return roomNo;
	}
	public void setRoomNo(String roomNo) {
		this.roomNo = roomNo;
	}
	public String getBuildingNo() {
		return buildingNo;
	}
	public void setBuildingNo(String buildingNo) {
		this.buildingNo = buildingNo;
	}
	public String getCapacity() {
		return capacity;
	}
	public void setCapacity(String capacity) {
		this.capacity = capacity;
	}
	public String getFloor() {
		return floor;
	}
	public void setFloor(String floor) {
		this.floor = floor;
	}
	
	@Override
	public String toString() {
		return "Meetingroom [roomNo=" + roomNo + ", buildingNo=" + buildingNo
				+ ", capacity=" + capacity + ", floor=" + floor + "]";
	}
	
	
	
	
}
