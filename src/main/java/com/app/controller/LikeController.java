package com.app.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.app.dto.LikeDTO;
import com.app.dto.MemberDTO;
import com.app.service.LikeService;

/*******************************
 * 
 * 찜하기 기능 RestController
 *
 *******************************/
@RestController
public class LikeController {

	@Autowired
	LikeService service;

	@GetMapping("/like_res")
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

	@GetMapping("/like_lod")
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

	@GetMapping("/delete_like")
	public String delete_like(@RequestParam int id, @RequestParam String type, HttpSession session) {
		MemberDTO mDTO = (MemberDTO) session.getAttribute("login");
		if (mDTO == null) {
			return "로그인이 필요합니다.";
		} else {
			HashMap<String, Object> map = new HashMap<>();
			map.put("userid", mDTO.getUserid());
			map.put("id", id);
			if (type.equals("restaurant")) {
				int n = service.delete_like_res(map);
			} else {
				int n = service.delete_like_lod(map);
			}
		}
		return "삭제되었습니다.";
	}
}