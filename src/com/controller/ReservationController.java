package com.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.service.ReplyService;
import com.service.ReservationService;
import com.vo.Employee;
import com.vo.Reply;
import com.vo.Reservation;

@Controller
public class ReservationController {

	@Autowired
	ReservationService service;
	@Autowired
	ReplyService rservice;

	@RequestMapping(value = "makeReservation.do")
	public String makeReservation(Model m, HttpServletRequest request,
			@RequestParam("buildingNo") String buildingNo,
			@RequestParam("roomNo") String roomNo,
			@RequestParam("empNo") String empNo,
			@RequestParam("start") Date start, @RequestParam("end") Date end) {

		System.out.println("ggg");
		Reservation info = new Reservation(buildingNo, roomNo, empNo, start,
				end);
		boolean flag = service.makeReservation(info);

		if (flag == false) {
			m.addAttribute("message", "�������");
			return "redirect:meegintroomList.do";
		}
		m.addAttribute("roomNo", roomNo);
		m.addAttribute("buildingNo", buildingNo);
		return "redirect:/goToReservation.do";
	}

	@RequestMapping(value = "goToReservation.do")
	public String goToReservation(Model m, HttpServletRequest request,
			@RequestParam("roomNo") String roomNo,
			@RequestParam("buildingNo") String buildingNo) {

		System.out.println("여기까지당");
		ArrayList<Reservation> rList = (ArrayList<Reservation>) service
				.getReservationList(roomNo, buildingNo);
		System.out.println("들어옴.");
		System.out.println("buildingNo : " + buildingNo);
		HttpSession session = request.getSession();
		m.addAttribute("reservationList", rList);
		m.addAttribute("employee", session.getAttribute("employee"));
		m.addAttribute("roomNo", roomNo);
		m.addAttribute("buildingNo", buildingNo);
		m.addAttribute("side", "side.jsp");
		m.addAttribute("content", "calendar.jsp");

		List<Map<Object, Object>> fetchList = rservice.fetchList(roomNo,
				buildingNo);
		m.addAttribute("list", fetchList);
		for (int i = 0; i < fetchList.size(); i++) {
			for (Object map : fetchList.get(i).keySet()) {
				System.out.print(map + " : " +fetchList.get(i).get(map) + " /");
			}

		}

		return "index";
	}

	@RequestMapping(value = "getReservationTable.do")
	@ResponseBody
	public Map getReservations(Model m, HttpServletRequest request,
			@RequestParam("roomNo") String roomNo,
			@RequestParam("empNo") String empNo,
			@RequestParam("buildingNo") String buildingNo) {

		System.out.println("fnffn");
		Map responseMap = new HashMap();

		ArrayList<Reservation> rList = (ArrayList<Reservation>) service
				.getReservationList(roomNo, buildingNo);

		System.out.println(rList.size() + ":");
		HttpSession session = request.getSession();

		Employee e = (Employee) session.getAttribute("employee");

		ArrayList<Reservation> rListByNo = (ArrayList<Reservation>) service
				.reservationListByEmp(empNo, roomNo, buildingNo);
		responseMap.put("reservationList", rList);
		responseMap.put("employee", session.getAttribute("employee"));
		responseMap.put("size", rList.size());
		responseMap.put("empNo", request.getParameter("empNo"));
		responseMap.put("rListByNo", rListByNo);
		responseMap.put("rsize", rListByNo.size());

		return responseMap;
	}

	@RequestMapping(value = "deleteSelectedReservation.do")
	@ResponseBody
	public Map deleteReservation(Model m, HttpServletRequest request,
			@RequestParam("reservedNo") String reservedNo,
			@RequestParam("roomNo") String roomNo) {

		Map responseMap = new HashMap();
		service.deleteReservation(reservedNo);
		System.out.println("삭제페이지");
		responseMap.put("success", true);

		return responseMap;

	}

}
