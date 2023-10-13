package com.app.dto;

public class RestaurantDTO {
	String res_id;
	String res_name;
	String res_post;
	String res_addr;
	String res_image;
	String res_content;
	String distance;

	public RestaurantDTO() {

	}

	public RestaurantDTO(String res_id, String res_name, String res_post, String res_addr, String res_image,
			String res_content, String distance) {
		this.res_id = res_id;
		this.res_name = res_name;
		this.res_post = res_post;
		this.res_addr = res_addr;
		this.res_image = res_image;
		this.res_content = res_content;
		this.distance = distance;
	}

	public String getRes_id() {
		return res_id;
	}

	public void setRes_id(String res_id) {
		this.res_id = res_id;
	}

	public String getRes_name() {
		return res_name;
	}

	public void setRes_name(String res_name) {
		this.res_name = res_name;
	}

	public String getRes_post() {
		return res_post;
	}

	public void setRes_post(String res_post) {
		this.res_post = res_post;
	}

	public String getRes_addr() {
		return res_addr;
	}

	public void setRes_addr(String res_addr) {
		this.res_addr = res_addr;
	}

	public String getRes_image() {
		return res_image;
	}

	public void setRes_image(String res_image) {
		this.res_image = res_image;
	}

	public String getRes_content() {
		return res_content;
	}

	public void setRes_content(String res_content) {
		this.res_content = res_content;
	}

	public String getDistance() {
		return distance;
	}

	public void setDistance(String distance) {
		this.distance = distance;
	}

	@Override
	public String toString() {
		return "RestaurantDTO [res_id=" + res_id + ", res_name=" + res_name + ", res_post=" + res_post + ", res_addr="
				+ res_addr + ", res_image=" + res_image + ", res_content=" + res_content + ", distance=" + distance
				+ "]";
	}
	

}
