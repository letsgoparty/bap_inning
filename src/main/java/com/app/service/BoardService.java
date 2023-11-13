package com.app.service;

import java.util.HashMap;
import java.util.List;

import com.app.dto.Board;
import com.app.dto.PageDTO;

public interface BoardService {

	public abstract PageDTO selectList(int curPage, String type, String keyword, String team);
	public abstract Board selectByNo(int no);
	public abstract int boardWrite(Board board);
	public abstract int boardUpdate(Board board);
	public abstract int boardDelete(int no);
	public abstract int totalCount(String type, String keyword, String team);
	public int find_team(String userid);
	public int find_seq();
	public int save_url(HashMap<String, Object> map);
	public List<String> find_img(int board_num);
	public int delete_img(int board_num);
	public String nickname(String userid);
	
}
