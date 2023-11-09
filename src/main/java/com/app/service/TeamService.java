package com.app.service;

import org.springframework.stereotype.Service;

@Service
public class TeamService {
	public String team_name(int team_code) {
		String selectedTeam = null; // 나중에 수정하기
		switch (team_code) {
		case 1:
			selectedTeam = "SSG";
			break;
		case 2:
			selectedTeam = "키움";
			break;
		case 3:
			selectedTeam = "LG";
			break;
		case 4:
			selectedTeam = "KT";
			break;
		case 5:
			selectedTeam = "KIA";
			break;
		case 6:
			selectedTeam = "NC";
			break;
		case 7:
			selectedTeam = "삼성";
			break;
		case 8:
			selectedTeam = "롯데";
			break;
		case 9:
			selectedTeam = "두산";
			break;
		case 10:
			selectedTeam = "한화";
			break;
		default:
			break;
		}
		
		return selectedTeam; 
	}
}
