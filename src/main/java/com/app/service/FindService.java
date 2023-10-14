package com.app.service;

import com.app.dto.LodgingDTO;
import com.app.dto.RestaurantDTO;

public interface FindService {
	public RestaurantDTO find_res(String res_name);
	public LodgingDTO find_lod(String lodging_name);
}
