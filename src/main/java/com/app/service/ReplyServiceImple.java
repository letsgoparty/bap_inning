package com.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.dao.ReplyDAO;
import com.app.dto.Reply;

@Service
public class ReplyServiceImple implements ReplyService {

	@Autowired
	ReplyDAO dao;
	
	@Override
	public List<Reply> replyList(int no) {
		return dao.replyList(no);
	}
	
	@Override
	public int replyInsert(Reply reply) {
		return dao.replyInsert(reply);
	}

	@Override
	public int replyDelet(int no) {
		return dao.replyDelet(no);
	}


}
