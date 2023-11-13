package com.app.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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

import com.app.dto.LodReviewDTO;
import com.app.dto.MemberDTO;
import com.app.dto.ReviewDTO;
import com.app.dto.ReviewPageDTO;
import com.app.service.MemberService;
import com.app.service.ReviewImageService;
import com.app.service.ReviewService;

@Controller
public class ReviewController {
	
	@Autowired ReviewService service;
	@Autowired ReviewImageService imgService;
	@Autowired MemberService memService;
	
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
	public ModelAndView l_reviewList(@RequestParam(value = "curPage", required = false, defaultValue = "1") int curPage, int lodging_id) {
		ReviewPageDTO pageDTO = service.l_reviewList(curPage, lodging_id);
		
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

	@GetMapping("/lodReviewWrite")
	public String lodReviewWrite(@RequestParam int lodging_id, Model m) {
		System.out.println(lodging_id);
		m.addAttribute("lodging_id", lodging_id);
		return "review/lodReviewWrite";
	}

	//리뷰 등록
	@PostMapping("/reviewWrite")
	public String review(ReviewDTO dto, HttpSession session) {
		MemberDTO mdto = (MemberDTO) session.getAttribute("login");
		dto.setUser_id(mdto.getUserid());
		
		if(dto.getReview_id() == null) {
			dto.setReview_id(service.find_seq());
		}
		
		System.out.println(dto);
		service.reviewWrite(dto);
		return "redirect:r_reviewList?res_id=" + dto.getRes_id();
	}

	@PostMapping("/lodReviewWrite")
	public String lodReview(LodReviewDTO dto, HttpSession session) {
		MemberDTO mdto = (MemberDTO) session.getAttribute("login");
		dto.setUser_id(mdto.getUserid());
		
		if(dto.getReview_id() == null) {
			dto.setReview_id(service.lod_find_seq());
		}
		
		System.out.println(dto);
		service.lodReviewWrite(dto);
		return "redirect:l_reviewList?lodging_id=" + dto.getLodging_id();
	}

	
	//리뷰 상세 보기
    @GetMapping("/reviewRetrieve")
    public ModelAndView retrieve(@RequestParam("review_id") String review_id, ModelAndView mav) {
    	ReviewDTO dto = service.reviewRetrieve(review_id);
    	List<String> urls = service.res_find_img(Integer.valueOf(review_id));
    	
        mav.setViewName("review/reviewRetrieve");
        mav.addObject("reviewRetrieve", dto);
        mav.addObject("urls", urls);
        System.out.println(urls);
        
        return mav;
    }

    @GetMapping("/lodReviewRetrieve")
    public ModelAndView lodRetrieve(@RequestParam("review_id") String review_id, ModelAndView mav) {
    	LodReviewDTO dto = service.lodReviewRetrieve(review_id);
    	List<String> urls = service.lod_find_img(Integer.valueOf(review_id));
    	
    	mav.setViewName("review/lodReviewRetrieve");
    	mav.addObject("lodReviewRetrieve", dto);
    	mav.addObject("urls", urls);
    	System.out.println(urls);
    	
    	return mav;
    }
    
    
	//리뷰 수정
    @GetMapping("/reviewUpdate")
    public ModelAndView reviewUpdate(@RequestParam("review_id") String review_id, ModelAndView mav) {
    	ReviewDTO dto = service.reviewRetrieve(review_id);
    	List<String> urls = service.res_find_img(Integer.valueOf(review_id));
    	
        mav.setViewName("review/reviewUpdate");
        mav.addObject("reviewRetrieve", dto);
        mav.addObject("urls", urls);
        System.out.println(urls);
        
        return mav;
    }

	@PostMapping("/reviewUpdate")
	public String reviewUpdate(ReviewDTO dto, HttpSession session) {
		MemberDTO mdto = (MemberDTO) session.getAttribute("login");
		dto.setUser_id(mdto.getUserid());
		
		int num = service.reviewUpdate(dto);
		return "redirect:r_reviewList?res_id=" + dto.getRes_id();
	}

	
	@GetMapping("/lodReviewUpdate")
	public ModelAndView lodReviewUpdate(@RequestParam("review_id") String review_id, ModelAndView mav) {
    	LodReviewDTO dto = service.lodReviewRetrieve(review_id);
    	List<String> urls = service.lod_find_img(Integer.valueOf(review_id));
    	
        mav.setViewName("review/lodReviewUpdate");
        mav.addObject("lodReviewRetrieve", dto);
        mav.addObject("urls", urls);
        System.out.println(urls);
        
        return mav;
	}

	@PostMapping("/lodReviewUpdate")
	public String lodReviewUpdate(LodReviewDTO dto, HttpSession session) {
		MemberDTO mdto = (MemberDTO) session.getAttribute("login");
		dto.setUser_id(mdto.getUserid());
		
		int num = service.lodReviewUpdate(dto);
		return "redirect:reviewRetrieve?lodging_id=" + dto.getLodging_id();
	}

	
	//리뷰 삭제
	@GetMapping("/reviewDelete")
	public String reviewDelete(@RequestParam("review_id") int review_id, ReviewDTO reviewDTO) {
		int num = service.reviewDelete(review_id);
		//int res_id = reviewDTO.getRes_id();
		return "redirect:main"; //redirect:r_reviewList?res_id=" + res_id;
	}
	
	@GetMapping("/lodReviewDelete")
	public String lodReviewDelete(@RequestParam("review_id") int review_id, LodReviewDTO dto,
			HttpServletRequest request) {
		int num = service.lodReviewDelete(review_id);
		return "redirect:main";
//		return "redirect:l_reviewList";
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

	@PostMapping("/lod/uploadAction")
	@ResponseBody
	public int lodUploadPost(@RequestParam("file") MultipartFile[] uploadFile, Model m) throws IOException {
		System.out.println("update ajax post.........");
		int review_id = service.lod_find_seq();
		String dirName = null;
		int index = 0;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("review_id", review_id);
		for (MultipartFile multipartFile : uploadFile) {
			index++;
			String url = imgService.lodUpload(multipartFile, dirName, review_id, index);
			map.put("url", url);
			
			int n = service.lod_save_url(map);
		}
		
		return review_id; 
	}

	//리뷰 추천
	@GetMapping("/res_like_cnt")
	public String res_like_cnt(ReviewDTO dto, HttpSession session) {
		MemberDTO mdto = (MemberDTO)session.getAttribute("login");
		
		if(mdto == null) {
			return "loginForm";
		} else {
			dto.setUser_id(mdto.getUserid());
			int n = service.res_like_cnt(dto);
		}
		return "review/likedInfo";
	}
	
	@GetMapping("/lod_like_cnt")
	public String lod_like_cnt(LodReviewDTO dto, HttpSession session) {
		MemberDTO mdto = (MemberDTO)session.getAttribute("login");
		
		if(mdto == null) {
			return "loginForm";
		} else {
			dto.setUser_id(mdto.getUserid());
			int n = service.lod_like_cnt(dto);
		}
		return "review/likedInfo";
	}
	
}
