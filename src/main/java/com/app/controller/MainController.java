package com.app.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.app.dto.LodgingDTO;
import com.app.dto.MemberDTO;
import com.app.dto.RatingDTO;
import com.app.dto.RestaurantDTO;
import com.app.service.AdminService;
import com.app.service.LikeService;
import com.app.service.ScrapingService;

/*******************************
 * 
 * 메인화면으로 가는 Controller localhost:8090/app/main
 *
 *******************************/
@Controller
public class MainController {

	@Autowired
	private ScrapingService service;

	@Autowired
	private LikeService likeService;
	
	@Autowired
	private AdminService adminService;

	@RequestMapping("/main")
	public String main(Model m) {

		// KBO 리그 일정 가져오기
		m.addAttribute("ScheduleList", service.cacheScheduleData());

		// KBO 리그 순위 가져오기
		m.addAttribute("teamDataList", service.cachedRankData());

		// 포스트 시즌 대진
		m.addAttribute("postSeason", service.cachedPostData());

		// 팀 별 일정
		String[] teams = { "all", "SSG", "키움", "LG", "KT", "KIA", "NC", "삼성", "롯데", "두산", "한화" };
		m.addAttribute("teams", teams);
		
		if(adminService.todayVisitCheck() == null) {
			int n = adminService.todayFirstVisit();
		} else {
			int n = adminService.todayAddVisit();
		}

		return "main";
	}

	@RequestMapping("/like")
	public String like(Model m, HttpSession session) {
		MemberDTO dto = (MemberDTO) session.getAttribute("login");
		String userid = dto.getUserid();
		List<RestaurantDTO> Rdto = null;
		List<LodgingDTO> Ldto = null;

		List<Object> res_list = likeService.find_like_res(userid);
		if (res_list.size() > 0) {
			Rdto = likeService.find_like_res_info(res_list);
			
			List<RatingDTO> rating_list = likeService.find_res_rating(userid);
			
			for(RestaurantDTO res : Rdto) {
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
		}


		List<Object> lod_list = likeService.find_like_lod(userid);
		if (lod_list.size() > 0) {
			Ldto = likeService.find_like_lod_info(lod_list);
			
			List<RatingDTO> rating_list2 = likeService.find_lod_rating(userid);
			
			for(LodgingDTO lod : Ldto) {
				boolean flag = false;
				for(RatingDTO rating : rating_list2) {
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
		}
	
		m.addAttribute("Rdto", Rdto);
		m.addAttribute("Ldto", Ldto);

		return "like/myLike";
	}
}