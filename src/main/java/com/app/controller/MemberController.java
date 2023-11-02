package com.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.app.dto.JspMemberDTO;
import com.app.dto.MemberDTO;
import com.app.service.EmailService;
import com.app.service.EncodeService;
import com.app.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	MemberService service;
	
	@Autowired 
	EncodeService Eservice;
	
	@Autowired
	EmailService emailService;
	
	
	@RequestMapping("/memberForm")	
	public String memberForm() {
		return "memberForm";
	}
	
	@RequestMapping("/loginForm")
	public String loginForm() {
		return "loginForm";
	}
	
	@PostMapping("/memberAdd")
	public String memberAdd(JspMemberDTO dto) {
		 try {
		String combinedEmail = dto.getEmail1() + "@" + dto.getEmail2();
	    MemberDTO dbdto = new MemberDTO(); // MemberDTO 객체 생성
	    dbdto.setUserid(dto.getUserid());
	    dbdto.setPassword(dto.getPassword());
	    dbdto.setEmail(combinedEmail); // MemberDTO의 setEmail 메서드를 사용하여 email 설정
	    dbdto.setNickname(dto.getNickname());
	    dbdto.setTeam_code(dto.getTeam_code());
		//System.out.println(dto);
		//System.out.println(dbdto);
	    MemberDTO Mdto = Eservice.register(dbdto);
		int n = service.memberAdd(Mdto);
	
		if (n > 0) {
			return "join/welcome";
        } else {
            // 회원가입 실패 시 예외 던지기
            throw new Exception("회원가입 실패");
        }
    } catch (Exception e) {
        // 예외 처리: 실패한 경우 "joinfailed" 페이지로 리다이렉트
    	return "join/joinfailed";
    }
  }

	@GetMapping(value="/memberIdCheck",
			  produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String idCheck(@RequestParam ("userid") 
	                           String userid) {
		MemberDTO dto = service.idCheck(userid);
		String mesg = "아이디 사용 가능";
		if(dto!=null) {
			mesg = "아이디 중복";
		}
		return mesg;
	}
	

	
}
