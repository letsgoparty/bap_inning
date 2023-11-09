package com.app.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.app.dao.MemberDAO;
import com.app.dto.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService  {
	@Autowired
	MemberDAO dao;
	
	
	
	@Override
	public MemberDTO idCheck(String userid) {
		MemberDTO dto = dao.idCheck(userid);
		return dto;
	}
	
	@Override
	public MemberDTO nicknameCheck(String nickname) {
		MemberDTO dto = dao.nicknameCheck(nickname);
		return dto;
	}
	
	
	@Override
	public int memberAdd(MemberDTO dbdto) {
		//System.out.println(dbdto);
		//return 0;
		int n = dao.memberAdd(dbdto);
		return n;
	}
	@Override
	public MemberDTO login(HashMap<String, String> map) {
		MemberDTO dbdto = dao.login(map);
		return dbdto;
	}
	
	
	@Override
	public MemberDTO mypage(String userid) {
		MemberDTO dto = dao.getMypage(userid);
		return dto;
	}
   
	
	@Override
	public String findEncodePW(HashMap<String, String> map) {
		return dao.findEncodePW(map);
	}
 
	
 
	@Override
	public MemberDTO authcodeconfirm(MemberDTO dto) {
		MemberDTO edto = dao.authcodeconfirm(dto);
		return edto;
	}
}





