package com.vo;

import java.io.Serializable;

public class Reply implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private String replyNo;
	private String empNo;
	private String buildingNo;
	private String roomNo;
	private String content;
	
	
	public Reply() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Reply(String replyNo, String empNo, String buildingNo,
			String roomNo, String content) {
		super();
		this.replyNo = replyNo;
		this.empNo = empNo;
		this.buildingNo = buildingNo;
		this.roomNo = roomNo;
		this.content = content;
	}
	public String getReplyNo() {
		return replyNo;
	}
	public void setReplyNo(String replyNo) {
		this.replyNo = replyNo;
	}
	public String getEmpNo() {
		return empNo;
	}
	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}
	public String getBuildingNo() {
		return buildingNo;
	}
	public void setBuildingNo(String buildingNo) {
		this.buildingNo = buildingNo;
	}
	public String getRoomNo() {
		return roomNo;
	}
	public void setRoomNo(String roomNo) {
		this.roomNo = roomNo;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "Reply [replyNo=" + replyNo + ", empNo=" + empNo
				+ ", buildingNo=" + buildingNo + ", roomNo=" + roomNo
				+ ", content=" + content + "]";
	}
	
	
}
