package com.app.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
			                          HttpSession session, Model model) {
		MemberDTO dbdto = service.login(map);
	    System.out.println("Service.login 호출 완료");
		String nextPage=null;
		if(dbdto != null) {
			session.setAttribute("login", dbdto);
			nextPage = "redirect:main";   
			 System.out.println("로그인 성공");
		}else {
			 // 로그인 실패 시 에러 메시지를 설정
            model.addAttribute("error", "로그인에 실패했습니다.<br>아이디와 비밀번호를 확인해주세요.");
            nextPage = "loginForm"; // 로그인 폼으로 되돌아감
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
