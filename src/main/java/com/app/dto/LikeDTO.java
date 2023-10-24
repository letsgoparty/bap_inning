package com.app.dto;

public class LikeDTO {
	int like_num;
	String user_id;
	String like_type;
	int id;
	public LikeDTO() {
	}
	public LikeDTO(int like_num, String user_id, String like_type, int id) {
		this.like_num = like_num;
		this.user_id = user_id;
		this.like_type = like_type;
		this.id = id;
	}
	public int getLike_num() {
		return like_num;
	}
	public void setLike_num(int like_num) {
		this.like_num = like_num;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getLike_type() {
		return like_type;
	}
	public void setLike_type(String like_type) {
		this.like_type = like_type;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "LikeDTO [like_num=" + like_num + ", user_id=" + user_id + ", like_type=" + like_type + ", id=" + id
				+ "]";
	}
	
	
}
