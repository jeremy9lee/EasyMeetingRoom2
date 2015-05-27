package com.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.BuildingDAO;
import com.vo.Building;

@Service
public class BuildingService {
	
	@Autowired
	private BuildingDAO dao;
		
	
	public List<Building> getBuildingList() throws SQLException{
		
		return  dao.getBuildingList();
	}
	
	public Building getSelectedBuildingList(String no) {
		return dao.getSelectedBuildingList(no);
	}

}
