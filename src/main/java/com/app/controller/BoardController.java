package com.app.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.app.dto.Board;
import com.app.dto.PageDTO;
import com.app.service.BoardService;

@Controller
public class BoardController {

	@Autowired
	BoardService service;

	// 1. 글쓰기 화면 보기
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String writeUI() {
		return "writeForm";
	}

	// 2. 글쓰기
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(Board board) {
		int num = service.boardWrite(board);
		return "redirect:list";
	}

	// 3.목록
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	@ModelAttribute("pageDTO")
	public PageDTO list(@RequestParam(value = "curPage", required = false, defaultValue = "1") int curPage) {
		return service.selectList(curPage);
	}

	// 4. 글자세히 보기
	@RequestMapping(value = "/retrieve", method = RequestMethod.GET)
	@ModelAttribute("retrieve")
	public Board retrieve(int no) {
		Board board = service.selectByNo(no);
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