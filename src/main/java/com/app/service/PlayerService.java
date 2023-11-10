package com.app.service;

import java.util.HashMap;
import java.util.List;

import com.app.dto.PlayerDTO;
import com.app.dto.ScheduleDTO;
import com.app.dto.TeamDTO;

public interface PlayerService {
	public List<PlayerDTO> find_Allplayer(HashMap<String, String> map);
	public PlayerDTO find_player(HashMap<String, String> map);
	public int saveSchedule(ScheduleDTO dto);
	public List<ScheduleDTO> findSchedule();
	public String findPostSeason();
	public List<TeamDTO> findRank();
	public String findHighlight();
	public String findRecord(String day);
	public int saveRecord(HashMap<String, String> map);
}
