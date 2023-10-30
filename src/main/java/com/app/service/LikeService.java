package com.app.service;

import java.util.HashMap;
import java.util.List;

import com.app.dto.LikeDTO;
import com.app.dto.LodgingDTO;
import com.app.dto.RatingDTO;
import com.app.dto.RestaurantDTO;

public interface LikeService {
	public int like_res(LikeDTO dto);
	public int like_lod(LikeDTO dto);
	public List<Object> find_like_res(String userid);
	public List<RestaurantDTO> find_like_res_info(List<Object> list);
	public List<Object> find_like_lod(String userid);
	public List<LodgingDTO> find_like_lod_info(List<Object> list);
	public int delete_like_res(HashMap<String, Object> map);
	public int delete_like_lod(HashMap<String, Object> map);
	public List<RatingDTO> find_res_rating(String userid);
	public List<RatingDTO> find_lod_rating(String userid);
	public int deleteAll_res_like(List<Integer> list);
	public int deleteAll_lod_like(List<Integer> list);
}