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

	//음식점
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
	
	//숙소
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
	
	
	
}
