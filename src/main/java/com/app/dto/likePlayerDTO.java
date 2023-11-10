package com.app.dto;

public class likePlayerDTO {
	String userid;
	String team;
	String player;
	
	public likePlayerDTO() {
	}
	public likePlayerDTO(String userid, String team, String player) {
		super();
		this.userid = userid;
		this.team = team;
		this.player = player;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getTeam() {
		return team;
	}
	public void setTeam(String team) {
		this.team = team;
	}
	public String getPlayer() {
		return player;
	}
	public void setPlayer(String player) {
		this.player = player;
	}
	
	
}
