package com.app.service;

import com.app.dto.Board;
import com.app.dto.PageDTO;

public interface BoardService {

	public abstract PageDTO selectList(int curPage);
	public abstract Board selectByNo(int no);
	public abstract int boardWrite(Board board);
	public abstract int boardUpdate(Board board);
	public abstract int boardDelete(int no);
}
