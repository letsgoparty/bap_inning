package com.app.service;

import java.util.HashMap;

import com.app.dto.MemberDTO;

public interface MemberService {

	public MemberDTO idCheck(String userid);
	public int memberAdd(MemberDTO dbdto);
	public MemberDTO login(HashMap<String, String> map);
	
	public MemberDTO mypage(String userid);
	
}