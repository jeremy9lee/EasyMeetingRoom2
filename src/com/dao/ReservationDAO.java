package com.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.vo.Reservation;

@Repository
public class ReservationDAO {

	@Autowired
	SqlSession session;
	
	// ����
	public boolean makeReservation(Reservation info){
		int r = session.insert("makeReservation", info);
		return r == 1;	
	}
	
	
	public List<HashMap<String, Object>> reservationListwithName (String roomNo){
		return session.selectList("reservationListwithName", roomNo);
	}
	
	public List<Reservation> getReservationList (String roomNo, String buildingNo){
		HashMap map  = new HashMap();
		map.put("roomNo",roomNo);
		map.put("buildingNo", buildingNo);
		System.out.println(roomNo + " '': ''" + buildingNo );
		return session.selectList("reservationList", map);
	}
	
	public List<Reservation> reservationListByEmp (String empNo, String roomNo, String buildingNo){
		HashMap map  = new HashMap();
		map.put("empNo", empNo);
		map.put("roomNo",roomNo);
		map.put("buildingNo", buildingNo);
		return session.selectList("reservationListByEmp", map);
	}

	public boolean deleteReservation(String reservedNo) {
		System.out.println("ㅇㅖ약번호"+reservedNo);
		int r = session.delete("deleteReservation", reservedNo);
		return r == 1;
	}
	
	
}
