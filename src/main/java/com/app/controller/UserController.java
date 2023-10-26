package com.app.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.app.dto.MemberDTO;
import com.app.service.EmailService;
import com.app.service.MemberService;

@Controller
public class UserController {
	
	@Autowired
	EmailService service;
	
	@Autowired
	MemberService Mservice;
	
		// 비밀번호 찾기 누르면 ForgotPW.jsp로 이동
    @RequestMapping("/forgotpassword")
    public String forgotpassword() {
    	return "login/ForgotPW";
    }
    
		// 입력받은 이메일을 파라미터로 받아 임시이메일로 전송하고 (sendEmail 메서드)
		// Member 테이블에 해당 임시비밀번호로 update 해야함 (updateTemporaryPW 메서드)
		// 이메일 전송 시, successSendMail.jsp 로 이동
    @RequestMapping("/sendEmail")
    public String sendPasswordEmail(@RequestParam String email) {
   
    	String temporaryPW = service.sendEmail(email);
    	
    	HashMap<String, String> map = new HashMap<String, String>();
    	map.put("email", email);
    	map.put("password", temporaryPW);
    	int n = Mservice.updateTemporaryPW(map);
   
    	return "login/successSendMail";
    }
}