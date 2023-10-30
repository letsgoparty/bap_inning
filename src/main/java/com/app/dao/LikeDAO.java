package com.app.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.dto.LikeDTO;
import com.app.dto.LodgingDTO;
import com.app.dto.RatingDTO;
import com.app.dto.RestaurantDTO;

@Repository
public class LikeDAO {

	@Autowired
	SqlSessionTemplate session;
	
	public int like_res(LikeDTO dto) {
		return session.insert("LikeMapper.like_res", dto);
	}
	public int like_lod(LikeDTO dto) {
		return session.insert("LikeMapper.like_lod", dto);
	}
	
	public List<Object> find_like_res(String userid) {
		return session.selectList("LikeMapper.find_like_res", userid);
	}
	
	public List<RestaurantDTO> find_like_res_info(List<Object> list) {
		return session.selectList("LikeMapper.find_like_res_info", list);
	}
	
	public List<Object> find_like_lod(String userid) {
		return session.selectList("LikeMapper.find_like_lod", userid);
	}
	
	public List<LodgingDTO> find_like_lod_info(List<Object> list) {
		return session.selectList("LikeMapper.find_like_lod_info", list);
	}
	
	public int delete_like_res(HashMap<String, Object> map) {
		return session.delete("LikeMapper.delete_like_res", map);
	}
	
	public int delete_like_lod(HashMap<String, Object> map) {
		return session.delete("LikeMapper.delete_like_lod", map);
	}
	
	public List<RatingDTO> find_res_rating(String userid) {
		return session.selectList("LikeMapper.find_res_rating", userid);
	}
	
	public List<RatingDTO> find_lod_rating(String userid) {
		return session.selectList("LikeMapper.find_lod_rating", userid);
	}
	
	public int deleteAll_res_like(List<Integer> list) {
		return session.delete("LikeMapper.deleteAll_res_like", list);
	}
	
	public int deleteAll_lod_like(List<Integer> list) {
		return session.delete("LikeMapper.deleteAll_lod_like", list);
	}
}