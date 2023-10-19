package com.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.app.dto.ReviewDTO;
import com.app.dto.ReviewPageDTO;
import com.app.service.ReviewService;

@Controller
public class ReviewController {

	@Autowired
	ReviewService service;
	
	//리뷰목록
	@RequestMapping(value = "/r_reviewList", method = RequestMethod.GET)
	@ModelAttribute("pageDTO")
	public ReviewPageDTO r_reviewList(@RequestParam(value = "curPage", required = false, defaultValue = "1") int curPage) {
		return service.r_reviewList(curPage);
	}

	@RequestMapping(value = "/l_reviewList", method = RequestMethod.GET)
	@ModelAttribute("pageDTO")
	public ReviewPageDTO l_reviewList(@RequestParam(value = "curPage", required = false, defaultValue = "1") int curPage) {
		return service.l_reviewList(curPage);
	}
	

	//리뷰 작성 화면
	@RequestMapping(value = "/reviewWrite", method = RequestMethod.GET)
	public String reviewWrite() {
		return "reviewWrite";
	}

	//리뷰 등록
	@RequestMapping(value = "/reviewWrite", method = RequestMethod.POST)
	public String review(ReviewDTO reviewDTO) {
		int num = service.reviewWrite(reviewDTO);
		return "redirect:r_reviewList";
	}
	
}
