package com.vo;

import java.io.Serializable;

public class Building implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String buildingNo;
	private String buildingName;
	private String buildingLocX;
	private String buildingLocY;
	private String buildingImg;
	
	public Building() {
		super();
	}
	
	public Building(String buildingNo, String buildingName, String buildingLocX,
			String buildingLocY, String buildingImg) {
		super();
		this.buildingNo = buildingNo;
		this.buildingName = buildingName;
		this.buildingLocX = buildingLocX;
		this.buildingLocY = buildingLocY;
		this.buildingImg = buildingImg;
	}
	
	public String getBuildingNo() {
		return buildingNo;
	}
	public void setBuildingNo(String buildingNo) {
		this.buildingNo = buildingNo;
	}
	public String getBuildingName() {
		return buildingName;
	}
	public void setBuildingName(String buildingName) {
		this.buildingName = buildingName;
	}
	public String getBuildingLocX() {
		return buildingLocX;
	}
	public void setBuildingLocX(String buildingLocX) {
		this.buildingLocX = buildingLocX;
	}
	public String getBuildingLocY() {
		return buildingLocY;
	}
	public void setBuildingLocY(String buildingLocY) {
		this.buildingLocY = buildingLocY;
	}
	public String getBuildingImg() {
		return buildingImg;
	}
	public void setBuildingImg(String buildingImg) {
		this.buildingImg = buildingImg;
	}

	@Override
	public String toString() {
		return "Building [buildingNo=" + buildingNo + ", buildingName="
				+ buildingName + ", buildingLocX=" + buildingLocX
				+ ", buildingLocY=" + buildingLocY + ", buildingImg="
				+ buildingImg + "]";
	}
	
	

	
	

}
