package com.app.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.dao.ReviewDAO;
import com.app.dto.LodReviewDTO;
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
	public ReviewPageDTO l_reviewList(int curPage, int lodging_id) {
		return dao.l_reviewList(curPage, lodging_id);
	}

	@Override
	public int reviewWrite(ReviewDTO reviewDTO) {
		return dao.reviewWrite(reviewDTO);
	}

	@Override
	public int lodReviewWrite(LodReviewDTO dto) {
		return dao.lodReviewWrite(dto);
	}

	@Override
	public ReviewDTO reviewRetrieve(String review_id) {
		return dao.reviewRetrieve(review_id);
	}
	
	@Override
	public LodReviewDTO lodReviewRetrieve(String review_id) {
		return dao.lodReviewRetrieve(review_id);
	}
	
	@Override
	public int reviewUpdate(ReviewDTO reviewDTO) {
		return dao.reviewUpdate(reviewDTO);
	}
	
	@Override
	public int lodReviewUpdate(LodReviewDTO dto) {
		return dao.lodReviewUpdate(dto);
	}

	@Override
	public int reviewDelete(int review_id) {
		int n = dao.reviewDelete(review_id);
		return review_id;
	}
	
	@Override
	public int lodReviewDelete(int review_id) {
		int n = dao.lodReviewDelete(review_id);
		return review_id;
	}

	@Override
	public int find_seq() {
		return dao.find_seq();
	}
	
	@Override
	public int lod_find_seq() {
		return dao.lod_find_seq();
	}
	
	@Override
	public int save_url(HashMap<String, Object> map) {
		return dao.save_url(map);
	}
	
	@Override
	public int lod_save_url(HashMap<String, Object> map) {
		return dao.lod_save_url(map);
	}

	@Override
	public List<String> res_find_img(int review_id) {
		return dao.res_find_img(review_id);
	}

	@Override
	public List<String> lod_find_img(int review_id) {
		return dao.lod_find_img(review_id);
	}
	
}
