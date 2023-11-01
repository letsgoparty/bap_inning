package com.app.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.app.dto.MemberDTO;


@Component
public class MyHandlerInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		  // 세션에서 로그인 정보를 가져오고 로그인 체크를 수행
      HttpSession session = request.getSession();
      MemberDTO getmypage = (MemberDTO) session.getAttribute("login");
      System.out.println("getmypage: " + getmypage);
      if(getmypage==null){
          response.sendRedirect("/app/loginForm"); // 리다이렉트. 리다이렉트 페이지 수정할 수도 있음
          return false; // 요청 중단
        
      } 
	   return true;
    
	}
	
	
	
}