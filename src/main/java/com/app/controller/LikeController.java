package com.app.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.app.dto.LikeDTO;
import com.app.dto.MemberDTO;
import com.app.service.LikeService;

/*******************************
 * 
 * 찜하기 기능 Controller
 *
 *******************************/
@RestController
public class LikeController {

	@Autowired
	LikeService service;

	@GetMapping("/loginCheck/like_res")
	public String like_res(LikeDTO Ldto, HttpSession session) {
		MemberDTO mDTO = (MemberDTO) session.getAttribute("login");

		if (mDTO == null) {
			return "로그인이 필요합니다.";
		} else {
			Ldto.setUserid(mDTO.getUserid());
			int n = service.like_res(Ldto);
		}
		return "찜 목록에 저장되었습니다.";
	}

	@GetMapping("/loginCheck/like_lod")
	public String like_lod(LikeDTO Ldto, HttpSession session) {
		MemberDTO mDTO = (MemberDTO) session.getAttribute("login");

		if (mDTO == null) {
			return "로그인이 필요합니다.";
		} else {
			Ldto.setUserid(mDTO.getUserid());
			int n = service.like_lod(Ldto);
		}
		return "찜 목록에 저장되었습니다.";
	}
}