package com.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.ReservationDAO;
import com.vo.Reservation;

@Service
public class ReservationService {

	@Autowired
	ReservationDAO dao;

	// ����
	public boolean makeReservation(Reservation info) {
		return dao.makeReservation(info);
	}

	public List<HashMap<String, Object>> reservationListwithName(String roomNo) {
		return dao.reservationListwithName(roomNo);
	}

	public List<Reservation> getReservationList(String roomNo, String buildingNo) {
		return dao.getReservationList(roomNo, buildingNo);
	}
	
	public List<Reservation> reservationListByEmp (String empNo, String roomNo, String buildingNo ){
		return dao.reservationListByEmp(empNo, roomNo, buildingNo);
	}
	public boolean deleteReservation(String reservedNo) {
		return dao.deleteReservation(reservedNo);
	}
}
