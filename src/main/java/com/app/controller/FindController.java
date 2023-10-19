package com.app.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.app.dto.LodgingDTO;
import com.app.dto.RestaurantDTO;
import com.app.service.FindService;

/****************************************
 * 
 * 맛집(restaurant) 테이블, 숙소(lodging) 테이블 에서 테이블 정보 가져오는 Controller
 * 
 ****************************************/

@RestController
public class FindController {

	@Autowired
	FindService service;
	
	@GetMapping("/find_res") 
	public RestaurantDTO find_res(@RequestParam String res_name) {
		// AJAX 통신을 통해 클라이언트에서 가게이름(res_name)이 넘어오면 DB에서 해당 가게 정보를 불러오기
		RestaurantDTO dto = service.find_res(res_name);
		return dto;
	}
	
	@GetMapping("/find_lod") 
	public LodgingDTO find_lod(@RequestParam String lodging_name) {
		// AJAX 통신을 통해 클라이언트에서 숙소이름(lodging_name)이 넘어오면 DB에서 해당 숙소 정보를 불러오기
		LodgingDTO dto = service.find_lod(lodging_name);
		return dto;
	}
	
	@GetMapping("/find_all_res")
	public List<RestaurantDTO> find_all_res(@RequestParam int team_code) {
		
		List<RestaurantDTO> list = service.find_all_res(team_code);
		return list;
	}
	
	@GetMapping("/find_res_by_category")
	public List<RestaurantDTO> find_KOR_res(@RequestParam String category, @RequestParam int team_code) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("category", category);
		map.put("team_code", team_code);
		List<RestaurantDTO> list = service.find_KOR_res(map);
		return list;
	}
	
	@GetMapping("/find_all_lod")
	public List<LodgingDTO> find_all_lod(@RequestParam String lodging_addr) {
		List<LodgingDTO> list = service.find_all_lod(lodging_addr);
		return list;
	}
	
	@GetMapping("/find_all_lod_by_content")
	public List<LodgingDTO> find_all_lod_by_content(@RequestParam String lodging_content) {
		List<LodgingDTO> list = service.find_all_lod_by_content(lodging_content);
		return list;
	}
	
	
	
	
}

