package com.app.service;

import com.app.dto.ReviewDTO;
import com.app.dto.ReviewPageDTO;

public interface ReviewService {

	public ReviewPageDTO r_reviewList(int curPage);
	public ReviewPageDTO l_reviewList(int curPage);
	public int reviewWrite(ReviewDTO reviewDTO);
}
