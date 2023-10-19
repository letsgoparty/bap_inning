package com.app.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.app.dto.ScheduleDTO;
import com.app.dto.TeamDTO;

/*******************************
 * 
 * 1. KBO 리그 일정 크롤링 2. KBO 리그 순위 크롤링
 *
 *******************************/

@Service
public class ScrapingService {

	// KBO 리그 일정 가져오기 by Selenium, Jsoup
	public List<ScheduleDTO> scrapeSchedule() {
		List<ScheduleDTO> ScheduleList = new ArrayList<>();
		// Selenium WebDriver 설정 (ChromeDriver)
		System.setProperty("webdriver.chrome.driver", "src/main/resources/static/driver/chromedriver.exe");

		// 브라우저 창 숨기는 옵션 추가
		ChromeOptions options = new ChromeOptions();
		options.addArguments("headless");
		WebDriver driver = new ChromeDriver(options);

		try {
			// 셀레니움으로 웹 페이지 접근
			driver.get("https://www.koreabaseball.com/Schedule/Schedule.aspx");

			// 셀레니움으로 가져온 HTML을 Jsoup으로 파싱
			Document doc = Jsoup.parse(driver.getPageSource());
			Elements baseballSchedule = doc.select("#tblScheduleList > tbody > tr");

			String currentDay = null;
			for (Element Schedule : baseballSchedule) {
				Element day = Schedule.selectFirst("td.day");
				Element time = Schedule.selectFirst("td.time");
				Element team1 = Schedule.selectFirst("td.play > span");
				Element vs = Schedule.selectFirst("td.play > em");
				Element team2 = Schedule.selectFirst("td.play > span:nth-child(3)");
				Element location = Schedule.selectFirst("td:nth-child(8)");
				if ("-".equals(location.text())) {
					location = Schedule.selectFirst("td:nth-child(7)");
				}

				if (day != null) {
					if (currentDay == null || !currentDay.equals(day.text())) {
						currentDay = day.text();
					}
				}

				if (time != null) {
					ScheduleDTO dto = new ScheduleDTO(currentDay, time.text(), team1.text(), vs.text(), team2.text(),
							location.text());
					ScheduleList.add(dto);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// WebDriver 종료 (쭝요)
			driver.quit();
		}
		return ScheduleList;
	}

	// KBO 리그 순위 가져오기 by Jsoup
	public List<TeamDTO> scrapeRank() {
		List<TeamDTO> teamDataList = new ArrayList<>();
		try {

			// KBO 리그 순위 가져오기
			Document doc = Jsoup.connect("https://sports.news.naver.com/kbaseball/record/index.nhn?category=kbo")
					.userAgent(
							"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36")
					.get();

			// select를 이용해서 tr들을 불러오기
			Elements baseballTeams = doc.select("#regularTeamRecordList_table > tr");

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

				if (title != null) {
					String image = title.text();
					TeamDTO teamData = new TeamDTO(rank.text(), image, title.text(), match.text(), victory.text(),
							defeat.text(), draw.text(), rate.text(), winning.text(), recent.text());
					teamDataList.add(teamData);
				}
			}

		} catch (IOException e) {
			e.printStackTrace();
		}
		return teamDataList;
	}
	
	public Elements scrapePost() {

		Elements postSeason = null;
		
		System.setProperty("webdriver.chrome.driver", "src/main/resources/static/driver/chromedriver.exe");

		// 브라우저 창 숨기는 옵션 추가
		ChromeOptions options = new ChromeOptions();
		options.addArguments("headless");
		WebDriver driver = new ChromeDriver(options);

		try {
			// 셀레니움으로 웹 페이지 접근
			driver.get("https://www.koreabaseball.com/");

			// 셀레니움으로 가져온 HTML을 Jsoup으로 파싱
			Document doc = Jsoup.parse(driver.getPageSource());
			postSeason = doc.select(".match-cont");
			System.out.println(postSeason);


		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// WebDriver 종료 (쭝요)
			driver.quit();
		}
		return postSeason;
	}
}
