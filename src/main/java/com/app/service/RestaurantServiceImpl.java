package com.app.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.dao.RestaurantDAO;
import com.app.dto.RestaurantDTO;

@Service
public class RestaurantServiceImpl implements RestaurantService {

	@Autowired
	RestaurantDAO dao;
	
	@Override
	public RestaurantDTO find_res(String res_name) {
		return dao.find_res(res_name);
	}

}
