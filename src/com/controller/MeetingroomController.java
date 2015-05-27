package com.controller;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.service.BuildingService;
import com.service.MeetingroomService;
import com.vo.Building;
import com.vo.Meetingroom;

@Controller
public class MeetingroomController {

	@Autowired
	private MeetingroomService service;

	@Autowired
	private BuildingService bService;


	// Ŭ���� ������ �ش��ϴ� ���÷� ��� �޾ƿ���
	@RequestMapping(value = "meetingRoomList.do")
	public String meetingroomList(Model m, HttpServletRequest request,
			@RequestParam("buildingNo") String buildingNo) {

		ArrayList<Meetingroom> meetingroomList = new ArrayList<Meetingroom>();
		try {
	
			meetingroomList = (ArrayList<Meetingroom>) service.meetingroomList(buildingNo);
			int listSize = meetingroomList.size();

			Building building = bService.getSelectedBuildingList(buildingNo);

			m.addAttribute("building", building);
			m.addAttribute("listSize", listSize);
			m.addAttribute("meetingroomList", meetingroomList);
			m.addAttribute("buildingNo", buildingNo);
			m.addAttribute("side", "side.jsp");
			m.addAttribute("content", "meetingroomList.jsp");
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return "index";
	}

}
