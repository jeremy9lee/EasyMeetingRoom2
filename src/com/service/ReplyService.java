package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.ReplyDao;
import com.vo.Reply;

@Service
public class ReplyService {
	@Autowired
	private ReplyDao dao;
	
	public List<Reply> fetchList(){
		return dao.fetchList();
	}
	
	public void insertContent(Reply vo){
		dao.insert(vo);
	}

	public void deleteContent(Reply vo){
		dao.delete(vo);
	}
}
