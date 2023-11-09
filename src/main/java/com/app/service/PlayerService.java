package com.app.service;

import java.util.HashMap;
import java.util.List;

import com.app.dto.PlayerDTO;

public interface PlayerService {
	public List<PlayerDTO> find_LGplayer(HashMap<String, String> map);
	public PlayerDTO find_player(HashMap<String, String> map);
}
