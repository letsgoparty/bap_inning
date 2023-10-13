package com.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.app.dto.RestaurantDTO;
import com.app.service.RestaurantService;

@RestController
public class RestaurantController {

	@Autowired
	RestaurantService service;
	
	@GetMapping("/find_res") 
	public RestaurantDTO find_res(@RequestParam String res_name) {
		// ajax 통신을 통해 클라이언트에서 가게이름(res_name)이 넘어오면 DB에서 해당 가게 정보를 불러오기
		System.out.println(res_name);
		
		RestaurantDTO dto = service.find_res(res_name);
		
		System.out.println(dto);
		return dto;
	}
}

