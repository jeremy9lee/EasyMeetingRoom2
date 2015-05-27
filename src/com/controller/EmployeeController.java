package com.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.service.EmployeeService;
import com.vo.Employee;

@Controller
public class EmployeeController {

	@Autowired
	private EmployeeService service;
	
	

	@RequestMapping(value = "login.do")
	public String getEmployee(Model m, HttpServletRequest request, @RequestParam("empNo") String empNo) {

		Employee employee = null;
		HttpSession session = request.getSession();

		try {
			employee = service.getEmployee(empNo);

		} catch (SQLException e) {
			e.printStackTrace();
		}

		if (employee != null) {
			session.setAttribute("employee", employee);			
			return "redirect:goToMapPage.do";
		} else {
			m.addAttribute("message", "��ϵ� ��� �ƴ�");
			return null;
		}

	}
	
	
	@RequestMapping(value="logout.do")
	public String logout(Model m, HttpServletRequest request) {
	
		HttpSession session = request.getSession();
		session.invalidate();

		return "redirect:/main.do";
	}
	

}
