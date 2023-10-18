package com.app.service;

import java.util.List;

import com.app.dto.LodgingDTO;
import com.app.dto.RestaurantDTO;

public interface FindService {
	public RestaurantDTO find_res(String res_name);
	public LodgingDTO find_lod(String lodging_name);
	public List<RestaurantDTO> find_all_res(String res_addr);
	public List<LodgingDTO> find_all_lod(String lodging_addr);
	public List<LodgingDTO> find_all_lod_by_content(String lodging_content);
}
