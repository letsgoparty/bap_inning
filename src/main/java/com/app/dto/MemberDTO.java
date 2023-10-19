package com.app.dto;

import org.apache.ibatis.type.Alias;

@Alias("MemberDTO")
public class MemberDTO {
    String userid;
    String password;
    String email;
    String nickname;
    int team_code;


    public MemberDTO() {
    }

    
    
    public MemberDTO(String userid, String password, String email, String nickname, int team_code) {

		this.userid = userid;
		this.password = password;
		this.email = email;
		this.nickname = nickname;
		this.team_code = team_code;
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



	@Override
	public String toString() {
		return "MemberDTO [userid=" + userid + ", password=" + password + ", email=" + email + ", nickname=" + nickname
				+ ", team_code=" + team_code + "]";
	}


}

	