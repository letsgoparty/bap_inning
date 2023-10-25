package com.app.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.dao.FindDAO;
import com.app.dao.LikeDAO;
import com.app.dto.LikeDTO;
import com.app.dto.LodgingDTO;
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
}
