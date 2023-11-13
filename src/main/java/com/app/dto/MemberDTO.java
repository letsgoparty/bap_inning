package com.app.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

@Alias("MemberDTO")
public class MemberDTO {
    String userid;
    String password;
    String email;
    String nickname;
    int team_code;
    String authcode;
	java.sql.Timestamp cretime;
	int board_count;
    int comment_count;
    int res_review_count;
    int lod_review_count;
    String profileimgurl;
	
	public MemberDTO() {	
	}


	public MemberDTO(String userid, String password, String email, String nickname, int team_code,
			String authcode, Timestamp cretime, String profileimgurl) {
		super();
		this.userid = userid;
		this.password = password;
		this.email = email;
		this.nickname = nickname;
		this.team_code = team_code;
		this.authcode = authcode;
		this.cretime = cretime;
		this.profileimgurl = profileimgurl;
	}


	public String getUserid() {
		return userid;
	}


	public void setUserid(String userid) {
		this.userid = userid;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getNickname() {
		return nickname;
	}


	public void setNickname(String nickname) {
		this.nickname = nickname;
	}


	public int getTeam_code() {
		return team_code;
	}


	public void setTeam_code(int team_code) {
		this.team_code = team_code;
	}



	public String getAuthcode() {
		return authcode;
	}


	public void setAuthcode(String authcode) {
		this.authcode = authcode;
	}


	public java.sql.Timestamp getCretime() {
		return cretime;
	}


	public void setCretime(java.sql.Timestamp cretime) {
		this.cretime = cretime;
	}

	public String getProfileimgurl() {
		return profileimgurl;
	}


	public void setProfileimgurl(String profileimgurl) {
		this.profileimgurl = profileimgurl;
	}
	
	
	public int getBoard_count() {
		return board_count;
	}

	public void setBoard_count(int board_count) {
		this.board_count = board_count;
	}

	public int getComment_count() {
		return comment_count;
	}

	public void setComment_count(int comment_count) {
		this.comment_count = comment_count;
	}

	public int getRes_review_count() {
		return res_review_count;
	}

	public void setRes_review_count(int res_review_count) {
		this.res_review_count = res_review_count;
	}

	public int getLod_review_count() {
		return lod_review_count;
	}

	public void setLod_review_count(int lod_review_count) {
		this.lod_review_count = lod_review_count;
	}
	

	@Override
	public String toString() {
		return "MemberDTO [userid=" + userid + ", password=" + password + ", email=" + email + ", nickname=" + nickname
				+ ", team_code=" + team_code + ", authcode=" + authcode + ", cretime=" + cretime + ", profileimgurl="
				+ profileimgurl + "]";
	}
	
	
}

	