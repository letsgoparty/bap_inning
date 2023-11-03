package com.app.service;

import java.util.HashMap;

import com.app.dto.MemberDTO;
import com.app.dto.UpgradePageDTO;

public interface MypageService {

	//마이페이지 기능 service
	
	public int memberUpdate(MemberDTO memberDTO);
	public int pwChange(HashMap<String, String> hashmap);
	public int memberDelete(String userid);
	
	//페이징처리
	public UpgradePageDTO selectText(int curPage);
	public int totalCount();
}