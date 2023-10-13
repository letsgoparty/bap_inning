package com.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MemberController {
	
	@GetMapping("/memberForm")	
	public String memberForm() {
		return "memberForm";
	}
	
	// 이후  추가 
}