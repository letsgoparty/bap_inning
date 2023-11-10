package com.app.service;

import java.util.HashMap;
import java.util.List;

import com.app.dto.MemberDTO;
import com.app.dto.UpgradePageDTO;

public interface MypageService {

	//마이페이지 기능 service
	
	public int memberUpdate(MemberDTO memberDTO);
	public int pwChange(HashMap<String, String> hashmap);
	public int memberDelete(String userid);
	
	//페이징처리_게시판보기
	public UpgradePageDTO selectText(String userid,int curPage,int amount);

	//페이징처리_댓글
	public UpgradePageDTO selectReply(String userid,int curPage, int amount);
	
	//페이징처리_식당리뷰
	public UpgradePageDTO select_r_review(String userid, int curPage,int amount);
	
	//페이징처리_숙소리뷰
	public UpgradePageDTO select_l_review(String userid,int curPage, int amount);
	
	//게시글 전체삭제
	public int deleteAll_myText(List<Integer> list);
	//댓글 전체삭제
	public int deleteAll_myReply(List<Integer> list);
}