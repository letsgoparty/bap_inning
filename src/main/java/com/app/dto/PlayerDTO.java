package com.app.dto;

import org.apache.ibatis.type.Alias;

@Alias("PlayerDTO")
public class PlayerDTO {
	String team;
	int player_no; // 플레이어 넘버
	String player; // 플레이어 이름
	String name; // 플레이어 영문이름
	String position; // 포지션
	String image; // 이미지 링크
	String era; // 평균자책점
	String whip; // WHIP
	String c_category; // 승리/홀드/세이브
	String c_count; // 승리/홀드/세이브 카운트
	String inning; // 이닝
	String strikeout; // 탈삼진
	String batting; // 타율
	String hit; // 안타
	String homerun; // 홈런
	String rbi; // 타점
	String steal; // 도루
	int like_cnt;

	public PlayerDTO() {

	}


	public PlayerDTO(String team, int player_no, String player, String name, String position, String image, String era,
			String whip, String c_category, String c_count, String inning, String strikeout, String batting, String hit,
			String homerun, String rbi, String steal, int like_cnt) {
		super();
		this.team = team;
		this.player_no = player_no;
		this.player = player;
		this.name = name;
		this.position = position;
		this.image = image;
		this.era = era;
		this.whip = whip;
		this.c_category = c_category;
		this.c_count = c_count;
		this.inning = inning;
		this.strikeout = strikeout;
		this.batting = batting;
		this.hit = hit;
		this.homerun = homerun;
		this.rbi = rbi;
		this.steal = steal;
		this.like_cnt = like_cnt;
	}


	public int getLike_cnt() {
		return like_cnt;
	}


	public void setLike_cnt(int like_cnt) {
		this.like_cnt = like_cnt;
	}


	public String getTeam() {
		return team;
	}

	public void setTeam(String team) {
		this.team = team;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getPlayer_no() {
		return player_no;
	}

	public void setPlayer_no(int player_no) {
		this.player_no = player_no;
	}

	public String getPlayer() {
		return player;
	}

	public void setPlayer(String player) {
		this.player = player;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getEra() {
		return era;
	}

	public void setEra(String era) {
		this.era = era;
	}

	public String getWhip() {
		return whip;
	}

	public void setWhip(String whip) {
		this.whip = whip;
	}

	public String getC_category() {
		return c_category;
	}

	public void setC_category(String c_category) {
		this.c_category = c_category;
	}

	public String getC_count() {
		return c_count;
	}

	public void setC_count(String c_count) {
		this.c_count = c_count;
	}

	public String getInning() {
		return inning;
	}

	public void setInning(String inning) {
		this.inning = inning;
	}

	public String getStrikeout() {
		return strikeout;
	}

	public void setStrikeout(String strikeout) {
		this.strikeout = strikeout;
	}

	public String getBatting() {
		return batting;
	}

	public void setBatting(String batting) {
		this.batting = batting;
	}

	public String getHit() {
		return hit;
	}

	public void setHit(String hit) {
		this.hit = hit;
	}

	public String getHomerun() {
		return homerun;
	}

	public void setHomerun(String homerun) {
		this.homerun = homerun;
	}

	public String getRbi() {
		return rbi;
	}

	public void setRbi(String rbi) {
		this.rbi = rbi;
	}

	public String getSteal() {
		return steal;
	}

	public void setSteal(String steal) {
		this.steal = steal;
	}

	@Override
	public String toString() {
		return "PlayerDTO [player_no=" + player_no + ", player=" + player + ", name=" + name + ", position=" + position
				+ ", image=" + image + ", era=" + era + ", whip=" + whip + ", c_category=" + c_category + ", c_count="
				+ c_count + ", inning=" + inning + ", strikeout=" + strikeout + ", batting=" + batting + ", hit=" + hit
				+ ", homerun=" + homerun + ", rbi=" + rbi + ", steal=" + steal + "]";
	}

}
