package com.app.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.app.dto.MemberDTO;


@Component
public class AdminInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

      HttpSession session = request.getSession();
      MemberDTO getmypage = (MemberDTO) session.getAttribute("login");
      System.out.println("getmypage: " + getmypage);
      if (getmypage == null || !"admin".equals(getmypage.getUserid())) {
          response.sendRedirect("/app/loginForm"); 
          return false; 
        
      } 
	   return true;
	}
}