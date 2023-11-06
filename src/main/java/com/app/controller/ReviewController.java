package com.app.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.app.dto.MemberDTO;
import com.app.dto.ReviewDTO;
import com.app.dto.ReviewPageDTO;
import com.app.service.MemberService;
import com.app.service.ReviewImageService;
import com.app.service.ReviewService;

@Controller
public class ReviewController {
	
	@Autowired ReviewService service;
	@Autowired MemberService memService;
	@Autowired ReviewImageService imgService;
	
	//리뷰목록
	@GetMapping("/r_reviewList")
	public ModelAndView r_reviewList(@RequestParam(value = "curPage", required = false, defaultValue = "1") int curPage, int res_id) {
	    ReviewPageDTO pageDTO = service.r_reviewList(curPage, res_id);

	    ModelAndView mav = new ModelAndView();
	    mav.setViewName("review/r_reviewList");
	    mav.addObject("pageDTO", pageDTO);
	
	    return mav;
	}
	
	@GetMapping("/l_reviewList")
	public ModelAndView l_reviewList(@RequestParam(value = "curPage", required = false, defaultValue = "1") int curPage, int res_id) {
		ReviewPageDTO pageDTO = service.l_reviewList(curPage, res_id);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("review/l_reviewList");
		mav.addObject("pageDTO", pageDTO);
		
		return mav;
	}
	
	//리뷰 작성 화면
	@GetMapping("/reviewWrite")
	public String reviewWrite(@RequestParam int res_id, Model m) {
		System.out.println(res_id);
		m.addAttribute("res_id", res_id);
		return "review/reviewWrite";
	}

	//리뷰 등록
	@PostMapping("/reviewWrite")
	public String review(ReviewDTO reviewDTO, HttpSession session) {
		MemberDTO dto = (MemberDTO) session.getAttribute("login");
		reviewDTO.setUser_id(dto.getUserid());
		
		if(reviewDTO.getReview_id() == null) {
			reviewDTO.setReview_id(service.find_seq());
		}
		
		System.out.println(reviewDTO);
		service.reviewWrite(reviewDTO);
		return "redirect:r_reviewList?res_id=" + reviewDTO.getRes_id();
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
	public String reviewDelete(@RequestParam("review_id") int review_id) {
		int num = service.reviewDelete(review_id);
		return "redirect:r_reviewList";
	}
	

	//리뷰 이미지 업로드
	@PostMapping("/uploadAction")
	@ResponseBody
	public int uploadPost(@RequestParam("file") MultipartFile[] uploadFile, Model m) throws IOException {
	    System.out.println("update ajax post.........");
	    int review_id = service.find_seq();
	    String dirName = null;
	    int index = 0;
	    HashMap<String, Object> map = new HashMap<String, Object>();
	    map.put("review_id", review_id);
	    for (MultipartFile multipartFile : uploadFile) {
	        index++;
	        String url = imgService.upload(multipartFile, dirName, review_id, index);
	        map.put("url", url);
	        
	        int n = service.save_url(map);
	    }

	    return review_id; 
	}
}
