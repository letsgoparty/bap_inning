package com.app.controller;

import java.util.ArrayList;
import java.util.List;

import org.apache.tomcat.util.descriptor.web.FilterDef;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.app.dto.ScheduleDTO;
import com.app.service.ScrapingService;

@Controller
public class MypageController {
//임시페이지입니다 나중에 huh가 수정함. 
//임시페이지입니다 나중에 huh가 수정함. 
//임시페이지입니다 나중에 huh가 수정함. 
//http://localhost:8090/app/mypage 
	
	@Autowired
	private ScrapingService service;
	
	
	@RequestMapping("/mypage")
	public String mypage(Model model) {
		//전체일정 가져오기
		List<ScheduleDTO> allScheduleList=service.scrapeSchedule();
		//나의 팀 가져오기
		String selectedTeam="NC"; //나중에 수정하기
		
		//선택팀에 해당하는 일정만 필터링하기
		List<ScheduleDTO> filterScheduleList= new ArrayList<ScheduleDTO>();
		for(ScheduleDTO schedule : allScheduleList) {
			if(schedule.getTeam1().equals(selectedTeam) || schedule.getTeam2().equals(selectedTeam)) {
				filterScheduleList.add(schedule);
			}
		}
		model.addAttribute("filterScheduleList",filterScheduleList);
		System.out.println(filterScheduleList);
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
		return "mypage/myRestaurantReview";
	}
	@GetMapping("/my_l_review")
	public String myLodgingReview() {
		return "mypage/myLodgingReview";
	}
	@GetMapping("/pwchange")
	public String pwchange() {
		return "mypage/pwChange";
	}

	

}
