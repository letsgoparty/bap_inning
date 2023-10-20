package com.app.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.dto.ReviewDTO;
import com.app.dto.ReviewPageDTO;

@Repository
public class ReviewDAO {

	
	@Autowired
	SqlSessionTemplate session;

	//음식점 전체 리뷰
	public int r_totalCount() {
		return session.selectOne("ReviewMapper.r_totalCount");
	}
	
	public ReviewPageDTO r_reviewList(int curPage) {
		ReviewPageDTO pageDTO = new ReviewPageDTO();
		int offset = (curPage-1)*pageDTO.getPerPage();
		int limit = pageDTO.getPerPage();
		List<ReviewDTO> list =  session.selectList("ReviewMapper.r_reviewList", null, new RowBounds(offset, limit));
		
		pageDTO.setList(list);
		pageDTO.setCurPage(curPage);
		pageDTO.setTotalCount(r_totalCount());
		
		return pageDTO;
	}
	
	//숙소 전체 리뷰
	public int l_totalCount() {
		return session.selectOne("ReviewMapper.r_totalCount");
	}
	
	public ReviewPageDTO l_reviewList(int curPage) {
		ReviewPageDTO pageDTO = new ReviewPageDTO();
		int offset = (curPage-1)*pageDTO.getPerPage();
		int limit = pageDTO.getPerPage();
		List<ReviewDTO> list =  session.selectList("ReviewMapper.l_reviewList", null, new RowBounds(offset, limit));
		
		pageDTO.setList(list);
		pageDTO.setCurPage(curPage);
		pageDTO.setTotalCount(l_totalCount());
		
		return pageDTO;
	}
	
	
	//음식점 리뷰 등록
	public int reviewWrite(ReviewDTO reviewDTO) {
		return session.insert("ReviewMapper.reviewWrite", reviewDTO);
	}
	
	//음식점 리뷰 수정
	public int reviewUpdate(ReviewDTO reviewDTO) {
		return session.update("ReviewMapper.reviewUpdate", reviewDTO);
	}
	//리뷰 상세 보기 (수정용)
	public ReviewDTO reviewRetrieve(String review_id) {
		ReviewDTO dto = session.selectOne("ReviewMapper.reviewRetrieve", review_id);
		return dto;
	}

	//음식점 리뷰 삭제
	public int reviewDelete(String review_id) {
		return session.delete("ReviewMapper.reviewDelete", review_id);
	}
	
}
