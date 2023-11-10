package com.app.config;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.app.dao.PlayerDAO;
import com.app.dto.ScheduleDTO;
import com.app.dto.TeamDTO;

@Component
public class SchedulingConfig {

	@Autowired
	PlayerDAO dao;

	@Scheduled(cron = "0 0 8 * * ?") // 매일 아침 10시에 실행 (일단 임시로 8시라 지정함)
	public void save_schedule() {
//		scrapeRank();  정규시즌이 종료 ➜ 정규리그 순위 갱신 중단
		scrapeSchedule();
		scrapePost();
		scrapeHighlight();
		System.out.println("************************  AM 10:00  *********************** ");
		System.out.println("******************** 포스트시즌 대진을 갱신하였습니다. ************** ");
		System.out.println("******************** 경기일정을 갱신하였습니다. ******************* ");
		System.out.println("******************** 하이라이트 영상을 갱신하였습니다. ************** ");
	}

	// KBO 리그일정 가져오기
	public void scrapeSchedule() {
		dao.deleteSchedule(); // 기존 데이터 삭제

		System.setProperty("webdriver.chrome.driver", "src/main/resources/static/driver/chromedriver.exe");

		ChromeOptions options = new ChromeOptions();
		options.addArguments("headless");
		WebDriver driver = new ChromeDriver(options);

		try {
			driver.get("https://www.koreabaseball.com/Schedule/Schedule.aspx");

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
					dao.saveSchedule(dto);

				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			driver.quit();
		}
	}

	// 포스트시즌 대진
	public void scrapePost() {
		dao.deletePostSeason(); // 기존 데이터 삭제

		System.setProperty("webdriver.chrome.driver", "src/main/resources/static/driver/chromedriver.exe");

		ChromeOptions options = new ChromeOptions();
		options.addArguments("headless");
		WebDriver driver = new ChromeDriver(options);

		try {
			driver.get("https://www.koreabaseball.com/");

			Document doc = Jsoup.parse(driver.getPageSource());
			Elements postSeason = doc.select(".match-cont");

			dao.savePostSeason(postSeason.html());

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			driver.quit();
		}
	}

	// 정규시즌 순위
	public void scrapeRank() {
		dao.deleteRank();

		try {
			Document doc = Jsoup.connect("https://sports.news.naver.com/kbaseball/record/index.nhn?category=kbo")
					.userAgent(
							"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36")
					.get();

			Elements baseballTeams = doc.select("#regularTeamRecordList_table > tr");

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
					dao.saveRank(teamData);
				}
			}

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 하이라이트 영상
	public void scrapeHighlight() {
		dao.deleteHighlight();

		System.setProperty("webdriver.chrome.driver", "src/main/resources/static/driver/chromedriver.exe");

		ChromeOptions options = new ChromeOptions();
		options.addArguments("headless");
		WebDriver driver = new ChromeDriver(options);

		try {
			driver.get("https://www.koreabaseball.com/MediaNews/Highlight/List.aspx");
			WebDriverWait wait = new WebDriverWait(driver, 10);
			WebElement element = wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("div.video")));
			Document doc = Jsoup.parse(driver.getPageSource());
			Elements highlight = doc.select("ul#ulHighlight.boardMovie");
			dao.saveHighlight(highlight.html());
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// WebDriver 종료 (쭝요)
			driver.quit();
		}
	}
}
