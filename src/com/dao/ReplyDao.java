package com.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.vo.Reply;


@Repository
public class ReplyDao {
	@Autowired
	private SqlSession session;
	
	public void insert(Reply vo) {
		session.insert("replyInsert", vo);
	}

	public void delete(String replyNo) {
		session.delete("replyDelete", replyNo);
	}

	public List<Map<Object, Object>> fetchList(String roomNo, String buildingNo) {
		Map map = new HashMap();
		map.put("roomNo", roomNo);
		map.put("buildingNo", buildingNo);
		List<Map<Object, Object>> listMap = new ArrayList<Map<Object, Object>>();
		listMap = session.selectList("list", map);
		return listMap;
	}
}
