package com.app.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.dto.Board;
import com.app.dto.PageDTO;
import com.app.dto.Reply;

@Repository
public class BoardDAO {

	@Autowired
	SqlSessionTemplate session;

	public int totalCount(String type, String keyword, String team) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("type", type);
		map.put("keyword", keyword);
		map.put("team", team);
		return session.selectOne("BoardMapper.totalCount", map);
	}

	public PageDTO selectList(int curPage, String type, String keyword, String team) {
		PageDTO pageDTO = new PageDTO();
		int offset = (curPage - 1) * pageDTO.getPerPage();
		int limit = pageDTO.getPerPage();

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("type", type);
		map.put("keyword", keyword);
		map.put("team", team);
		System.out.println("map>>>>>>>>>" + map);
		List<Board> list = session.selectList("BoardMapper.selectList", map, new RowBounds(offset, limit));
		System.out.println("aa" + list);
		pageDTO.setList(list);
		pageDTO.setCurPage(curPage);
		pageDTO.setTotalCount(totalCount(type, keyword, team));
		pageDTO.setType(type);
		pageDTO.setKeyword(keyword);
		pageDTO.setTeam(team);
		return pageDTO;
	}

	// 조회수 증가
	public int readCnt(int no) {
		return session.update("BoardMapper.readCnt", no);
	}

	public Board selectByNo(int no) {
		// 조회수 증가 메서드 호출
		int num = readCnt(no);
		List<Reply> replyList = session.selectList("ReplyMapper.replyList", no);
		System.out.println("reply" + replyList);
		return session.selectOne("BoardMapper.selectByNo", no);
	}

	public int boardWrite(Board board) {
		return session.insert("BoardMapper.boardWrite", board);
	}

	public int boardUpdate(Board board) {
		return session.update("BoardMapper.boardUpdate", board);
	}

	public int boardDelete(int no) {
		return session.delete("BoardMapper.boardDelete", no);
	}

	public int find_team(String userid) {
		return session.selectOne("BoardMapper.find_team", userid);
	}

	public int find_seq() {
		return session.selectOne("BoardMapper.find_seq");
	}

	public int save_url(HashMap<String, Object> map) {
		return session.insert("BoardMapper.save_url", map);
	}

	public List<String> find_img(int board_num) {
		return session.selectList("BoardMapper.find_img", board_num);
	}

	public int delete_img(int board_num) {
		return session.delete("BoardMapper.delete_img", board_num);
	}
}
