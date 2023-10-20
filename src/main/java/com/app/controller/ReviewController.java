package com.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.app.dto.ReviewDTO;
import com.app.dto.ReviewPageDTO;
import com.app.service.ReviewService;

@Controller
public class ReviewController {

	@Autowired
	ReviewService service;
	
	//리뷰목록
//	@GetMapping("/r_reviewList")
//	@ModelAttribute("pageDTO")
//	public ReviewPageDTO r_reviewList(@RequestParam(value = "curPage", required = false, defaultValue = "1") int curPage) {
//		return service.r_reviewList(curPage);
//	}
	
	@GetMapping("/r_reviewList")
	public ModelAndView r_reviewList(@RequestParam(value = "curPage", required = false, defaultValue = "1") int curPage) {
	    ReviewPageDTO pageDTO = service.r_reviewList(curPage);

	    ModelAndView mav = new ModelAndView();
	    mav.setViewName("review/r_reviewList");
	    mav.addObject("pageDTO", pageDTO);
	
	    return mav;
	}
	
	@GetMapping("/l_reviewList")
	public ModelAndView l_reviewList(@RequestParam(value = "curPage", required = false, defaultValue = "1") int curPage) {
		ReviewPageDTO pageDTO = service.l_reviewList(curPage);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("review/l_reviewList");
		mav.addObject("pageDTO", pageDTO);
		
		return mav;
	}
	

	//리뷰 작성 화면
	@GetMapping("/reviewWrite")
	public String reviewWrite() {
		return "review/reviewWrite";
	}

	//리뷰 등록
	@PostMapping("/reviewWrite")
	public String review(ReviewDTO reviewDTO) {
		int num = service.reviewWrite(reviewDTO);
		return "redirect:review/r_reviewList";
	}

	//리뷰 수정
	@PostMapping("/reviewUpdate")
	public String reviewUpdate(ReviewDTO reviewDTO) {
		int num = service.reviewUpdate(reviewDTO);
		return "redirect:reviewRetrieve";
	}

	//리뷰 상세 보기 (수정용)
    @GetMapping("/reviewRetrieve")
    public ModelAndView retrieve(@RequestParam("review_id") String review_id, ModelAndView mav) {
        ReviewDTO dto = service.reviewRetrieve(review_id);

        mav.setViewName("review/reviewRetrieve");
        mav.addObject("reviewRetrieve", dto);

        return mav;
    }
    
	//리뷰 삭제
	@GetMapping("/reviewDelete")
	public String reviewDelete(@RequestParam("review_id") String review_id) {
		int num = service.reviewDelete(review_id);
		return "redirect:r_reviewList";
	}
	
}
