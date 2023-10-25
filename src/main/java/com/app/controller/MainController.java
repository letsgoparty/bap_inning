package com.app.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.app.dto.LodgingDTO;
import com.app.dto.MemberDTO;
import com.app.dto.RestaurantDTO;
import com.app.service.LikeService;
import com.app.service.ScrapingService;

/*******************************
 * 
 * 메인화면으로 가는 Controller
 * localhost:8090/app/main
 *
*******************************/
@Controller
public class MainController {

	@Autowired
	private ScrapingService service;
	
	@Autowired
	private LikeService likeService;

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
		
		return "main";
	}
	
	@RequestMapping("/like")
	public String like(Model m, HttpSession session) {
		MemberDTO dto = (MemberDTO) session.getAttribute("login");
		String userid = dto.getUserid();

		List<Object> res_list = likeService.find_like_res(userid);
		List<RestaurantDTO> Rdto = likeService.find_like_res_info(res_list);

		List<Object> lod_list = likeService.find_like_lod(userid);
		System.out.println(lod_list);
		List<LodgingDTO> Ldto = likeService.find_like_lod_info(lod_list);
		
		System.out.println(Ldto);
		m.addAttribute("Rdto", Rdto);
		m.addAttribute("Ldto", Ldto);
		
		return "like/myLike";
	}
}