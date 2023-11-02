

package com.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.dao.AdminDAO;
import com.app.dto.Board;
import com.app.dto.LodReviewDTO;
import com.app.dto.LodgingDTO;
import com.app.dto.MemberDTO;
import com.app.dto.RatingDTO;
import com.app.dto.ResReviewDTO;
import com.app.dto.RestaurantDTO;
import com.app.dto.UserDTO;
import com.app.dto.VisitDTO;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	AdminDAO dao;

	@Override
	public List<Board> find_Board() {
		return dao.find_Board();
	}

	@Override
	public Board find_Board_by_num(int board_num) {
		return dao.find_Board_by_num(board_num);
	}

	@Override
	public List<MemberDTO> find_user() {
		return dao.find_user();
	}

	@Override
	public int find_user_board(String userid) {
		return dao.find_user_board(userid);
	}

	@Override
	public int find_user_commet(String userid) {
		return dao.find_user_commet(userid);
	}

	@Override
	public int find_user_res_review(String userid) {
		return dao.find_user_res_review(userid);
	}

	@Override
	public int find_user_lod_review(String userid) {
		return dao.find_user_lod_review(userid);
	}

	@Override
	public List<ResReviewDTO> find_res_review() {
		return dao.find_res_review();
	}

	@Override
	public List<LodReviewDTO> find_lod_review() {
		return dao.find_lod_review();
	}

	@Override
	public List<RestaurantDTO> find_res() {
		return dao.find_res();
	}

	@Override
	public List<RatingDTO> find_res_rating() {
		return dao.find_res_rating();
	}

	@Override
	public int update_res(RestaurantDTO dto) {
		return dao.update_res(dto);
	}

	@Override
	public int delete_res(String res_name) {
		return dao.delete_res(res_name);
	}

	@Override
	public List<LodgingDTO> find_lod() {
		return dao.find_lod();
	}

	@Override
	public List<RatingDTO> find_lod_rating() {
		return dao.find_lod_rating();
	}

	@Override
	public int update_lod(LodgingDTO dto) {
		return dao.update_lod(dto);
	}

	@Override
	public int delete_lod(String lodging_name) {
		return dao.delete_lod(lodging_name);
	}

	@Override
	public int delete_user(String userid) {
		return dao.delete_user(userid);
	}

	@Override
	public List<ResReviewDTO> find_resInfo(String userid) {
		return dao.find_resInfo(userid);
	}

	@Override
	public List<Board> find_boardInfo(String userid) {
		return dao.find_boardInfo(userid);
	}

	@Override
	public List<LodReviewDTO> find_lodInfo(String userid) {
		return dao.find_lodInfo(userid);
	}

	@Override
	public int delete_board(int board_num) {
		return dao.delete_board(board_num);
	}

	@Override
	public int delete_res_review(int review_id) {
		return dao.delete_res_review(review_id);
	}
	
	@Override
	public int delete_lod_review(int review_id) {
		return dao.delete_lod_review(review_id);
	}

	@Override
	public VisitDTO todayVisitCheck() {
		return dao.todayVisitCheck();
	}

	@Override
	public int todayFirstVisit() {
		return dao.todayFirstVisit();
	}

	@Override
	public int todayAddVisit() {
		return dao.todayAddVisit();
	}

	@Override
	public int CountMember() {
		return dao.CountMember();
	}
	
	@Override
	public int CountBoard() {
		return dao.CountBoard();
	}
	
	@Override
	public int CountReview() {
		return dao.CountReview();
	}

	@Override
	public MemberDTO findUser(String userid) {
		return dao.findUser(userid);
	}

	@Override
	public int updateUser(MemberDTO dto) {
		return dao.updateUser(dto);
	}
}