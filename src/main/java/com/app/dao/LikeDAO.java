package com.app.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.dto.LikeDTO;

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
}
