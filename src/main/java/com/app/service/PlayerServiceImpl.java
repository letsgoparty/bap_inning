package com.app.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.dao.PlayerDAO;
import com.app.dto.PlayerDTO;

@Service
public class PlayerServiceImpl implements PlayerService {

	@Autowired
	PlayerDAO dao;
	
	@Override
	public List<PlayerDTO> find_LGplayer(HashMap<String, String> map) {
		return dao.find_LGplayer(map);
	}

	@Override
	public PlayerDTO find_player(HashMap<String, String> map) {
		return dao.find_player(map);
	}

}
