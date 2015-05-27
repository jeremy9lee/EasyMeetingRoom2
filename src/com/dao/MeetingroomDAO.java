package com.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.vo.Meetingroom;

@Repository
public class MeetingroomDAO {
	
	@Autowired
	SqlSession session;
	
	public List<Meetingroom> meetingroomList(String buildingNo){		
		List<Meetingroom> meetingRoomList = session.selectList("meetingroomList", buildingNo);
		return meetingRoomList;
		
	}
	

}
