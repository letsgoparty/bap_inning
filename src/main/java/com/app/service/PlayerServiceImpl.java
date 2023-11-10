package com.app.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.dao.PlayerDAO;
import com.app.dto.PlayerDTO;
import com.app.dto.ScheduleDTO;
import com.app.dto.TeamDTO;

@Service
public class PlayerServiceImpl implements PlayerService {

	@Autowired
	PlayerDAO dao;
	
	@Override
	public List<PlayerDTO> find_Allplayer(HashMap<String, String> map) {
		return dao.find_Allplayer(map);
	}

	@Override
	public PlayerDTO find_player(HashMap<String, String> map) {
		return dao.find_player(map);
	}

	@Override
	public int saveSchedule(ScheduleDTO dto) {
		return dao.saveSchedule(dto);
	}

	@Override
	public List<ScheduleDTO> findSchedule() {
		return dao.findSchedule();
	}

	@Override
	public String findPostSeason() {
		return dao.findPostSeason();
	}

	@Override
	public List<TeamDTO> findRank() {
		return dao.findRank();
	}

	@Override
	public String findHighlight() {
		return dao.findHighlight();
	}

	@Override
	public String findRecord(String day) {
		return dao.findRecord(day);
	}

	@Override
	public int saveRecord(HashMap<String, String> map) {
		return dao.saveRecord(map);
	}

}
