package com.app.dto;

import java.util.List;

import org.apache.ibatis.type.Alias;

@Alias("Board")
public class Board {

	/*
	 * 게시글 번호 board_num
	 * 제목 title
	 * 내용 text
	 * 작성자 userid
	 * 작성일 date
	 * 조회수 count
	 * 구단번호 team_code
	 */
	List<Reply> replyList;
	int board_num;
	String title;
	String text;
	String userid;
	String board_date;
	int count;
	int team_code;
	
	public Board() {
	}

	public Board(List<Reply> replyList, int board_num, String title, String text, String userid, String board_date, int count, int team_code) {
		super();
		this.replyList= replyList;
		this.board_num = board_num;
		this.title = title;
		this.text = text;
		this.userid = userid;
		this.board_date = board_date;
		this.count = count;
		this.team_code = team_code;
	}
	

	public List<Reply> getReplyList() {
		return replyList;
	}

	public void setReplyList(List<Reply> replyList) {
		this.replyList = replyList;
	}

	public int getBoard_num() {
		return board_num;
	}

	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getBoard_date() {
		return board_date;
	}

	public void setBoard_date(String board_date) {
		this.board_date = board_date;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getTeam_code() {
		return team_code;
	}

	public void setTeam_code(int team_code) {
		this.team_code = team_code;
	}

	@Override
	public String toString() {
		return "BoardDTO [replyList=" + replyList + ", board_num=" + board_num + ", title=" + title + ", text=" + text + ", userid=" + userid
				+ ", board_date=" + board_date + ", count=" + count + ", team_code=" + team_code + "]";
	}
	
	
	
}
