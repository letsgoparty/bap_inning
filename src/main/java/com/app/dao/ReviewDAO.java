package com.app.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.dto.LodReviewDTO;
import com.app.dto.ReviewDTO;
import com.app.dto.ReviewPageDTO;

@Repository
public class ReviewDAO {

	@Autowired
	SqlSessionTemplate session;

	//음식점 전체 리뷰
	public int r_totalCount(int res_id) {
		return session.selectOne("ReviewMapper.r_totalCount", res_id);
	}
	
	public ReviewPageDTO r_reviewList(int curPage, int res_id) {
		ReviewPageDTO pageDTO = new ReviewPageDTO();
		int offset = (curPage-1)*pageDTO.getPerPage();
		int limit = pageDTO.getPerPage();
		List<ReviewDTO> list =  session.selectList("ReviewMapper.r_reviewList", res_id, new RowBounds(offset, limit));

		pageDTO.setList(list);
		pageDTO.setCurPage(curPage);
		pageDTO.setTotalCount(r_totalCount(res_id));
		
		return pageDTO;
	}
	
	//숙소 전체 리뷰
	public int l_totalCount(int lodging_id) {
		return session.selectOne("ReviewMapper.l_totalCount", lodging_id);
	}
	
	public ReviewPageDTO l_reviewList(int curPage, int lodging_id) {
		ReviewPageDTO pageDTO = new ReviewPageDTO();
		int offset = (curPage-1)*pageDTO.getPerPage();
		int limit = pageDTO.getPerPage();
		List<LodReviewDTO> lodList =  session.selectList("ReviewMapper.l_reviewList", lodging_id, new RowBounds(offset, limit));
		
		pageDTO.setLodList(lodList);
		pageDTO.setCurPage(curPage);
		pageDTO.setTotalCount(l_totalCount(lodging_id));
		
		return pageDTO;
	}
	
	
	//리뷰 등록
	public int reviewWrite(ReviewDTO dto) {
		return session.insert("ReviewMapper.reviewWrite", dto);
	}
	public int lodReviewWrite(LodReviewDTO dto) {
		return session.insert("ReviewMapper.lodReviewWrite", dto);
	}
	
	//리뷰 상세 보기
	public ReviewDTO reviewRetrieve(String review_id) {
		return session.selectOne("ReviewMapper.reviewRetrieve", review_id);
	}
	public LodReviewDTO lodReviewRetrieve(String review_id) {
		return session.selectOne("ReviewMapper.lodReviewRetrieve", review_id);
	}
	
	//리뷰 수정
	public int reviewUpdate(ReviewDTO dto) {
		return session.update("ReviewMapper.reviewUpdate", dto);
	}
	public int lodReviewUpdate(LodReviewDTO dto) {
		return session.update("ReviewMapper.lodReviewUpdate", dto);
	}

	//리뷰 삭제
	public int reviewDelete(int review_id) {
		return session.delete("ReviewMapper.reviewDelete", review_id);
	}
	public int lodReviewDelete(int review_id) {
		return session.delete("ReviewMapper.lodReviewDelete", review_id);
	}
	
	
	//리뷰 이미지 업로드용
	public int find_seq() {
		return session.selectOne("ReviewMapper.find_seq");
	}
	public int lod_find_seq() {
		return session.selectOne("ReviewMapper.lod_find_seq");
	}
	
	public int save_url(HashMap<String, Object> map) {
		return session.delete("ReviewMapper.save_url", map);
	}
	public int lod_save_url(HashMap<String, Object> map) {
		return session.delete("ReviewMapper.lod_save_url", map);
	}
	
	public List<String> res_find_img(int review_id) {
		return session.selectList("ReviewMapper.res_find_img", review_id);
	}
	public List<String> lod_find_img(int review_id) {
		return session.selectList("ReviewMapper.lod_find_img", review_id);
	}
	
	//리뷰 추천
//	public int res_like_cnt(int review_id) {
//		return session.update("ReviewMapper.res_like_cnt", review_id);
//	}
//	public int lod_like_cnt(int review_id) {
//		return session.update("ReviewMapper.lod_like_cnt", review_id);
//	}
	public int res_like_cnt(ReviewDTO dto) {
		return session.update("ReviewMapper.res_like_cnt", dto);
	}	
	public int lod_like_cnt(LodReviewDTO dto) {
		return session.update("ReviewMapper.lod_like_cnt", dto);
	}	
}
