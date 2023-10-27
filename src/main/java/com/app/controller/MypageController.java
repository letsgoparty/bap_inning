package com.app.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.print.DocFlavor.STRING;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.app.dto.Board;
import com.app.dto.MemberDTO;
import com.app.dto.PageDTO;
import com.app.dto.ReviewPageDTO;
import com.app.dto.ScheduleDTO;
import com.app.dto.TeamDTO;
import com.app.service.BoardService;
import com.app.service.MemberService;
import com.app.service.MypageService;
import com.app.service.ReviewService;
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
	@Autowired
	private MypageService mypageService;
	@Autowired
	private BoardService boardService;
	@Autowired
	private ReviewService reviewService;
	
	@RequestMapping("/mypage")
	public String mypage(Model model, HttpSession session) {
		// 사용자정보가져오기
		MemberDTO dto = (MemberDTO) session.getAttribute("login");
		// 로그인 여부 확인은 Interceptor 이용한다.
		String userid = dto.getUserid();
		MemberDTO user = memberService.mypage(userid);
		session.setAttribute("login", user); //session에 유저정보 보내기
		model.addAttribute("user",user); //model에 유저정보 보내기
		// 전체 일정 가져오기
		List<ScheduleDTO> allScheduleList = scrapService.cacheScheduleData();
		// 전체 순위 가져오기
		List<TeamDTO> teamDataList = scrapService.cachedRankData();
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
		
		TeamDTO filterTeamData = new TeamDTO();
		for(TeamDTO team : teamDataList) {
			if(team.getTitle().equals(selectedTeam)) {
				filterTeamData = team;
			}
		}
		
		model.addAttribute("filterTeamData", filterTeamData);
		return "mypage/myPage";
	}

	//회원정보 보여주기
	@GetMapping("/myinfo")
	public String myinfo(HttpSession session,Model model) {
		//세션에서 로그인정보 가져오기
		MemberDTO user=(MemberDTO) session.getAttribute("login");
		//로그인여부는 인터셉터 
		String userid=user.getUserid();
		user=memberService.mypage(userid);
		session.setAttribute("login", user);//session에 유저정보 보내기
		model.addAttribute("user",user);//model에 유저정보 보내기.
		
		return "mypage/myInfo";
	}

	@PostMapping("/myinfo")
	public String memberUpdate(@RequestParam("userid") String userid, @RequestParam("nickname") String nickname, @RequestParam("email1")String email1, @RequestParam("email2")String email2, @RequestParam("myTeam") int teamCode, HttpSession session) {
	    MemberDTO dto=new MemberDTO();
	    String email = email1 + "@" + email2;
	   
	    dto.setUserid(userid);
	    dto.setEmail(email);
	    dto.setNickname(nickname);
	    dto.setTeam_code(teamCode);
	   
	    int n=mypageService.memberUpdate(dto);
	   if(n>0) {
		   MemberDTO updatedUser = memberService.mypage(userid);
		   session.setAttribute("login", updatedUser);
		   return "mypage_content/successInfo";		   
	   }else {
		   return "mypage_content/failInfo";
	   }
	    
	}
	
	@GetMapping("/pwchange")
	public String pwchange(HttpSession session, Model m) {
		//세션에서 로그인정보 가져오기
		MemberDTO user=(MemberDTO) session.getAttribute("login");
		//로그인여부는 인터셉터 
		String userid=user.getUserid();
		user=memberService.mypage(userid);
		session.setAttribute("login", user);//session에 유저정보 보내기
		m.addAttribute("user",user);//model에 유저정보 보내기.
		
		return "mypage/pwChange";
	}
	
	@PostMapping("/pwchange")
	public String changePw(@RequestParam("currpw")String inputPw, @RequestParam("newpw2")String newpw, HttpSession session) {
		//세션에서 로그인정보 가져오기
		MemberDTO user=(MemberDTO)session.getAttribute("login");
		//로그인여부는 인터셉터로
		String userid=user.getUserid();
		String dbPw=user.getPassword(); 
	    //입력한 비번을 맞게썼는지 확인
	    if(dbPw.equals(inputPw)) {
	    	//비번이맞게쓴경우
			HashMap<String, String> hashmap=new HashMap<String, String>();
			hashmap.put("userid", userid);
			hashmap.put("password", newpw);
			
			int n=mypageService.pwChange(hashmap);
			
		    if(n>0) {
		    	return "mypage_content/successInfo";
		    }else {
		    	return "mypage_content/failInfo";
		    }
	    }
	    //비번 불일치
	    return "mypage_content/failInfo";

	}
	
	
	@GetMapping("/mytext")
	public ModelAndView mytext(@RequestParam(value = "curPage", required = false, defaultValue = "1") int curPage, HttpSession session) {
		//세션에서 로그인정보 가져오기
		MemberDTO user=(MemberDTO)session.getAttribute("login");
		String userid=user.getUserid();
		
		PageDTO pageDTO=boardService.selectList(curPage);
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("mypage/myText");
		mav.addObject("pageDTO",pageDTO);
		
		return mav;
	}

	@GetMapping("/myreply")
	public String myreply() {
		return "mypage/myReply";
	}

	@GetMapping("/my_r_review")
	public ModelAndView myRestaurantReview(@RequestParam(value = "curPage",required = false,defaultValue = "1")int curPage,HttpSession session) {
		//세션에서 로그인정보 가져오기
		MemberDTO user=(MemberDTO)session.getAttribute("login");
		String userid=user.getUserid();
		
		ReviewPageDTO pageDTO=reviewService.r_reviewList(curPage);
		ModelAndView mav=new ModelAndView();
		mav.setViewName("mypage/myRestaurantReview");
		mav.addObject("pageDTO",pageDTO);		
		
		return mav;
	}

	@GetMapping("/my_l_review")
	public String myLodgingReview() {
		return "mypage/myLodgingReview";
	}
	
	//회원탈퇴
	@GetMapping("/user_delete")
	public String userDeletePage(HttpSession session,Model m) {
		//세션에서 로그인정보 가져오기
		MemberDTO user=(MemberDTO) session.getAttribute("login");
		//로그인여부는 인터셉터 
		String userid=user.getUserid();
		user=memberService.mypage(userid);
		m.addAttribute("user",user);//model에 유저정보 보내기.

		
		return "mypage/userDelete";
	}

	@PostMapping("/user_delete")
	public String userDelete(@RequestParam("currpw")String inputPw, HttpSession session) {
		//세션에서 로그인정보 가져오기
		MemberDTO user=(MemberDTO) session.getAttribute("login");
		String userid=user.getUserid();
		String dbPw=user.getPassword();
		
		//사용자가 입력한 비번과 비교하기
		if(inputPw.equals(dbPw)) {
			//비번이 맞은경우 회원탈퇴
			int n=mypageService.memberDelete(userid);
			//탈퇴 성공시 메인으로 이동
			if(n>0) {
				session.invalidate();//세션 정보 초기화
				return "mypage_content/successDelete";
			}else {
				//탈퇴 실패시 에러
				return "mypage_content/failDelete";
			}
		}else {
			//비번 틀렸으면 에서
			return "mypage_content/failDelete";
		}
	}
	
	//마이페이지에서 내글 삭제하기
	@GetMapping("/delete_mytext")
	public String delete(int no) {
		int n=boardService.boardDelete(no);
		return "redirect:mytext";
	}
	

}
