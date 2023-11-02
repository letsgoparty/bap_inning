package com.app.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.app.interceptor.AdminInterceptor;
import com.app.interceptor.MyHandlerInterceptor;

@Configuration 
public class WebConfig implements WebMvcConfigurer {
	@Autowired
	MyHandlerInterceptor interceptor;
	
	@Autowired
	AdminInterceptor adminInterceptor;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(interceptor)
		        .addPathPatterns("/mypage", "/write", "/reviewWrite", "/admin/**");
		
	    registry.addInterceptor(adminInterceptor)
        .addPathPatterns("/admin/**");
	}

	
	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		registry.addViewController("/joinfailed")
		        .setViewName("joinfailed");
		
	}

}