package com.app.service;

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

import com.app.dto.ScheduleDTO;

@Service
public class ScrapingService {

	public List<ScheduleDTO> scrapeData() {
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
//			  System.out.println(baseballSchedule);
			
			String currentDay = null;
			for (Element Schedule : baseballSchedule) {
				Element day = Schedule.selectFirst("td.day");
				Element time = Schedule.selectFirst("td.time");
				Element team1 = Schedule.selectFirst("td.play > span");
				Element vs = Schedule.selectFirst("td.play > em");
				Element team2 = Schedule.selectFirst("td.play > span:nth-child(3)");
				Element location = Schedule.selectFirst("td:nth-child(8)");
				if("-".equals(location.text())) {
					location = Schedule.selectFirst("td:nth-child(7)");
				} 

				if (day != null) {
					if (currentDay == null || !currentDay.equals(day.text())) {
						currentDay = day.text();
					}
				}
				
				ScheduleDTO dto = new ScheduleDTO(currentDay, time.text(), team1.text(), vs.text(), team2.text(), location.text());
				ScheduleList.add(dto);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// WebDriver 종료
			driver.quit();
		}
		return ScheduleList;
	}
}
