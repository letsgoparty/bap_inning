package com.app.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.app.dto.MemberDTO;

@Service
public class EncodeService {
	
	@Autowired
	private PasswordEncoder pwEncoder;
	
	@Autowired 
	MemberService Mservice;
	
	// 회원가입 시, 패스워드 암호화
	public MemberDTO register(MemberDTO dto) {
		dto.setPassword(pwEncoder.encode(dto.getPassword()));
		return dto;
	}
	
	// 로그인 시, 입력받은 비밀번호와 암호화된 비밀번호가 일치하는지 확인
	public HashMap<String, String> login(HashMap<String, String> map) {
		// userid와 일치하는 암호화된 password 가져오기
		String encodePW = Mservice.findEncodePW(map); 
		
		if(pwEncoder.matches(map.get("password"),encodePW)) {
			map.put("password", encodePW);
			return map;
		} else {
			return map;
		}
	}
	
	// 비밀번호 변경 시, 입력받은 비밀번호와 암호화된 비밀번호가 일치하는지 확인
	public boolean checkPW(HashMap<String, String> map) {
		// userid와 일치하는 암호화된 password 가져오기
		String encodePW = Mservice.findEncodePW(map); 
		
		if(pwEncoder.matches(map.get("password"),encodePW)) {
			return true;
		} else {
			return false;
		}
	}
	
	public String modify(String pw) {
		String encodePW = pwEncoder.encode(pw);
		return encodePW;
	}
	
}
