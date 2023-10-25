package com.app.dto;

public class LikeDTO {
	int like_num;
	String userid;
	String res_id;
	String lodging_id;
	public LikeDTO() {
	}
	public LikeDTO(int like_num, String userid, String res_id, String lodging_id) {
		this.like_num = like_num;
		this.userid = userid;
		this.res_id = res_id;
		this.lodging_id = lodging_id;
	}
	public int getLike_num() {
		return like_num;
	}
	public void setLike_num(int like_num) {
		this.like_num = like_num;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getRes_id() {
		return res_id;
	}
	public void setRes_id(String res_id) {
		this.res_id = res_id;
	}
	public String getLodging_id() {
		return lodging_id;
	}
	public void setLodging_id(String lodging_id) {
		this.lodging_id = lodging_id;
	}
	@Override
	public String toString() {
		return "LikeDTO [like_num=" + like_num + ", userid=" + userid + ", res_id=" + res_id + ", lodging_id="
				+ lodging_id + "]";
	}
	
}
