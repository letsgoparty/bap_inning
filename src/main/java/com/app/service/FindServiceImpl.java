package com.app.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.dao.FindDAO;
import com.app.dto.LodgingDTO;
import com.app.dto.RestaurantDTO;

@Service
public class FindServiceImpl implements FindService {

	@Autowired
	FindDAO dao;
	
	@Override
	public RestaurantDTO find_res(String res_name) {
		return dao.find_res(res_name);
	}

	@Override
	public LodgingDTO find_lod(String lodging_name) {
		return dao.find_lod(lodging_name);
	}

	@Override
	public List<RestaurantDTO> find_all_res(int team_code ) {
		return dao.find_all_res(team_code);
	}

	@Override
	public List<LodgingDTO> find_all_lod(int team_code) {
		return dao.find_all_lod(team_code);
	}

	@Override
	public List<RestaurantDTO> find_res_by_category(HashMap map) {
		return dao.find_res_by_category(map);
	}

	@Override
	public List<LodgingDTO> find_lod_by_category(HashMap map) {
		return dao.find_lod_by_category(map);
	}

	@Override
	public String find_rating(String res_name) {
		return dao.find_rating(res_name);
	}
}
