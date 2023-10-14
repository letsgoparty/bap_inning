package com.app.dto;

public class LodgingDTO {
	String lodging_id;
	String lodging_name;
	String lodging_post;
	String lodging_addr;
	String lodging_image;
	String lodging_content;
	String distance;

	public LodgingDTO() {

	}

	public LodgingDTO(String lodging_id, String lodging_name, String lodging_post, String lodging_addr,
			String lodging_image, String lodging_content, String distance) {
		this.lodging_id = lodging_id;
		this.lodging_name = lodging_name;
		this.lodging_post = lodging_post;
		this.lodging_addr = lodging_addr;
		this.lodging_image = lodging_image;
		this.lodging_content = lodging_content;
		this.distance = distance;
	}

	public String getLodging_id() {
		return lodging_id;
	}

	public void setLodging_id(String lodging_id) {
		this.lodging_id = lodging_id;
	}

	public String getLodging_name() {
		return lodging_name;
	}

	public void setLodging_name(String lodging_name) {
		this.lodging_name = lodging_name;
	}

	public String getLodging_post() {
		return lodging_post;
	}

	public void setLodging_post(String lodging_post) {
		this.lodging_post = lodging_post;
	}

	public String getLodging_addr() {
		return lodging_addr;
	}

	public void setLodging_addr(String lodging_addr) {
		this.lodging_addr = lodging_addr;
	}

	public String getLodging_image() {
		return lodging_image;
	}

	public void setLodging_image(String lodging_image) {
		this.lodging_image = lodging_image;
	}

	public String getLodging_content() {
		return lodging_content;
	}

	public void setLodging_content(String lodging_content) {
		this.lodging_content = lodging_content;
	}

	public String getDistance() {
		return distance;
	}

	public void setDistance(String distance) {
		this.distance = distance;
	}

	@Override
	public String toString() {
		return "LodgingDTO [lodging_id=" + lodging_id + ", lodging_name=" + lodging_name + ", lodging_post="
				+ lodging_post + ", lodging_addr=" + lodging_addr + ", lodging_image=" + lodging_image
				+ ", lodging_content=" + lodging_content + ", distance=" + distance + "]";
	}

}