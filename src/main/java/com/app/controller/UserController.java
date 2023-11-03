package com.app.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.app.dto.MemberDTO;
import com.app.service.EmailService;
import com.app.service.EncodeService;
import com.app.service.MemberService;

@Controller
public class UserController {

	@Autowired
	EmailService service;

	@Autowired
	MemberService Mservice;

	@Autowired
	EncodeService Eservice;

	@RequestMapping("/forgotpassword")
	public String forgotpassword() {
		return "login/ForgotPW";
	}

	@RequestMapping("/sendEmail")
	public String sendPasswordEmail(@RequestParam String email) {
		String temporaryPW = null;

			temporaryPW = service.sendEmailNaver(email);

		String encode_temporaryPW = Eservice.modify(temporaryPW);

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("password", encode_temporaryPW);

		int n = Mservice.updateTemporaryPW(map);

		return "login/successSendMail";
	}

	@GetMapping("/sendMailCode")
	@ResponseBody
	public String sendMailCode(String email) throws Exception {
		String authCode = null;
			authCode = service.sendCodeNaver(email);

	
		return authCode;
	}
}