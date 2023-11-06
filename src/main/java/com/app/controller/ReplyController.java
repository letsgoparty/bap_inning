package com.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.app.dto.Reply;
import com.app.service.ReplyService;

@Controller
//@RequestMapping(value = "/retrieve/", method = RequestMethod.GET)
public class ReplyController {

	@Autowired
	ReplyService replyService;

	// 댓글 입력
	@RequestMapping(value = "replyInsert", method = RequestMethod.GET)
	public String replyInsert(Reply reply) {
		reply.setUserid("xxx");
		System.out.println("dd");
		int a = reply.getBoard_num();
		int num = replyService.replyInsert(reply);
		return "redirect:retrieve?no=" + a;
	}

	// 댓글 삭제
	@RequestMapping(value = "/replydelete", method = RequestMethod.GET)
	public String replyDelet(int no) {
		int num = replyService.replyDelet(no);
		return "redirect:list";
	}

}
