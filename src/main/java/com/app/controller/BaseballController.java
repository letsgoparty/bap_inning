package com.app.controller;

import org.springframework.stereotype.Controller;

/********************************
 * 메인화면에 야구정보를 출력하는 Controller
 ********************************/

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.io.IOException;

@Controller
public class BaseballController {

    @GetMapping("/")
    public String showBaseballData(Model model) {
        try {
            // Jsoup을 사용하여 웹페이지의 HTML 가져오기
            Document doc = Jsoup.connect("https://sports.news.naver.com/kbaseball/record/index.nhn?category=kbo")
                    .userAgent("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36")
                    .get();

            // select를 이용해서 tr들을 불러오기
            Elements baseballTeams = doc.select("#regularTeamRecordList_table > tr");

            // tr들의 반복문 돌리기
            for (Element baseballTeam : baseballTeams) {
                Element rank = baseballTeam.selectFirst("th"); // th태그의 값 가져오기
                Element title = baseballTeam.selectFirst("span"); // span태그 사이의 값 가져오기
                Element point = baseballTeam.selectFirst("td:nth-child(7) > strong"); // strong 태그 사이의 값 가져오기
                System.out.println("랭크:" + rank.text() + "\t" + title + "\t" + point);
                if (title != null) {
                    model.addAttribute("rank", rank.text());
                    model.addAttribute("title", title.text());
                    model.addAttribute("point", point.text());
                }
            }

        } catch (IOException e) {
            e.printStackTrace();
        }

        return "baseball/rank"; // baseball.jsp 페이지로 포워딩
    }
}

