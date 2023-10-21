package com.app.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.app.dto.ScheduleDTO;
import com.app.dto.TeamDTO;
import com.app.service.ScrapingService;

/*******************************
 * 
 * 메인화면으로 가는 Controller
 * localhost:8090/app/main
 *
*******************************/
@Controller
public class MainController {

	@Autowired
	private ScrapingService service;

	@RequestMapping("/main")
	public String main(Model m) {

		// KBO 리그 일정 가져오기
		List<ScheduleDTO> ScheduleList = service.cacheScheduleData();
		m.addAttribute("ScheduleList", ScheduleList);

		// KBO 리그 순위 가져오기
		List<TeamDTO> teamDataList = service.cachedRankData();
		m.addAttribute("teamDataList", teamDataList);

		// 포스트 시즌 대진
		m.addAttribute("postSeason", service.cachedPostData());
		
		// 팀 별 일정
		String[] teams = { "all", "SSG", "키움", "LG", "KT", "KIA", "NC", "삼성", "롯데", "두산", "한화" };
		m.addAttribute("teams", teams);
		
		return "main";
	}
}