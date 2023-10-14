package com.app.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.dto.LodgingDTO;
import com.app.dto.RestaurantDTO;

@Repository
public class FindDAO {

	@Autowired
	SqlSessionTemplate session;
	
	public RestaurantDTO find_res(String res_name) {
		return session.selectOne("FindMapper.find_res", res_name);
	}
	
	public LodgingDTO find_lod(String lodging_name) {
		return session.selectOne("FindMapper.find_lod", lodging_name);
	}
}
