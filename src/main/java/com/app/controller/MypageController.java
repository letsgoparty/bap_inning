package com.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MypageController {
//임시페이지입니다 나중에 huh가 수정함. 
//임시페이지입니다 나중에 huh가 수정함. 
//임시페이지입니다 나중에 huh가 수정함. 
//http://localhost:8090/app/mypage 
	
	@RequestMapping("/mypage")
	public String mypage() {
		return "mypage/myPage";
	}

	@GetMapping("/myinfo")
	public String myinfo() {
		return "mypage/myInfo";
	}
	
	@GetMapping("/mytext")
	public String mytext() {
		return "mypage/myText";
	}
	@GetMapping("/myreply")
	public String myreply() {
		return "mypage/myReply";
	}
	@GetMapping("/my_r_review")
	public String myRestaurantReview() {
		return "mypage/myRestautantReview";
	}
	@GetMapping("/my_l_review")
	public String myLodgingReview() {
		return "mypage/myLodgingReview";
	}

}
