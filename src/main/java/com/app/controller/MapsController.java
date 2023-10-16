package com.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/*******************************************
 *
 * 각 경기장 별 맛집 & 숙소 찾기 페이지 지정 Controller 
 *
 ********************************************/

@Controller
public class MapsController {

	// SSG 경기장 주변 맛집 찾기 페이지 이동 
	@GetMapping("/r_SSG")
	public String r_SSG() {
		return "restaurant/SSG";
	}
	// kiwoom 경기장 주변 맛집 찾기 페이지 이동
	@GetMapping("/r_kiwoom")
	public String r_kiwoom() {
		return "restaurant/kiwoom";
	}
	// LG, 두산 잠실 경기장 주변 맛집 찾기 페이지 이동
	@GetMapping("/r_jamsil")
	public String r_jamsil() {
		return "restaurant/jamsil";
	}
	// KTwiz 경기장 주변 맛집 찾기 페이지 이동
	@GetMapping("/r_KT")
	public String r_KT() {
		return "restaurant/KT";
	}
	// KIA타이거즈 경기장 주변 맛집 찾기 페이지 이동
	@GetMapping("/r_KIA")
	public String r_KIA() {
		return "restaurant/KIA";
	}
	// NC 경기장 주변 맛집 찾기 페이지 이동
	@GetMapping("/r_NC")
	public String r_NC() {
		return "restaurant/NC";
	}
	// 삼성 경기장 주변 맛집 찾기 페이지 이동
	@GetMapping("/r_samsung")
	public String r_samsung() {
		return "restaurant/samsung";
	}
	// 롯데 경기장 주변 맛집 찾기 페이지 이동 
	@GetMapping("/r_lotte")
	public String r_lotte() {
		return "restaurant/lotte";
	}
	// 한화 경기장 주변 맛집 찾기 페이지 이동 
	@GetMapping("/r_hanwha")
	public String r_hanwha() {
		return "restaurant/hanwha";
	}
	
	// SSG 경기장 주변 숙소 찾기 페이지 이동 
	@GetMapping("/l_SSG")
	public String l_SSG() {
		return "lodging/SSG";
	}
	// kiwoom 경기장 주변 숙소 찾기 페이지 이동
	@GetMapping("/l_kiwoom")
	public String l_kiwoom() {
		return "lodging/kiwoom";
	}
	// LG, 두산 잠실 경기장 주변 숙소 찾기 페이지 이동
	@GetMapping("/l_jamsil")
	public String l_jamsil() {
		return "lodging/jamsil";
	}
	// KTwiz 경기장 주변 숙소 찾기 페이지 이동
	@GetMapping("/l_KT")
	public String l_KT() {
		return "lodging/KT";
	}
	// KIA타이거즈 경기장 주변 숙소 찾기 페이지 이동
	@GetMapping("/l_KIA")
	public String l_KIA() {
		return "lodging/KIA";
	}
	// NC 경기장 주변 숙소 찾기 페이지 이동
	@GetMapping("/l_NC")
	public String l_NC() {
		return "lodging/NC";
	}
	// 삼성 경기장 주변 숙소 찾기 페이지 이동
	@GetMapping("/l_samsung")
	public String l_samsung() {
		return "lodging/samsung";
	}
	// 롯데 경기장 주변 숙소 찾기 페이지 이동 
	@GetMapping("/l_lotte")
	public String l_lotte() {
		return "lodging/lotte";
	}
	// 한화 경기장 주변 숙소 찾기 페이지 이동 
	@GetMapping("/l_hanwha")
	public String l_hanwha() {
		return "lodging/hanwha";
	}
}
