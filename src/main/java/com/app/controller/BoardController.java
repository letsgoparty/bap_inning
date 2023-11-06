package com.app.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.app.dto.Board;
import com.app.dto.MemberDTO;
import com.app.dto.PageDTO;
import com.app.dto.Reply;
import com.app.service.BoardService;
import com.app.service.MemberService;
import com.app.service.ReplyService;

@Controller
public class BoardController {

	@Autowired
	BoardService service;
	@Autowired
	ReplyService replyService;
	
	

	// 1. 글쓰기 화면 보기
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String writeUI() {
		return "writeForm";
	}

	// 2. 글쓰기
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(Board board, HttpSession session) {
		// user sesstion넣기
		MemberDTO dto = (MemberDTO) session.getAttribute("login");
		board.setUserid(dto.getUserid());
		int num = service.boardWrite(board);
		System.out.println(num);
		return "redirect:list";
	}

	// 3.목록
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	@ModelAttribute("pageDTO")
	public PageDTO list(@RequestParam(value = "curPage", required = false, defaultValue = "1") int curPage,
			@RequestParam(value = "type", required = false, defaultValue = "null") String type,
			@RequestParam(value = "keyword", required = false, defaultValue = "null") String keyword,
			@RequestParam(value = "team", required = false, defaultValue = "null") String team) {
		
		//String[] team_code = { "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10" };
		PageDTO xx=service.selectList(curPage,type,keyword,team);
		return xx;
	}

	// 4. 글자세히 보기
	@RequestMapping(value = "/retrieve", method = RequestMethod.GET)
	@ModelAttribute("retrieve")
	public Board retrieve(int no) { // Board => void
		Board board = service.selectByNo(no);
		
		// 댓글 조회
		List<Reply> reply = replyService.replyList(no);
		board.setReplyList(reply);
		return board;
	}

	// 5. 글 수정
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(Board board) {
		int num = service.boardUpdate(board);
		return "redirect:list";
	}

	// 6. 글 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(int no) {
		int num = service.boardDelete(no);
		return "redirect:list";
	}
}