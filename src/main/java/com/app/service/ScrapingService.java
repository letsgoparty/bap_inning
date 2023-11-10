package com.app.service;

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
import org.springframework.cache.annotation.Cacheable;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.app.dao.PlayerDAO;
import com.app.dto.ScheduleDTO;
import com.app.dto.TeamDTO;

/*******************************
 * 
 * 1. KBO 리그 일정 크롤링 2. KBO 리그 순위 크롤링
 *
 *******************************/

@Service
public class ScrapingService {

	@Autowired
	PlayerDAO dao;

	// 스코어보드
	public Elements scrapeScore() {

		Elements ScoreBoard = null;

		System.setProperty("webdriver.chrome.driver", "src/main/resources/static/driver/chromedriver.exe");

		ChromeOptions options = new ChromeOptions();
		options.addArguments("headless");
		WebDriver driver = new ChromeDriver(options);

		try {
			// 셀레니움으로 웹 페이지 접근
			driver.get("https://www.koreabaseball.com/Schedule/ScoreBoard.aspx");

			// 셀레니움으로 가져온 HTML을 Jsoup으로 파싱
			Document doc = Jsoup.parse(driver.getPageSource());
			ScoreBoard = doc.select("div#contents .tScore");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// WebDriver 종료 (쭝요)
			driver.quit();
		}
		return ScoreBoard;
	}

	// 경기결과
	public String scrapeRecord(String url) {
		Elements Record = null;

		System.setProperty("webdriver.chrome.driver", "src/main/resources/static/driver/chromedriver.exe");

		ChromeOptions options = new ChromeOptions();
		options.addArguments("headless");
		WebDriver driver = new ChromeDriver(options);

		try {
			// 셀레니움으로 웹 페이지 접근
			driver.get("https://m.sports.naver.com/game/" + url + "/record");
			 WebDriverWait wait = new WebDriverWait(driver, 10);
			 WebElement element = wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("div.MatchBox_comp_match_box__1oRmr")));
			// 셀레니움으로 가져온 HTML을 Jsoup으로 파싱
			Document doc = Jsoup.parse(driver.getPageSource());
			Record = doc.select("section.Home_game_head__3EEZZ");

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// WebDriver 종료 (쭝요)
			driver.quit();
		}
		return Record.html();
	}

	/***************** 캐싱 처리 **********************/

	private Elements cachedScrapeScore = null;
	private Elements cachedHighlight = null;
	private Elements cachedRecord = null;

	@Cacheable("scoreData")
	public Elements cachedScrapeScore() {
		if (cachedScrapeScore == null) {
			cachedScrapeScore = scrapeScore();
		}
		return cachedScrapeScore;
	}

}
