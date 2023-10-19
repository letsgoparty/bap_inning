package com.app.dao;

import java.util.HashMap;
import java.util.List;

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
	
	public List<RestaurantDTO> find_all_res(int team_code) {
		return session.selectList("FindMapper.find_all_res", team_code);
	}

	public List<RestaurantDTO> find_KOR_res(HashMap map) {
		return session.selectList("FindMapper.find_KOR_res", map);
	}

	public List<LodgingDTO> find_all_lod(String lodging_addr) {
		return session.selectList("FindMapper.find_all_lod", lodging_addr);
	}
	
	public List<LodgingDTO> find_all_lod_by_content(String lodging_content) {
		return session.selectList("FindMapper.find_all_lod_by_content", lodging_content);
	}
}
