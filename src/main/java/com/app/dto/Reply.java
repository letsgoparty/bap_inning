package com.app.dto;

import org.apache.ibatis.type.Alias;


@Alias("Reply")
public class Reply {
	
	/*
	 reviews_num 
	 board_num
	 text
	 userid
	 replyDate
	 updateDate
	 */
	
	int reviews_num;
	int board_num;
	String text;
	String userid;
	int team_code;
	String replyDate;
	String updateDate;
	
	public Reply() {
	}
	
	public Reply(int reviews_num, int board_num, String text, String userid, String replyDate, String updateDate) {
		super();
		this.reviews_num = reviews_num;
		this.board_num = board_num;
		this.text = text;
		this.userid = userid;
		this.replyDate = replyDate;
		this.updateDate = updateDate;
	}
	public int getReviews_num() {
		return reviews_num;
	}
	public void setReviews_num(int reviews_num) {
		this.reviews_num = reviews_num;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
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
	public String getReplyDate() {
		return replyDate;
	}
	public void setReplyDate(String replyDate) {
		this.replyDate = replyDate;
	}
	public String getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}
	
	public int getTeam_code() {
		return team_code;
	}

	public void setTeam_code(int team_code) {
		this.team_code = team_code;
	}

	@Override
	public String toString() {
		return "ReplyDTO [reviews_num=" + reviews_num + ", board_num=" + board_num + ", text=" + text + ", userid="
				+ userid + ", replyDate=" + replyDate + ", updateDate=" + updateDate + "]";
	}
	
	
	
}
