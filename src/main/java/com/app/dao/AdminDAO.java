package com.app.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.dto.Board;
import com.app.dto.LodReviewDTO;
import com.app.dto.LodgingDTO;
import com.app.dto.MemberDTO;
import com.app.dto.RatingDTO;
import com.app.dto.ResReviewDTO;
import com.app.dto.RestaurantDTO;
import com.app.dto.UserDTO;
import com.app.dto.VisitDTO;

@Repository
public class AdminDAO {

	@Autowired
	SqlSessionTemplate session;

	public List<Board> find_Board() {
		return session.selectList("AdminMapper.find_Board");
	}
	
	public Board find_Board_by_num(int board_num) {
		return session.selectOne("AdminMapper.find_Board_by_num", board_num);
	}
	
	public List<MemberDTO> find_user() {
		return session.selectList("AdminMapper.find_user");
	}
	
	public int find_user_board(String userid) {
		return session.selectOne("AdminMapper.find_user_board", userid);
	}
	public int find_user_commet(String userid) {
		return session.selectOne("AdminMapper.find_user_commet", userid);
	}
	public int find_user_res_review(String userid) {
		return session.selectOne("AdminMapper.find_user_res_review", userid);
	}
	public int find_user_lod_review(String userid) {
		return session.selectOne("AdminMapper.find_user_lod_review", userid);
	}
	public List<ResReviewDTO> find_res_review() {
		return session.selectList("AdminMapper.find_res_review");
	}
	public List<LodReviewDTO> find_lod_review() {
		return session.selectList("AdminMapper.find_lod_review");
	}
	public List<RestaurantDTO> find_res() {
		return session.selectList("AdminMapper.find_res");
	}
	public List<RatingDTO> find_res_rating() {
		return session.selectList("AdminMapper.find_res_rating");
	}
	public int update_res(RestaurantDTO dto) {
		return session.update("AdminMapper.update_res", dto);
	}
	public int delete_res(String res_name) {
		return session.update("AdminMapper.delete_res", res_name);
	}
	public List<LodgingDTO> find_lod() {
		return session.selectList("AdminMapper.find_lod");
	}
	public List<RatingDTO> find_lod_rating() {
		return session.selectList("AdminMapper.find_lod_rating");
	}
	public int update_lod(LodgingDTO dto) {
		return session.update("AdminMapper.update_lod", dto);
	}
	public int delete_lod(String lodging_name) {
		return session.delete("AdminMapper.delete_lod", lodging_name);
	}
	public int delete_user(String userid) {
		return session.delete("AdminMapper.delete_user", userid);
	}
	public List<ResReviewDTO> find_resInfo(String userid) {
		return session.selectList("AdminMapper.find_resInfo", userid);
	}
	public List<LodReviewDTO> find_lodInfo(String userid) {
		return session.selectList("AdminMapper.find_lodInfo", userid);
	}
	public List<Board> find_boardInfo(String userid) {
		return session.selectList("AdminMapper.find_boardInfo", userid);
	}
	public int delete_board(int board_num) {
		return session.delete("AdminMapper.delete_board", board_num);
	}
	public int delete_res_review(int review_id) {
		return session.delete("AdminMapper.delete_res_review", review_id);
	}
	public int delete_lod_review(int review_id) {
		return session.delete("AdminMapper.delete_lod_review", review_id);
	}
	public VisitDTO todayVisitCheck() {
		return session.selectOne("AdminMapper.todayVisitCheck");
	}
	public int todayFirstVisit() {
		return session.update("AdminMapper.todayFirstVisit");
	}
	public int todayAddVisit() {
		return session.insert("AdminMapper.todayAddVisit");
	}
	public int CountMember() {
		return session.selectOne("AdminMapper.CountMember");
	}
	public int CountBoard() {
		return session.selectOne("AdminMapper.CountBoard");
	}
	public int CountReview() {
		return session.selectOne("AdminMapper.CountReview");
	}
	public MemberDTO findUser(String userid) {
		return session.selectOne("AdminMapper.findUser", userid);
	}
	public int updateUser(MemberDTO dto) {
		return session.update("AdminMapper.updateUser", dto);
	}
	
}