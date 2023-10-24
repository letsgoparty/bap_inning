package com.app.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.app.dto.LikeDTO;
import com.app.dto.MemberDTO;
import com.app.dto.ScheduleDTO;
import com.app.dto.TeamDTO;
import com.app.service.ScrapingService;

/*******************************
 * 
 * 찜하기 기능  Controller
 *
*******************************/
@RestController
public class LikeController {
	
	@GetMapping("/like")
	public LikeDTO like(LikeDTO Ldto, HttpSession session) {
		MemberDTO mDTO = (MemberDTO) session.getAttribute("login");
		Ldto.setUser_id(mDTO.getUserid());

		
		System.out.println(Ldto.getId());
		
		return Ldto;
	}
	
}