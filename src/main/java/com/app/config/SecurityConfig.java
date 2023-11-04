package com.app.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.config.annotation.web.configurers.HeadersConfigurer;
import org.springframework.security.config.annotation.web.configurers.RequestCacheConfigurer;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityConfig {
	
	@Bean
	public PasswordEncoder getPasswordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	  @Bean
	  @Order(0)
	  public SecurityFilterChain resources(HttpSecurity http) throws Exception {
	    return http
	        .authorizeRequests(authorize -> authorize
	            .anyRequest().permitAll())
	        .requestCache(RequestCacheConfigurer::disable)
	        .securityContext(AbstractHttpConfigurer::disable)
	        .sessionManagement(AbstractHttpConfigurer::disable)
	        .build();
	  }

	  @Bean
	  public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
	    return http.csrf(AbstractHttpConfigurer::disable)
	        .logout(logout -> logout
	            .logoutUrl("/app/logout"))
	        .formLogin()
	        	.loginPage("/app/loginForm")
	        	.and()
	        .build();
	  }

}