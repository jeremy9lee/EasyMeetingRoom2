package com.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.service.BuildingService;
import com.vo.Building;

@Controller
public class BuildingController {

	
	@Autowired
	private BuildingService service;
	
	
	HttpSession session;
	
	@RequestMapping(value = "/main.do")
	public String main(Model m) {
		
		m.addAttribute("content", "login.jsp");
		return "index";
	}

	
	@RequestMapping(value = "/goToMapPage.do")
	public String goToMapPage(Model m) {
		
		m.addAttribute("content", "meetingRoomMap.jsp");
		m.addAttribute("side", "side.jsp");
		
		return "index";
	}
	
	
	@RequestMapping(value = "/getAllBuildingLocation.do")
	@ResponseBody
	public Map<String,Object> getAllBuildingLocation(Model m){
		Map<String,Object> responseMap = new HashMap();

		try {
			ArrayList<Building> buildingList = (ArrayList<Building>) service.getBuildingList();
			
			responseMap.put("buildingList", buildingList);
			responseMap.put("size", buildingList.size());
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return responseMap;
		
	}
	
	@RequestMapping(value = "/buildingView.do")	
	@ResponseBody
	public Map buildingView(Model m, @RequestParam("buildingNo") String no){
		Map responseMap = new HashMap();
		Building building = service.getSelectedBuildingList(no);
		responseMap.put("building", building);
		return responseMap;
	}
}
