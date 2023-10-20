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
		System.out.println("MyHandlerInterceptor.preHandle");
		
		  // 세션에서 로그인 정보를 가져오고 로그인 체크를 수행
      HttpSession session = request.getSession();
      MemberDTO getmypage = (MemberDTO) session.getAttribute("login");
      System.out.println("getmypage: " + getmypage);
      if(getmypage==null){
          response.sendRedirect("main"); // 리다이렉트. 리다이렉트 페이지 수정할 수도 있음
          return false; // 요청 중단
        
      }
	   return true;
    
      //System.out.println("Session ID: " + session.getId());
      //System.out.println("Creation Time: " + session.getCreationTime());
      //System.out.println("getmypage: " + getmypage);

      
	  // 마이페이지 로딩 안 되는 문제가 인터셉터 때문인 듯 하여 수정해야함
	}
	
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		System.out.println("MyHandlerInterceptor.postHandle");
	}
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		System.out.println("MyHandlerInterceptor.afterCompletion");
	}
}