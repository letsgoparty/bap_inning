package com.app.service;

import java.util.HashMap;

import com.app.dto.MemberDTO;
import com.app.dto.UpgradePageDTO;

public interface MypageService {

	//마이페이지 기능 service
	
	public int memberUpdate(MemberDTO memberDTO);
	public int pwChange(HashMap<String, String> hashmap);
	public int memberDelete(String userid);
	
	//페이징처리_게시판보기
	public UpgradePageDTO selectText(int curPage,int amount);
	public int totalCount_text();

	//페이징처리_댓글
	public int totalCount_reply();
	public UpgradePageDTO selectReply(int curPage, int amount);
	
	//페이징처리_식당리뷰
	public UpgradePageDTO select_r_review(int curPage,int amount);
	
	
	
}