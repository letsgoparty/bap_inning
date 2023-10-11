package com.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MapsController {
	/*******************************************
	임시 Controller 입니다. 나중에 수정 및 삭제 예정 
	********************************************/
	@RequestMapping("/samsung")
	public String samsung() {
		return "maps/samsung";
	}
	
}
