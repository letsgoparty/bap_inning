package com.app.service;

import java.util.HashMap;
import java.util.List;

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
	public UpgradePageDTO selectText(String userid,int curPage, int amount) {
		return dao.selectText(userid,curPage,amount);
	}

	//식당리뷰
	@Override
	public UpgradePageDTO select_r_review(String userid,int curPage, int amount) {
		return dao.select_r_review(userid, curPage, amount);
	}

	//댓글
	@Override
	public UpgradePageDTO selectReply(String userid,int curPage, int amount) {
		return dao.selectReply(userid,curPage, amount);
	}

	//숙소 리뷰
	@Override
	public UpgradePageDTO select_l_review(String userid,int curPage, int amount) {
		return dao.select_l_review(userid,curPage, amount);
	}
/////////////////////전체삭제 
	
	//게시글 전체삭제
	@Override
	public int deleteAll_myText(List<Integer> list) {
		return dao.deleteAll_myText(list);
	}
	//댓글 전체삭제
	@Override
	public int deleteAll_myReply(List<Integer> list) {
		return dao.deleteAll_myReply(list);
	}


	
	

 
}

