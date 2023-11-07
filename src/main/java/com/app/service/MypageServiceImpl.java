package com.app.service;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.app.dao.MypageDAO;
import com.app.dto.MemberDTO;
import com.app.dto.UpgradePageDTO;

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

	@Override
	public int memberDelete(String userid) {
		int n=dao.memberDelete(userid);
		return n;
	}
	
	////////////////////////
	//페이징처리
	
	//게시판
	@Override
	public UpgradePageDTO selectText(int curPage, int amount) {
		return dao.selectText(curPage,amount);
	}
	//게시판 총개수
	@Override
	public int totalCount_text() {
		return dao.totalCount_text();
	}

	//식당리뷰
	@Override
	public UpgradePageDTO select_r_review(int curPage, int amount) {
		return dao.select_r_review(curPage, amount);
	}
	
	
	

 
}

