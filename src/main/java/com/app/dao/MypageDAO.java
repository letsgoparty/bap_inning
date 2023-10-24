package com.app.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.app.dto.MemberDTO;

@Repository
public class MypageDAO {
	@Autowired
	SqlSessionTemplate session;

	

	
}
