package com.app.service;

import java.util.List;

import com.app.dto.Reply;

public interface ReplyService {

	// 목록
	public List<Reply> replyList(int no);
	// 등록
	public int replyInsert(Reply reply);
	// 삭제
	public int replyDelet(int no);
	
}
