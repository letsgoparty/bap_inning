package com.app.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

/*******************************************
 *
 * 각 경기장 별 맛집 & 숙소 찾기 페이지 지정 Controller 
 *
 ********************************************/

@Controller
public class MapsController {

    @Value("${google.maps.api.key}")
    private String googleMapsApiKey;

	// SSG 경기장 주변 맛집 찾기 페이지 이동 
	@GetMapping("/r_SSG")
	public String r_SSG(Model m) {
		System.out.println(googleMapsApiKey);
		m.addAttribute("googleMapsApiKey", googleMapsApiKey);
		return "restaurant/SSG";
	}
	// kiwoom 경기장 주변 맛집 찾기 페이지 이동
	@GetMapping("/r_kiwoom")
	public String r_kiwoom(Model m) {
		m.addAttribute("googleMapsApiKey", googleMapsApiKey);
		return "restaurant/kiwoom";
	}
	// LG, 두산 잠실 경기장 주변 맛집 찾기 페이지 이동
	@GetMapping("/r_jamsil")
	public String r_jamsil(Model m) {
		m.addAttribute("googleMapsApiKey", googleMapsApiKey);
		return "restaurant/jamsil";
	}
	// KTwiz 경기장 주변 맛집 찾기 페이지 이동
	@GetMapping("/r_KT")
	public String r_KT(Model m) {
		m.addAttribute("googleMapsApiKey", googleMapsApiKey);
		return "restaurant/KT";
	}
	// KIA타이거즈 경기장 주변 맛집 찾기 페이지 이동
	@GetMapping("/r_KIA")
	public String r_KIA(Model m) {
		m.addAttribute("googleMapsApiKey", googleMapsApiKey);
		return "restaurant/KIA";
	}
	// NC 경기장 주변 맛집 찾기 페이지 이동
	@GetMapping("/r_NC")
	public String r_NC(Model m) {
		m.addAttribute("googleMapsApiKey", googleMapsApiKey);
		return "restaurant/NC";
	}
	// 삼성 경기장 주변 맛집 찾기 페이지 이동
	@GetMapping("/r_samsung")
	public String r_samsung(Model m) {
		m.addAttribute("googleMapsApiKey", googleMapsApiKey);
		return "restaurant/samsung";
	}
	// 롯데 경기장 주변 맛집 찾기 페이지 이동 
	@GetMapping("/r_lotte")
	public String r_lotte(Model m) {
		m.addAttribute("googleMapsApiKey", googleMapsApiKey);
		return "restaurant/lotte";
	}
	// 한화 경기장 주변 맛집 찾기 페이지 이동 
	@GetMapping("/r_hanwha")
	public String r_hanwha(Model m) {
		m.addAttribute("googleMapsApiKey", googleMapsApiKey);
		return "restaurant/hanwha";
	}
	
	// SSG 경기장 주변 숙소 찾기 페이지 이동 
	@GetMapping("/l_SSG")
	public String l_SSG(Model m) {
		m.addAttribute("googleMapsApiKey", googleMapsApiKey);
		return "lodging/SSG";
	}
	// kiwoom 경기장 주변 숙소 찾기 페이지 이동
	@GetMapping("/l_kiwoom")
	public String l_kiwoom(Model m) {
		m.addAttribute("googleMapsApiKey", googleMapsApiKey);
		return "lodging/kiwoom";
	}
	// LG, 두산 잠실 경기장 주변 숙소 찾기 페이지 이동
	@GetMapping("/l_jamsil")
	public String l_jamsil(Model m) {
		m.addAttribute("googleMapsApiKey", googleMapsApiKey);
		return "lodging/jamsil";
	}
	// KTwiz 경기장 주변 숙소 찾기 페이지 이동
	@GetMapping("/l_KT")
	public String l_KT(Model m) {
		m.addAttribute("googleMapsApiKey", googleMapsApiKey);
		return "lodging/KT";
	}
	// KIA타이거즈 경기장 주변 숙소 찾기 페이지 이동
	@GetMapping("/l_KIA")
	public String l_KIA(Model m) {
		m.addAttribute("googleMapsApiKey", googleMapsApiKey);
		return "lodging/KIA";
	}
	// NC 경기장 주변 숙소 찾기 페이지 이동
	@GetMapping("/l_NC")
	public String l_NC(Model m) {
		m.addAttribute("googleMapsApiKey", googleMapsApiKey);
		return "lodging/NC";
	}
	// 삼성 경기장 주변 숙소 찾기 페이지 이동
	@GetMapping("/l_samsung")
	public String l_samsung(Model m) {
		m.addAttribute("googleMapsApiKey", googleMapsApiKey);
		return "lodging/samsung";
	}
	// 롯데 경기장 주변 숙소 찾기 페이지 이동 
	@GetMapping("/l_lotte")
	public String l_lotte(Model m) {
		m.addAttribute("googleMapsApiKey", googleMapsApiKey);
		return "lodging/lotte";
	}
	// 한화 경기장 주변 숙소 찾기 페이지 이동 
	@GetMapping("/l_hanwha")
	public String l_hanwha(Model m) {
		m.addAttribute("googleMapsApiKey", googleMapsApiKey);
		m.addAttribute("googleMapsApiKey", googleMapsApiKey);
		return "lodging/hanwha";
	}
}
