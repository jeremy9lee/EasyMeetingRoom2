package com.service;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.EmployeeDAO;
import com.vo.Building;
import com.vo.Employee;

@Service
public class EmployeeService {
	
	@Autowired
	EmployeeDAO dao;	

	public Employee getEmployee(String empNo) throws SQLException{
		return dao.getEmployee(empNo);
	}

}
