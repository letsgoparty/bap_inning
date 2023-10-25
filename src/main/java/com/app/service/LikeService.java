package com.app.service;

import java.util.HashMap;
import java.util.List;

import com.app.dto.LikeDTO;
import com.app.dto.LodgingDTO;
import com.app.dto.RestaurantDTO;

public interface LikeService {
	public int like_res(LikeDTO dto);
	public int like_lod(LikeDTO dto);
}
