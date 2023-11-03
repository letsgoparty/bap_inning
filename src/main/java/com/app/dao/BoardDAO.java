package com.app.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.dto.Board;
import com.app.dto.PageDTO;


@Repository
public class BoardDAO {

	
	@Autowired
	SqlSessionTemplate session;
	
	public int totalCount(String type, String keyword) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("type", type);
		map.put("keyword", keyword);
		return session.selectOne("BoardMapper.totalCount", map);
	}
	
	public PageDTO selectList(int curPage, String type, String keyword) {
		PageDTO pageDTO = new PageDTO();
		int offset = (curPage-1)*pageDTO.getPerPage();
		int limit = pageDTO.getPerPage();
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("type", type);
		map.put("keyword", keyword);
		System.out.println("map>>>>>>>>>" + map);
		List<Board> list =  session.selectList("BoardMapper.selectList", map, new RowBounds(offset, limit));
		
		pageDTO.setList(list);
		pageDTO.setCurPage(curPage);
		pageDTO.setTotalCount(totalCount(type, keyword));
		pageDTO.setType(type);
		pageDTO.setKeyword(keyword);
		System.out.println(list);
		return pageDTO;
	}

	// 조회수 증가
	public int readCnt(int no) {
		return session.update("BoardMapper.readCnt", no);
	}
	public Board selectByNo(int no) {
		//조회수 증가 메서드 호출
		int num = readCnt(no);
		return session.selectOne("BoardMapper.selectByNo", no);
	}

	public int boardWrite(Board board) {
		return session.insert("BoardMapper.boardWrite", board);
	}

	public int boardUpdate( Board board) {
		return session.update("BoardMapper.boardUpdate", board);
	}

	public int boardDelete(int no) {
		return session.delete("BoardMapper.boardDelete", no);
	}

}
