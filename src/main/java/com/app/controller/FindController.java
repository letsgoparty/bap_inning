package com.app.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.app.dto.LodgingDTO;
import com.app.dto.RatingDTO;
import com.app.dto.RestaurantDTO;
import com.app.service.AdminService;
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
	
	@Autowired
	AdminService Aservice;
	
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
		
		List<RestaurantDTO> res_list = service.find_all_res(team_code);
		List<RatingDTO> rating_list = service.find_all_res_rating(team_code);
		
		for(RestaurantDTO res : res_list) {
			boolean flag = false;
			for(RatingDTO rating : rating_list) {
				if(res.getRes_name().equals(rating.getPlace_name())) {
					 res.setRating(String.valueOf(rating.getRating()));
					flag = true;
					break;
				}
			}
			if(!flag) {
				res.setRating("-"); // 리뷰가 없으면 - 
			}
		}
		return res_list;
	}
	
	@GetMapping("/find_res_by_category")
	public List<RestaurantDTO> find_res_by_category(@RequestParam String category, @RequestParam int team_code) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("category", category);
		map.put("team_code", team_code);
		List<RestaurantDTO> res_list = service.find_res_by_category(map);
		List<RatingDTO> rating_list = service.find_res_rating_by_category(map);
		for(RestaurantDTO res : res_list) {
			boolean flag = false;
			for(RatingDTO rating : rating_list) {
				if(res.getRes_name().equals(rating.getPlace_name())) {
					 res.setRating(String.valueOf(rating.getRating()));
					flag = true;
					break;
				}
			}
			if(!flag) {
				res.setRating("-"); 
			}
		}
		return res_list;
	}
	
	@GetMapping("/find_all_lod")
	public List<LodgingDTO> find_all_lod(@RequestParam int team_code) {
		List<LodgingDTO> lod_list = service.find_all_lod(team_code);
		List<RatingDTO> rating_list = service.find_all_lod_rating(team_code);
		for(LodgingDTO lod : lod_list) {
			boolean flag = false;
			for(RatingDTO rating : rating_list) {
				if(lod.getLodging_name().equals(rating.getPlace_name())) {
					 lod.setRating(String.valueOf(rating.getRating()));
					flag = true;
					break;
				}
			}
			if(!flag) {
				lod.setRating("-"); // 리뷰가 없으면 - 
			}
		}
		return lod_list;
	}
	
	@GetMapping("/find_lod_by_category")
	public List<LodgingDTO> find_lod_by_category(@RequestParam String category, @RequestParam int team_code) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("category", category);
		map.put("team_code", team_code);
		List<LodgingDTO> lod_list = service.find_lod_by_category(map);
		List<RatingDTO> rating_list = service.find_lod_rating_by_category(map);
		for(LodgingDTO lod : lod_list) {
			boolean flag = false;
			for(RatingDTO rating : rating_list) {
				if(lod.getLodging_name().equals(rating.getPlace_name())) {
					 lod.setRating(String.valueOf(rating.getRating()));
					flag = true;
					break;
				}
			}
			if(!flag) {
				lod.setRating("-"); // 리뷰가 없으면 - 
			}
		}
		return lod_list;
	}
	
	@GetMapping("/find_res_rating")
	public String find_res_rating(@RequestParam String res_name) {
		String rating = service.find_res_rating(res_name);
		return rating;
	}
	
	@GetMapping("/find_lod_rating")
	public String find_lod_rating(@RequestParam String lodging_name) {
		String rating = service.find_lod_rating(lodging_name);
		return rating;
	}
	
}

