package com.app.dto;

public class ScheduleDTO {
	String day;
	String time;
	String team1;
	String vs;
	String team2;
	String location;
	public ScheduleDTO() {
	}
	public ScheduleDTO(String day, String time, String team1, String vs, String team2, String location) {

		this.day = day;
		this.time = time;
		this.team1 = team1;
		this.vs = vs;
		this.team2 = team2;
		this.location = location;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getTeam1() {
		return team1;
	}
	public void setTeam1(String team1) {
		this.team1 = team1;
	}
	public String getVs() {
		return vs;
	}
	public void setVs(String vs) {
		this.vs = vs;
	}
	public String getTeam2() {
		return team2;
	}
	public void setTeam2(String team2) {
		this.team2 = team2;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	@Override
	public String toString() {
		return "ScheduleDTO [day=" + day + ", time=" + time + ", team1=" + team1 + ", vs=" + vs + ", team2=" + team2
				+ ", location=" + location + "]";
	}
	
	
}
