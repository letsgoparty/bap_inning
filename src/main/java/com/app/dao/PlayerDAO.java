package com.app.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.dto.PlayerDTO;
import com.app.dto.ScheduleDTO;
import com.app.dto.TeamDTO;

@Repository
public class PlayerDAO {
	@Autowired
	SqlSessionTemplate session;
	
	public List<PlayerDTO> find_Allplayer(HashMap<String, String> map) {
		return session.selectList("PlayerMapper.find_Allplayer", map);
	}
	
	public PlayerDTO find_player(HashMap<String, String> map) {
		return session.selectOne("PlayerMapper.find_player", map);
	}
	
	public int saveSchedule(ScheduleDTO dto) {
		return session.insert("PlayerMapper.saveSchedule", dto);
	}
	
	public List<ScheduleDTO> findSchedule() {
		return session.selectList("PlayerMapper.findSchedule");
	}
	
	public int deleteSchedule() {
		return session.delete("PlayerMapper.deleteSchedule");
	}
	
	public int savePostSeason(String post) {
		return session.insert("PlayerMapper.savePostSeason", post);
	}
	
	public int deletePostSeason() {
		return session.delete("PlayerMapper.deletePostSeason");
	}
	
	public String findPostSeason() {
		return session.selectOne("PlayerMapper.findPostSeason");
	}
	
	public int saveRank(TeamDTO dto) {
		return session.insert("PlayerMapper.saveRank", dto);
	}
	
	public int deleteRank() {
		return session.delete("PlayerMapper.deleteRank");
	}
	
	public List<TeamDTO> findRank() {
		return session.selectList("PlayerMapper.findRank");
	}
	
	public int saveHighlight(String highlight) {
		return session.insert("PlayerMapper.saveHighlight", highlight);
	}
	
	public int deleteHighlight() {
		return session.delete("PlayerMapper.deleteHighlight");
	}
	
	public String findHighlight() {
		return session.selectOne("PlayerMapper.findHighlight");
	}
	
	public String findRecord(String day) {
		return session.selectOne("PlayerMapper.findRecord", day);
	}
	
	public int saveRecord(HashMap<String, String> map) {
		return session.insert("PlayerMapper.saveRecord", map);
	}
	
}
