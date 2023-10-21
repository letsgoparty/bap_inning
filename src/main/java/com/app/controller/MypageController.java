package com.app.controller;

import java.util.ArrayList;
import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.descriptor.web.FilterDef;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.app.dto.MemberDTO;
import com.app.dto.ScheduleDTO;
import com.app.service.MemberService;
import com.app.service.ScrapingService;

@Controller
public class MypageController {
//임시페이지입니다 나중에 huh가 수정함. 
//임시페이지입니다 나중에 huh가 수정함. 
//임시페이지입니다 나중에 huh가 수정함. 
//http://localhost:8090/app/mypage 

	@Autowired
	private ScrapingService scrapService;
	@Autowired
	private MemberService memberService;

	@RequestMapping("/mypage")
	public String mypage(Model model, HttpSession session) {
		// 사용자정보가져오기
		MemberDTO dto = (MemberDTO) session.getAttribute("login");
		// 로그인 여부 확인은 Interceptor 이용한다.
		String userid = dto.getUserid();
		MemberDTO user = memberService.mypage(userid);
		session.setAttribute("login", user); //session에 유저정보 보내기
		model.addAttribute("user",user); //model에 유저정보 보내기 
		// 전체일정 가져오기
		List<ScheduleDTO> allScheduleList = scrapService.cacheScheduleData();
		// 나의 팀 가져오기
		int my_teamCode = dto.getTeam_code();
		String selectedTeam = ".."; // 나중에 수정하기
		switch (my_teamCode) {
		case 1:
			selectedTeam="SSG";
			break;
		case 2:
			selectedTeam="키움";
			break;
		case 3:
			selectedTeam="LG";
			break;
		case 4:
			selectedTeam="KT";
			break;
		case 5:
			selectedTeam="KIA";
			break;
		case 6:
			selectedTeam="NC";
			break;
		case 7:
			selectedTeam="삼성";
			break;
		case 8:
			selectedTeam="롯데";
			break;
		case 9:
			selectedTeam="두산";
			break;
		case 10:
			selectedTeam="한화";
			break;
		default:
			break;
		}

		// 선택팀에 해당하는 일정만 필터링하기
		List<ScheduleDTO> filterScheduleList = new ArrayList<ScheduleDTO>();
		for (ScheduleDTO schedule : allScheduleList) {
			if (schedule.getTeam1().equals(selectedTeam) || schedule.getTeam2().equals(selectedTeam)) {
				filterScheduleList.add(schedule);
			}
		}
		model.addAttribute("filterScheduleList", filterScheduleList);
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
