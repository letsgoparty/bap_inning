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

	@Override
	public int reviewUpdate(ReviewDTO reviewDTO) {
		return dao.reviewUpdate(reviewDTO);
	}

	@Override
	public int reviewDelete(String review_id) {
		return dao.reviewDelete(review_id);
	}

	@Override
	public ReviewDTO reviewRetrieve(String review_id) {
		ReviewDTO dto = dao.reviewRetrieve(review_id);
		return dto;
	}

}
