package com.app.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.app.dao.MemberDAO;
import com.app.dto.MemberDTO;

@Service
public class MypageServiceImpl implements MypageService  {
	@Autowired
	MemberDAO dao;
	

 
}





