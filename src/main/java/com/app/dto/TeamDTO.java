package com.app.dto;

public class TeamDTO {
	String rank;
	String image;
	String title;
	String match;
	String victory;
	String defeat;
	String draw;
	String rate;
	String winning;
	String recent;
	
	public TeamDTO() {

	}

	public TeamDTO(String rank, String image, String title, String match, String victory, String defeat, String draw,
			String rate, String winning, String recent) {
		this.rank = rank;
		this.image = image;
		this.title = title;
		this.match = match;
		this.victory = victory;
		this.defeat = defeat;
		this.draw = draw;
		this.rate = rate;
		this.winning = winning;
		this.recent = recent;
	}

	public String getRank() {
		return rank;
	}

	public void setRank(String rank) {
		this.rank = rank;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getMatch() {
		return match;
	}

	public void setMatch(String match) {
		this.match = match;
	}

	public String getVictory() {
		return victory;
	}

	public void setVictory(String victory) {
		this.victory = victory;
	}

	public String getDefeat() {
		return defeat;
	}

	public void setDefeat(String defeat) {
		this.defeat = defeat;
	}

	public String getDraw() {
		return draw;
	}

	public void setDraw(String draw) {
		this.draw = draw;
	}

	public String getRate() {
		return rate;
	}

	public void setRate(String rate) {
		this.rate = rate;
	}

	public String getWinning() {
		return winning;
	}

	public void setWinning(String winning) {
		this.winning = winning;
	}

	public String getRecent() {
		return recent;
	}

	public void setRecent(String recent) {
		this.recent = recent;
	}
	
	
}
