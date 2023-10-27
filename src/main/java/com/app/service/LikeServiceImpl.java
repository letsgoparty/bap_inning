package com.app.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.dao.FindDAO;
import com.app.dao.LikeDAO;
import com.app.dto.LikeDTO;
import com.app.dto.LodgingDTO;
import com.app.dto.RatingDTO;
import com.app.dto.RestaurantDTO;

@Service
public class LikeServiceImpl implements LikeService {
	
	@Autowired
	LikeDAO dao;

	@Override
	public int like_res(LikeDTO dto) {
		return dao.like_res(dto);
	}

	@Override
	public int like_lod(LikeDTO dto) {
		return dao.like_lod(dto);
	}

	@Override
	public List<Object> find_like_res(String userid) {
		return dao.find_like_res(userid);
	}

	@Override
	public List<RestaurantDTO> find_like_res_info(List<Object> list) {
		return dao.find_like_res_info(list);
	}

	@Override
	public List<Object> find_like_lod(String userid) {
		return dao.find_like_lod(userid);
	}

	@Override
	public List<LodgingDTO> find_like_lod_info(List<Object> list) {
		return dao.find_like_lod_info(list);
	}

	@Override
	public int delete_like_res(HashMap<String, Object> map) {
		return dao.delete_like_res(map);
	}

	@Override
	public int delete_like_lod(HashMap<String, Object> map) {
		return dao.delete_like_lod(map);
	}

	@Override
	public List<RatingDTO> find_res_rating(String userid) {
		return dao.find_res_rating(userid);
	}

	@Override
	public List<RatingDTO> find_lod_rating(String userid) {
		return dao.find_lod_rating(userid);
	}
}
