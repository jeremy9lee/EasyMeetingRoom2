package com.service;

import java.sql.SQLException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.dao.MeetingroomDAO;
import com.vo.Meetingroom;


@Service
public class MeetingroomService {
	
	@Autowired
	MeetingroomDAO dao;
	
	public List<Meetingroom> meetingroomList(String buildingNo) throws SQLException{
		return dao.meetingroomList(buildingNo);
	}

}
