package com.app.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.app.dto.MemberDTO;
import com.app.service.MemberService;

@Controller
public class LoginController {
	@Autowired
	MemberService service;
	
	@GetMapping("/loginsubmit")
	public String login(@RequestParam HashMap<String, String> map, 
			                          HttpSession session) {
		MemberDTO dbdto = service.login(map);
	    System.out.println("Service.login 호출 완료");
		String nextPage=null;
		if(dbdto != null) {
			session.setAttribute("login", dbdto);
			nextPage = "redirect:main";   
			 System.out.println("로그인 성공");
		}else {
			nextPage = "join/loginFail";   
			 System.out.println("로그인 실패");
		}
		return nextPage;
	}
	
	
	@GetMapping("/logout")
	public String logout( HttpSession session) {
		 session.invalidate(); //로그아웃
		return "redirect:main";
	}
	
	
	
	
	
	
	
}
