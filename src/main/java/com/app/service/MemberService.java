package com.app.service;

import java.util.HashMap;

import com.app.dto.MemberDTO;

public interface MemberService {

	public MemberDTO idCheck(String userid);
	public MemberDTO nicknameCheck(String nickname);
	public int memberAdd(MemberDTO dbdto);
	public MemberDTO login(HashMap<String, String> map);
	public int updateTemporaryPW(HashMap<String, String> map);
	public MemberDTO mypage(String userid);
	public String findEncodePW(HashMap<String, String> map);
	
}