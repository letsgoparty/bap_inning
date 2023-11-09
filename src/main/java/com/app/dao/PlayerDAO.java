package com.app.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.dto.PlayerDTO;

@Repository
public class PlayerDAO {
	@Autowired
	SqlSessionTemplate session;
	
	public List<PlayerDTO> find_LGplayer(HashMap<String, String> map) {
		return session.selectList("PlayerMapper.find_LGplayer", map);
	}
	
	public PlayerDTO find_player(HashMap<String, String> map) {
		return session.selectOne("PlayerMapper.find_player", map);
	}
}
