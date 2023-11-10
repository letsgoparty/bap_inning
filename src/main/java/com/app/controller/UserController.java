package com.app.controller;

import java.sql.Timestamp;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.app.dto.MemberDTO;
import com.app.service.EmailService;
import com.app.service.EncodeService;
import com.app.service.MemberService;

@Controller
public class UserController {

	@Autowired
	EmailService service;

	@Autowired
	MemberService Mservice;

	@Autowired
	EncodeService Eservice;

	@RequestMapping("/forgotpassword")
	public String forgotpassword() {
		return "login/ForgotPW";
	}

	@GetMapping("/sendEmail")
	public String sendPasswordEmail(@RequestParam String email, HttpSession session) throws Exception {
	
		String authCode = null;
	    authCode = service.sendEmailNaver(email);
	    
	   // MemberDTO 객체 생성
	    MemberDTO code = new MemberDTO();
	    code.setEmail(email);
	    code.setAuthcode(authCode);
	    code.setCretime(new Timestamp(System.currentTimeMillis()));

	    
	    int n = service.saveVerificode(code);

		// 메시지 모델에 메시지를 추가
	   // model.addAttribute("successMessage", "이메일이 성공적으로 전송되었습니다.");
		  
	    // 디버깅 
	    System.out.println("디버깅");
	    System.out.println("Email: " + code.getEmail());
	    System.out.println("Authcode: " + code.getAuthcode());
	    System.out.println("Cretime: " + code.getCretime());
	    // 디버깅 
	    
	    // 세션에 이메일 저장
	    session.setAttribute("email", email);
	    
	    return "login/succemail";
	       
	}

	
	@RequestMapping("/codeconfirm")
	public String authcodeconfirm(HttpSession session,  
			                      @RequestParam("verificationCode") String verificationCode) {
		
        
		   // 세션에서 이메일을 꺼내오기
		String iemail = (String) session.getAttribute("email");
		System.out.println("이메일 확인: " + iemail);
		
		
		MemberDTO email = new MemberDTO();
		email.setEmail(iemail);
		
	    MemberDTO dto = Mservice.authcodeconfirm(email);

	    // 필요한 정보를 꺼내오고
	    String authCode = dto.getAuthcode();
	    Timestamp cretime = dto.getCretime();
	    String aemail = dto.getEmail();
	    System.out.println("이메일 확인이당: " + aemail);

	    // 현재 시스템 시간을 가져오고
	    long currentTimeMillis = System.currentTimeMillis();

	    // 생성된 시간과 현재 시간 간의 차이를 계산
	    long elapsedTime = currentTimeMillis - cretime.getTime(); // Timestamp에서 getTime()을 사용하여 long 값으로 변환

	    // 인증코드와 입력한 코드가 일치하고, 생성된 시간이 2분 이내라면 인증 성공.테스트중이라 1분으로 설정해놈
	    if (verificationCode.equals(authCode) && elapsedTime <= 60000) {
	    	//session.setAttribute("email", aemail); //혹시몰라 다시 저장
	        return "login/resetpw";
	    } else {
	    	return "login/failresetpw";
	    }
	}

	@GetMapping("/sendMailCode")
	@ResponseBody
	public String sendMailCode(String email) throws Exception {
		String authCode = null;
			authCode = service.sendCodeNaver(email);

	
		return authCode;
	}
}