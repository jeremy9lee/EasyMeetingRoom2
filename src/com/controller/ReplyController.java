package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.service.ReplyService;
import com.vo.Reply;

@Controller
@RequestMapping("/reply")
public class ReplyController {
	@Autowired
	private ReplyService service;
	
	@RequestMapping(value ={ "", "/", "/list" }, method = RequestMethod.GET)
	public String list(Model model) {
		List<Reply> list = service.fetchList();
		model.addAttribute("list", list);
		return "/reply";
	}

	@RequestMapping(value = { "/insert" }, method = RequestMethod.POST)
	public String insert(@ModelAttribute Reply vo) {
		service.insertContent(vo);
		return "redirect:/goToReservation.do";
	}

	@RequestMapping(value = {"/delete" }, method = RequestMethod.POST)
	public String delete(@ModelAttribute Reply vo) {
		service.deleteContent(vo);
		return "redirect:/reply";
	}
}
