package com.app.service;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.app.dao.MypageDAO;
import com.app.dto.MemberDTO;

@Service
public class MypageServiceImpl implements MypageService  {
	//마이페이지 기능 serviceImpl
	
	@Autowired
	MypageDAO dao;


	@Override
	public int memberUpdate(MemberDTO memberDTO) {
		int n=dao.memberUpdate(memberDTO);
		return n;
	}

	@Override
	public int pwChange(HashMap<String, String> hashmap) {
		int n=dao.pwChange(hashmap);
	
		return n;
	}
	
	
	

 
}

