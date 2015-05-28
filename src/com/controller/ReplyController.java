package com.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.service.ReplyService;
import com.vo.Reply;

@Controller
public class ReplyController {
	@Autowired
	private ReplyService service;

	@RequestMapping(value = { "replyInsert.do" }, method = RequestMethod.POST)
	public String insert(@RequestParam(value="empNo", required=false) String empNo, 
	        @RequestParam(value="buildingNo", required=false) String buildingNo, 
	        @RequestParam(value="roomNo", required=false) String roomNo,
	        @RequestParam(value="content", required=false) String content,
	        Model model) {
	
		Reply vo = new Reply();
		vo.setEmpNo(empNo);
		vo.setBuildingNo(buildingNo);
		vo.setRoomNo(roomNo);
		vo.setContent(content);
		System.out.println(vo.toString());
		model.addAttribute("roomNo", roomNo);
		model.addAttribute("buildingNo", buildingNo);
		service.insertContent(vo);
		return "redirect:/goToReservation.do";
	}

	@RequestMapping(value = {"replyDelete.do" }, method = RequestMethod.GET)
	public String delete(@RequestParam(value="replyNo", required=false) String replyNo,
			@RequestParam(value="buildingNo", required=false) String buildingNo, 
	        @RequestParam(value="roomNo", required=false) String roomNo,
	        Model model) {
		model.addAttribute("roomNo", roomNo);
		model.addAttribute("buildingNo", buildingNo);
		System.out.println(roomNo+":"+buildingNo);
		service.deleteContent(replyNo);
		return "redirect:/goToReservation.do";
	}
}
