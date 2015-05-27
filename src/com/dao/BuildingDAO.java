package com.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.vo.Building;


@Repository
public class BuildingDAO {
	
	@Autowired
	private SqlSession session;
	
	public List<Building> getBuildingList() {
		return session.selectList("getBuildingList");
	}
	
	public Building getSelectedBuildingList(String no) {
		return session.selectOne("getSelectedBuildingList", no);
	}
	

}
