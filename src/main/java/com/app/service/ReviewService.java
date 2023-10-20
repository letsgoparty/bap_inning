package com.app.service;

import com.app.dto.ReviewDTO;
import com.app.dto.ReviewPageDTO;

public interface ReviewService {

	public ReviewPageDTO r_reviewList(int curPage);
	public ReviewPageDTO l_reviewList(int curPage);
	public int reviewWrite(ReviewDTO reviewDTO);
	public int reviewUpdate(ReviewDTO reviewDTO);
	public int reviewDelete(String review_id);
	public ReviewDTO reviewRetrieve(String review_id);
}
