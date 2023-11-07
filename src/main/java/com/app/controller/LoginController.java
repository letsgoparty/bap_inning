package com.app.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.app.dto.MemberDTO;
import com.app.service.EncodeService;
import com.app.service.MemberService;

@Controller
public class LoginController {
	@Autowired
	MemberService service;
	
	@Autowired
	EncodeService encodeService;
	
	@GetMapping("/loginsubmit")
	public String login(@RequestParam HashMap<String, String> map, 
			                          HttpSession session, Model model) {
		String nextPage=null;
	    try {
	        map = encodeService.login(map); // 입력받은 비밀번호의 암호화와 DB에 저장된 암호화 비밀번호가 일치한지 확인 
	        MemberDTO dbdto = service.login(map); // DB에서 아이디와 비밀번호가 일치하는 회원 정보 가져오기 

	        if (dbdto != null) {
	        	String temp_passwd = dbdto.getTemp_passwd();
	            session.setAttribute("login", dbdto);
	            if (temp_passwd.equals("false")) {
	                // 비밀번호가 임시 비밀번호로 설정된 경우, 비밀번호 재설정 페이지로 리다이렉트
	        		return "login/resetpw"; // 비번 재설정창으로 이동
	            } else {
	            nextPage = "redirect:/main"; // Corrected the redirect path
	            System.out.println("로그인 성공");
	            }
	        } else {
	            model.addAttribute("error", "로그인에 실패했습니다.<br>아이디와 비밀번호를 확인해주세요.");
	            nextPage = "loginForm"; // Corrected the view name to return in case of failure
	            System.out.println("로그인 실패");
	        }
	    } catch (Exception e) { // Corrected "Excetion" to "Exception"
	        e.printStackTrace(); // It's a good practice to print the exception for debugging
	        model.addAttribute("error", "로그인 중에 오류가 발생했습니다.");
	        nextPage = "loginForm"; // Handle exceptions by returning to the login form
	        System.out.println("로그인 중 에러 발생");
	    }
		return nextPage;
	}
	
	@PostMapping("/resetpwd")	
    public String resetPassword(HttpSession session, @RequestParam String newPasswd) {
     // 세션에서 사용자 ID 가져오기
		MemberDTO dto = (MemberDTO) session.getAttribute("login");
		System.out.println("dto 정보: " + dto);
		String userid = dto.getUserid();
        if (userid != null) {
            // 비밀번호 변경을 위한 파라미터 생성
            HashMap<String, String> map = new HashMap<String, String>();
            String encode_newPasswd = encodeService.modify(newPasswd); // 새로운 비밀번호 암호화
            map.put("userid", userid);
            map.put("password", encode_newPasswd);

            int n=service.resetPassword(map); 
            
            if (n > 0) {
            	session.invalidate(); //로그아웃
                return "login/successresetpw";
            } else {
                return "비밀번호 변경에 실패";
            }
        } else {
            return "사용자 비로그인";
        }
	
	}
	
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		 session.invalidate(); //로그아웃
		return "/login/successLogout";
	}
	
}
