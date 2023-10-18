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
		List<ScheduleDTO> ScheduleList = service.scrapeSchedule();
		m.addAttribute("ScheduleList", ScheduleList);

		// KBO 리그 순위 가져오기
		List<TeamDTO> teamDataList = service.scrapeRank();
		m.addAttribute("teamDataList", teamDataList);

		m.addAttribute("postSeason", service.xxx());
		
		return "main";
	}
}