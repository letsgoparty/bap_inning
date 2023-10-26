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

	//회원정보 수정
	public int memberUpdate(MemberDTO memberDTO) {
		int n=session.update("MemberMapper.memberUpdate",memberDTO);
		return n;
	}

	//비밀번호 변경
	public int pwChange(HashMap<String, String> hashmap) {
		int n=session.update("MemberMapper.pwChange",hashmap);
		return n;
	}
	
}
