package com.app.dto;

import org.apache.ibatis.type.Alias;

@Alias("LodReviewDTO")
public class LodReviewDTO {

	Integer review_id;
	Integer lodging_id;
	String user_id;
	String rating;
	String review_content;
	String like_cnt;
	String created_date;
	String modified_date;
	String lodging_name;
	String nickname;
	
	public LodReviewDTO() {
	}

	public LodReviewDTO(Integer review_id, Integer lodging_id, String user_id, String rating, String review_content,
			String like_cnt, String created_date, String modified_date, String lodging_name, String nickname) {
		super();
		this.review_id = review_id;
		this.lodging_id = lodging_id;
		this.user_id = user_id;
		this.rating = rating;
		this.review_content = review_content;
		this.like_cnt = like_cnt;
		this.created_date = created_date;
		this.modified_date = modified_date;
		this.lodging_name = lodging_name;
		this.nickname = nickname;
	}

	public Integer getReview_id() {
		return review_id;
	}
	public void setReview_id(Integer review_id) {
		this.review_id = review_id;
	}
	public Integer getLodging_id() {
		return lodging_id;
	}
	public void setLodging_id(Integer lodging_id) {
		this.lodging_id = lodging_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getRating() {
		return rating;
	}
	public void setRating(String rating) {
		this.rating = rating;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public String getLike_cnt() {
		return like_cnt;
	}
	public void setLike_cnt(String like_cnt) {
		this.like_cnt = like_cnt;
	}
	public String getCreated_date() {
		return created_date;
	}
	public void setCreated_date(String created_date) {
		this.created_date = created_date;
	}
	public String getModified_date() {
		return modified_date;
	}
	public void setModified_date(String modified_date) {
		this.modified_date = modified_date;
	}
	public String getLodging_name() {
		return lodging_name;
	}
	public void setLodging_name(String lodging_name) {
		this.lodging_name = lodging_name;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	@Override
	public String toString() {
		return "LodReviewDTO [review_id=" + review_id + ", lodging_id=" + lodging_id + ", user_id=" + user_id
				+ ", rating=" + rating + ", review_content=" + review_content + ", like_cnt=" + like_cnt
				+ ", created_date=" + created_date + ", modified_date=" + modified_date + ", lodging_name="
				+ lodging_name + ", nickname=" + nickname + "]";
	}

}
