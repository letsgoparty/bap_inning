package com.app.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.dto.LodgingDTO;
import com.app.dto.RatingDTO;
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

	public List<RestaurantDTO> find_res_by_category(HashMap map) {
		return session.selectList("FindMapper.find_res_by_category", map);
	}

	public List<LodgingDTO> find_all_lod(int team_code) {
		return session.selectList("FindMapper.find_all_lod", team_code);
	}
	
	public List<LodgingDTO> find_lod_by_category(HashMap map) {
		return session.selectList("FindMapper.find_lod_by_category", map);
	}
	
	public String find_res_rating(String res_name) {
		return session.selectOne("FindMapper.find_res_rating", res_name);
	}
	
	public String find_lod_rating(String lodging_name) {
		return session.selectOne("FindMapper.find_lod_rating", lodging_name);
	}
	
	public List<RatingDTO> find_all_res_rating(int team_code) {
		return session.selectList("FindMapper.find_all_res_rating", team_code);
	}

	public List<RatingDTO> find_all_lod_rating(int team_code) {
		return session.selectList("FindMapper.find_all_lod_rating", team_code);
	}
	
	public List<RatingDTO> find_res_rating_by_category(HashMap map) {
		return session.selectList("FindMapper.find_res_rating_by_category", map);
	}
	
	public List<RatingDTO> find_lod_rating_by_category(HashMap map) {
		return session.selectList("FindMapper.find_lod_rating_by_category", map);
	}
}
