package com.app.service;

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
	public ReviewPageDTO r_reviewList(int curPage) {
		return dao.r_reviewList(curPage);
	}

	@Override
	public ReviewPageDTO l_reviewList(int curPage) {
		return dao.l_reviewList(curPage);
	}

	@Override
	public int reviewWrite(ReviewDTO reviewDTO) {
		return dao.reviewWrite(reviewDTO);
	}

}
