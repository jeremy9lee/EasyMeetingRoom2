package com.dao;


import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.vo.Employee;
@Repository
public class EmployeeDAO {

	@Autowired
	private SqlSession session;	
	
	public Employee getEmployee(String empNo) throws SQLException {
		Employee employee = session.selectOne("getEmployee", empNo);
		return employee;
	}

}
