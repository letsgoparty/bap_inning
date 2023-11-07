package com.app.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.dao.BoardDAO;
import com.app.dto.Board;
import com.app.dto.PageDTO;


@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardDAO dao;


	
	@Override
	public PageDTO selectList(int curPage, String type, String keyword, String team) {
		return dao.selectList(curPage,type,keyword,team);
	}

	@Override
	public Board selectByNo(int no) {
		return dao.selectByNo(no);
	}

	@Override
	public int boardWrite(Board board) {
		return dao.boardWrite(board);
	}

	@Override
	public int boardUpdate(Board board) {
		return dao.boardUpdate(board);
	}

	@Override
	public int boardDelete(int no) {
		return dao.boardDelete(no);
	}

	@Override
	public int totalCount(String type, String keyword, String team) {
		return dao.totalCount(type, keyword, team);
	}

	@Override
	public int find_team(String userid) {
		return dao.find_team(userid);
	}

}
