package com.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.vo.Reply;


@Repository
public class ReplyDao {
	@Autowired
	private SqlSession session;
	
	public void insert(Reply vo) {
		session.insert("insert", vo);
	}

	public void delete(Reply vo) {
		session.delete("delete", vo);
	}

	public List<Reply> fetchList() {
		List<Reply> list = new ArrayList<Reply>();
		list = session.selectList("list");
		return list;
	}
}
