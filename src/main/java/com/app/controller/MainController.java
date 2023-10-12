package com.app.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.app.dto.TeamDTO;

@Controller
public class MainController {
	/*******************************************
	임시 Controller 입니다.
	********************************************/
	@RequestMapping("/main")
	public String main(Model m) {
		  try {
	            // Jsoup을 사용하여 웹페이지의 HTML 가져오기
	            Document doc = Jsoup.connect("https://sports.news.naver.com/kbaseball/record/index.nhn?category=kbo")
	                    .userAgent("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36")
	                    .get();

	            // select를 이용해서 tr들을 불러오기
	            Elements baseballTeams = doc.select("#regularTeamRecordList_table > tr");

	         
	            
	            List<TeamDTO> teamDataList = new ArrayList<>();
	            
	            // tr들의 반복문 돌리기
	            for (Element baseballTeam : baseballTeams) {
	                Element rank = baseballTeam.selectFirst("th"); // 등 수 	                
	                Element title = baseballTeam.selectFirst("span:nth-child(2)"); // 팀 명
	                Element match = baseballTeam.selectFirst("td:nth-child(3)"); // 경기 수 
	                Element victory = baseballTeam.selectFirst("td:nth-child(4)"); // 승 
	                Element defeat = baseballTeam.selectFirst("td:nth-child(5)"); // 패
	                Element draw = baseballTeam.selectFirst("td:nth-child(6)"); // 무
	                Element rate = baseballTeam.selectFirst("td:nth-child(7)"); // 승률
	                Element winning = baseballTeam.selectFirst("td:nth-child(9)"); // 연승
	                Element recent = baseballTeam.selectFirst("td:nth-child(12)"); // 최근 10경기
	                
	               System.out.println(rank.text() + " " + title.text() + " " + match.text() + " " + victory.text() + " " + defeat.text() + " " + draw.text() + " " + rate.text() + " " + winning.text() + " " + recent.text());
	                
	                if (title != null) {
	                	String image = title.text();
	                   TeamDTO teamData = new TeamDTO(rank.text(), image, title.text(), match.text(), victory.text(), defeat.text(), draw.text(), rate.text(), winning.text(), recent.text());
	                   teamDataList.add(teamData);
	                }
	            }
	            
	            m.addAttribute("teamDataList", teamDataList);

	        } catch (IOException e) {
	            e.printStackTrace();
	        }

		
		return "main";
	}
}