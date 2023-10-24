package com.app.service;

import java.util.HashMap;
import java.util.List;

import com.app.dto.LodgingDTO;
import com.app.dto.RestaurantDTO;

public interface FindService {
	public RestaurantDTO find_res(String res_name);
	public LodgingDTO find_lod(String lodging_name);
	public List<RestaurantDTO> find_all_res(int team_code);
	public List<RestaurantDTO> find_res_by_category(HashMap map);
	public List<LodgingDTO> find_all_lod(int team_code);
	public List<LodgingDTO> find_lod_by_category(HashMap map);
	public String find_rating(String res_name);
}
