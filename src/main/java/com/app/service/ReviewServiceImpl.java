package com.app.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.dao.ReviewDAO;
import com.app.dto.ReviewDTO;
import com.app.dto.ReviewPageDTO;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	ReviewDAO dao;


	@Override
	public ReviewPageDTO r_reviewList(int curPage, int res_id) {
		return dao.r_reviewList(curPage, res_id);
	}

	@Override
	public ReviewPageDTO l_reviewList(int curPage, int res_id) {
		return dao.l_reviewList(curPage, res_id);
	}

	@Override
	public int reviewWrite(ReviewDTO reviewDTO) {
		return dao.reviewWrite(reviewDTO);
	}

	@Override
	public int reviewUpdate(ReviewDTO reviewDTO) {
		return dao.reviewUpdate(reviewDTO);
	}

	@Override
	public int reviewDelete(int review_id) {
		int n = dao.reviewDelete(review_id);
		return review_id;
	}

	@Override
	public ReviewDTO reviewRetrieve(String review_id) {
		ReviewDTO dto = dao.reviewRetrieve(review_id);
		return dto;
	}
	
	@Override
	public int find_seq() {
		return dao.find_seq();
	}
	
	@Override
	public int save_url(HashMap<String, Object> map) {
		return dao.save_url(map);
	}
	
}
