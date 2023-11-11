package com.app.controller;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.app.dto.MemberDTO;
import com.app.dto.RestaurantDTO;
import com.app.dto.UpgradePageDTO;
import com.app.service.BoardService;
import com.app.service.EncodeService;
import com.app.service.LikeService;
import com.app.service.MemberService;
import com.app.service.MypageService;
import com.app.service.ReplyService;
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
	@Autowired
	private EncodeService encodeService;
	@Autowired
	private ReplyService replyService;
	@Autowired
	private LikeService likeService;
	
	//새로 제작중인 마이페이지
	@RequestMapping("/mypage")
	public String new_mypage(Model model,HttpSession session) {
		//사용자 정보 가져오기
		
		 MemberDTO dto=(MemberDTO)session.getAttribute("login");
		 String userid=dto.getUserid(); 
		 MemberDTO user=memberService.mypage(userid);
		 session.setAttribute("login", user); 
		 model.addAttribute("user",user);
		 
		 System.out.println(user);
		
		return "mypage/newMyPage";
	}
	
	
	@PostMapping("/myinfo")
	public String memberUpdate(@RequestParam("userid") String userid, @RequestParam("newNickname") String nickname, @RequestParam("myTeam") int teamCode, HttpSession session) {
	    MemberDTO dto=new MemberDTO();
	    MemberDTO user=(MemberDTO) session.getAttribute("login");
	    String email=user.getEmail();
	  
	    dto.setUserid(userid);
	    dto.setEmail(email);
	    dto.setNickname(nickname);
	    dto.setTeam_code(teamCode);
	  
	    int n=mypageService.memberUpdate(dto);
	   if(n>0) {
		   MemberDTO updatedUser = memberService.mypage(userid);
		   session.setAttribute("login", updatedUser);
		   return "mypage/successInfo";		  
	   }else {
		   return "mypage/failInfo";
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
		
		MemberDTO dto = (MemberDTO)session.getAttribute("login");
		String userid = dto.getUserid();
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("userid", userid);
		map.put("password", inputPw);
		
	    //입력한 비번을 맞게썼는지 확인
	    if(encodeService.checkPW(map)) {
	    	//비번이맞게쓴경우
			HashMap<String, String> hashmap=new HashMap<String, String>();
			String encode_newPw = encodeService.modify(newpw); // 새로운 비밀번호 암호화
			hashmap.put("userid", userid);
			hashmap.put("password", encode_newPw);
			
			int n=mypageService.pwChange(hashmap);
			
		    if(n>0) {
		    	return "mypage/successInfo";
		    }else {
		    	return "mypage/failInfo";
		    }
	    }
	    //비번 불일치
	    return "mypage/failInfo";
	}
	
	//댓글
	@GetMapping("/myreply")
	public ModelAndView myreply(@RequestParam(value="curPage",required = false,defaultValue = "1")int curPage,
			@RequestParam(value = "amount",required = false, defaultValue = "10")int amount, HttpSession session) {
		//세션에서 로그인정보 가져오기
		MemberDTO user=(MemberDTO)session.getAttribute("login");
		String userid=user.getUserid();
		
		UpgradePageDTO pageDTO=mypageService.selectReply(userid, curPage, amount);
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("mypage/myReply");
		mav.addObject("pageDTO",pageDTO);
		
		return mav;
	}
	//댓글 삭제
	@GetMapping("/delete_myreply")
	public String delete_myreply(int no,RedirectAttributes attribute,HttpServletRequest request) {
		int n=replyService.replyDelet(no);
		//현재페이지와 페이지당컨텐츠수 유지하면서 리다이렉트
		String curPage=request.getParameter("curPage");
		String amount=request.getParameter("amount");
		attribute.addAttribute("curPage",curPage);
		attribute.addAttribute("amount",amount);
		
		return "redirect:myreply";
	}

	
	//식당리뷰
	@GetMapping("/my_r_review")
	public ModelAndView myRestaurantReview(@RequestParam(value = "curPage", required = false, defaultValue = "1") int curPage,
			@RequestParam(value="amount",required=false, defaultValue="10")int amount,
			HttpSession session) {
		//세션에서 로그인정보 가져오기
		MemberDTO user=(MemberDTO)session.getAttribute("login");
		String userid=user.getUserid();
		
		UpgradePageDTO pageDTO=mypageService.select_r_review(userid, curPage, amount);
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("mypage/myRestaurantReview");
		mav.addObject("pageDTO",pageDTO);
		
		
		//식당정보 가져오기
		List<RestaurantDTO> Rdto=null;
		
		/* List<Object> res_list= */
		
		
		return mav; 
	}
	//식당리뷰 삭제
	@GetMapping("/delete_my_r_review")
	public String delete_my_r_review(int num,RedirectAttributes attribute, HttpServletRequest request) {
		int n=reviewService.reviewDelete(num);
		//현재 페이지와 페이지당컨텐츠수 유지하면서 리다이렉트
		String curPage=request.getParameter("curPage");
		String amount=request.getParameter("amount");
		attribute.addAttribute("curPage",curPage);
		attribute.addAttribute("amount",amount);
		
		return "redirect:my_r_review";
	}
		
	
	//숙소리뷰
	@GetMapping("/my_l_review")
	public ModelAndView myLodgingReview(@RequestParam(value = "curPage", required = false, defaultValue = "1") int curPage,
			@RequestParam(value="amount",required=false, defaultValue="10")int amount,
			HttpSession session) {
		//세션에서 로그인정보 가져오기
		MemberDTO user=(MemberDTO)session.getAttribute("login");
		String userid=user.getUserid();
		
		UpgradePageDTO pageDTO=mypageService.select_l_review(userid,curPage, amount);
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("mypage/myLodgingReview");
		mav.addObject("pageDTO",pageDTO);
		
		
		return mav;
	}
	//숙소리뷰 삭제
	@GetMapping("/delete_my_l_review")
	public String delete_my_l_review(int num,RedirectAttributes attribute, HttpServletRequest request) {
		int n=reviewService.lodReviewDelete(num);
		//현재 페이지와 페이지당컨텐츠수 유지하면서 리다이렉트
		String curPage=request.getParameter("curPage");
		String amount=request.getParameter("amount");
		attribute.addAttribute("curPage",curPage);
		attribute.addAttribute("amount",amount);
		
		return "redirect:my_l_review";
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
		
		HashMap<String, String> map=new HashMap<String, String>();
		map.put("userid", userid);
		map.put("password", inputPw);
		
		
		//사용자가 입력한 비번과 비교하기
		if(encodeService.checkPW(map)) {
			//비번이 맞은경우 회원탈퇴
			int n=mypageService.memberDelete(userid);
			//탈퇴 성공시 메인으로 이동
			if(n>0) {
				session.invalidate();//세션 정보 초기화
				return "mypage/successDelete";
			}else {
				//탈퇴 실패시 에러
				return "mypage/failDelete";
			}
		}else {
			//비번 틀렸으면 에서
			return "mypage/failDelete";
		}
	}
	
	//게시판 조회
	@GetMapping("/mytext")
	public ModelAndView mytext(@RequestParam(value = "curPage", required = false, defaultValue = "1") int curPage,
			@RequestParam(value="amount",required=false,defaultValue="10")int amount,
			HttpSession session) {
		
		//세션에서 로그인정보 가져오기
		MemberDTO user=(MemberDTO)session.getAttribute("login");
		String userid=user.getUserid();
		UpgradePageDTO pageDTO=mypageService.selectText(userid,curPage,amount);
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("mypage/myText");
		mav.addObject("pageDTO",pageDTO);
		
		return mav;
	}

	
	//마이페이지에서 게시판 삭제하기
	@GetMapping("/delete_mytext")
	public String delete_myText(int no,RedirectAttributes attribute, HttpServletRequest request) {
		int n=boardService.boardDelete(no);
		//현재 페이지와 페이지당컨텐츠수 유지하면서 리다이렉트
		String curPage=request.getParameter("curPage");
		String amount=request.getParameter("amount");
		attribute.addAttribute("curPage",curPage);
		attribute.addAttribute("amount",amount);
		
		return "redirect:mytext";
	}
	
	//닉네임 변경 중복확인.
	@GetMapping(value="/mypageNicknameCheck", produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String mypageNicknameCheck(@RequestParam("nickname")String nickname, @RequestParam("currNickname")String currNickname) {
		
		System.out.println("currnickname: "+currNickname);
		System.out.println("nickname: "+nickname);
		
		if(nickname.equals(currNickname)) {
			return "나의 팀만 변경합니다";
		}
		
		MemberDTO dto=memberService.nicknameCheck(nickname);
		String mesg="닉네임 사용 가능";
		if(dto!=null) {
			mesg="닉네임 중복";
		}
		
		return mesg;
		
	}
	
}