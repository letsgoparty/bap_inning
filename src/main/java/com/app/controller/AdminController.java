package com.app.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.app.dto.Board;
import com.app.dto.LodReviewDTO;
import com.app.dto.LodgingDTO;
import com.app.dto.MemberDTO;
import com.app.dto.RatingDTO;
import com.app.dto.ResReviewDTO;
import com.app.dto.RestaurantDTO;
import com.app.dto.VisitDTO;
import com.app.service.AdminService;
import com.app.service.FindService;

@Controller
public class AdminController {
	
	@Autowired
	AdminService service;
	
	@Autowired
	FindService Fservice;

	@RequestMapping("/admin/main")
	public String main(Model m) {
		VisitDTO dto = service.todayVisitCheck();
		m.addAttribute("visit", dto);
		int memberCount = service.CountMember();
		int boardCount = service.CountBoard();
		int reviewCount = service.CountReview();
		m.addAttribute("memberCount", memberCount);
		m.addAttribute("boardCount", boardCount);
		m.addAttribute("reviewCount", reviewCount);
		return "/admin/main";
	}
	
	@RequestMapping("/admin/board")
	public String board(Model m) {
		
		List<Board> list = service.find_Board();
		m.addAttribute("list", list);
		return "/admin/board";
	}
	
	@PostMapping("/admin/find_board")
	@ResponseBody
	public Board find_board(@RequestParam int board_num) {
		Board data = service.find_Board_by_num(board_num);
		
		return data;
	}
	
	@RequestMapping("/admin/user")
	public String user(Model m) {
		List<MemberDTO> list = service.find_user();
		for(MemberDTO dto : list) {
			String userid = dto.getUserid();
			dto.setBoard_count(service.find_user_board(userid));
			dto.setComment_count( service.find_user_commet(userid));
			dto.setRes_review_count(service.find_user_res_review(userid));
			dto.setLod_review_count(service.find_user_lod_review(userid));
		}
		m.addAttribute("list", list);
		m.addAttribute("data", list);
		return "/admin/user";
	}
	
	@RequestMapping("/admin/comment")
	public String comment() {
		return "/admin/comment";
	}
	
	@RequestMapping("/admin/res_review")
	public String res_review(Model m) {
		List<ResReviewDTO> list = service.find_res_review();
		m.addAttribute("list", list);
		return "/admin/res_review";
	}
	
	@RequestMapping("/admin/lod_review")
	public String lod_review(Model m) {
		List<LodReviewDTO> list = service.find_lod_review();
		
		m.addAttribute("list", list);
		return "/admin/lod_review";
	}
	
	@RequestMapping("/admin/admin")
	public String admin() {
		return "/admin/admin";
	}
	
	@RequestMapping("/admin/res")
	public String restaurant(Model m) {
		List<RestaurantDTO> res_list = service.find_res();
		List<RatingDTO> rating_list = service.find_res_rating();
		
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
		m.addAttribute("list", res_list);
		return "/admin/restaurant";
	}
	
	@RequestMapping("/admin/lod")
	public String lodging(Model m) {
		List<LodgingDTO> lod_list = service.find_lod();
		List<RatingDTO> rating_list = service.find_lod_rating();
		
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
		m.addAttribute("list", lod_list);
		return "/admin/lodging";
	}
	
	@PostMapping("/admin/find_res")
	@ResponseBody
	public RestaurantDTO find_res(@RequestParam String res_name) {
		RestaurantDTO dto = Fservice.find_res(res_name);
		dto.setRating(Fservice.find_res_rating(res_name));
		
		return dto;
	}
	
	@PostMapping("/admin/find_lod")
	@ResponseBody
	public LodgingDTO find_lod(@RequestParam String lodging_name) {
		LodgingDTO dto = Fservice.find_lod(lodging_name);
		dto.setRating(Fservice.find_lod_rating(lodging_name));
		
		return dto;
	}
	
	@PostMapping("/admin/updateRes")
	@ResponseBody
	public String updateRes(RestaurantDTO dto) {
		int n = service.update_res(dto);
		
		if(n>0) {
			return "음식점 정보를 수정하였습니다.";
		} else {
			return "수정을 실패하였습니다.";
		}
	}
	
	@PostMapping("/admin/updateLod")
	@ResponseBody
	public String updateLod(LodgingDTO dto) {
		int n = service.update_lod(dto);
		
		if(n>0) {
			return "숙소 정보를 수정하였습니다.";
		} else {
			return "수정을 실패하였습니다.";
		}

	}
	
	@PostMapping("/admin/deleteRes")
	@ResponseBody
	public String deleteRes(String res_name) {
		int n = service.delete_res(res_name);
		
		if(n>0) {
			return res_name + "를(을)  삭제하였습니다.";
		} else {
			return "삭제를 실패하였습니다.";
		}
	}
	
	@PostMapping("/admin/deleteLod")
	@ResponseBody
	public String deleteLod(String lodging_name) {
		int n = service.delete_lod(lodging_name);
		
		if(n>0) {
			return lodging_name + "를(을)  삭제하였습니다.";
		} else {
			return "삭제를 실패하였습니다.";
		}
	}
	
	@PostMapping("/admin/deleteUser")
	@ResponseBody
	public String deleteUser(String userid) {
		int n = service.delete_user(userid);
		
		if(n>0) {
			return userid + "계정을  삭제하였습니다.";
		} else {
			return "삭제를 실패하였습니다.";
		}
	}
	
	@PostMapping("/admin/deleteBoard")
	@ResponseBody
	public String deleteBoard(int board_num) {
		int n = service.delete_board(board_num);
		
		if(n>0) {
			return "게시글을  삭제하였습니다.";
		} else {
			return "삭제를 실패하였습니다.";
		}
	}
	
	@PostMapping("/admin/deleteResReview")
	@ResponseBody
	public String deleteResReview(int review_id) {
		int n = service.delete_res_review(review_id);
		
		if(n>0) {
			return "리뷰를  삭제하였습니다.";
		} else {
			return "삭제를 실패하였습니다.";
		}
	}
	
	@PostMapping("/admin/deleteLodReview")
	@ResponseBody
	public String deleteLodReview(int review_id) {
		int n = service.delete_lod_review(review_id);
		
		if(n>0) {
			return "리뷰를  삭제하였습니다.";
		} else {
			
			return "삭제를 실패하였습니다.";
		}
	}
	
	@PostMapping("/admin/find_user_res_review_info")
	@ResponseBody
	public List<ResReviewDTO> res_review_info(String userid) {
		List<ResReviewDTO> list = service.find_resInfo(userid);
		return list;
	}
	
	@PostMapping("/admin/find_user_lod_review_info")
	@ResponseBody
	public List<LodReviewDTO> lod_review_info(String userid) {
		List<LodReviewDTO> list = service.find_lodInfo(userid);
		System.out.println(list);
		return list;
	}
	
	@PostMapping("/admin/find_user_board_info")
	@ResponseBody
	public List<Board> board_info(String userid) {
		List<Board> list = service.find_boardInfo(userid);
		return list;
	}
}
