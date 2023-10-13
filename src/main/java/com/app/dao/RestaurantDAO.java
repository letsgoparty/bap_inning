package com.app.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.dto.RestaurantDTO;

@Repository
public class RestaurantDAO {

	@Autowired
	SqlSessionTemplate session;
	
	public RestaurantDTO find_res(String res_name) {
		return session.selectOne("RestaurantMapper.find_res", res_name);
	}
	
	
	
	
}
