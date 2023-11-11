package com.app.service;

import java.util.List;

import com.app.dto.Board;
import com.app.dto.LodReviewDTO;
import com.app.dto.LodgingDTO;
import com.app.dto.MemberDTO;
import com.app.dto.RatingDTO;
import com.app.dto.Reply;
import com.app.dto.ResReviewDTO;
import com.app.dto.RestaurantDTO;
import com.app.dto.UserDTO;
import com.app.dto.VisitDTO;

public interface AdminService {
	public List<Board> find_Board();
	public Board find_Board_by_num(int board_num);
	public List<MemberDTO> find_user();
	public int find_user_board(String userid);
	public int find_user_commet(String userid);
	public int find_user_res_review(String userid);
	public int find_user_lod_review(String userid);
	public List<ResReviewDTO> find_res_review();
	public List<LodReviewDTO> find_lod_review();
	public List<RestaurantDTO> find_res();
	public List<RatingDTO> find_res_rating();
	public int update_res(RestaurantDTO dto);
	public int delete_res(String res_name);
	public List<LodgingDTO> find_lod();
	public List<RatingDTO> find_lod_rating();
	public int update_lod(LodgingDTO dto);
	public int delete_lod(String lodging_name);
	public int delete_user(String userid);
	public List<ResReviewDTO> find_resInfo(String userid);
	public List<LodReviewDTO> find_lodInfo(String userid);
	public List<Board> find_boardInfo(String userid);
	public int delete_board(int board_num);
	public int delete_res_review(int review_id);
	public int delete_lod_review(int review_id);
	public VisitDTO todayVisitCheck();
	public int todayFirstVisit();
	public int todayAddVisit();
	public int CountMember();
	public int CountBoard();
	public int CountReview();
	public MemberDTO findUser(String userid);
	public int updateUser(MemberDTO dto);
	public int find_seq();
	public int find_seq2();
	public int enroll_res(RestaurantDTO dto);
	public int enroll_lod(LodgingDTO dto);
	public List<Reply> find_Comment();
	public List<Reply> find_commentInfo(String userid);
}