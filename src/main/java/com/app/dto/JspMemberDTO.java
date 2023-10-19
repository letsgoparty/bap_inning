package com.app.dto;

import org.apache.ibatis.type.Alias;

@Alias("JspMemberDTO")
public class JspMemberDTO {
    String userid;
    String password;
    String email1;
    String email2;
    String nickname;
    int team_code;


    public JspMemberDTO() {
    }


	public JspMemberDTO(String userid, String password, String email1, String email2, String nickname, int team_code) {
		super();
		this.userid = userid;
		this.password = password;
		this.email1 = email1;
		this.email2 = email2;
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


	public String getEmail1() {
		return email1;
	}


	public void setEmail1(String email1) {
		this.email1 = email1;
	}


	public String getEmail2() {
		return email2;
	}


	public void setEmail2(String email2) {
		this.email2 = email2;
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
		return "JspMemberDTO [userid=" + userid + ", password=" + password + ", email1=" + email1 + ", email2=" + email2
				+ ", nickname=" + nickname + ", team_code=" + team_code + "]";
	}

}  
    
   