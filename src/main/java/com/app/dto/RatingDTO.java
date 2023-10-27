package com.app.dto;

public class RatingDTO {
	String place_name; // 음식점 or 숙소
	double rating; // 별점의 평균

	public RatingDTO(String place_name, double rating) {
		this.place_name = place_name;
		this.rating = rating;
	}

	public RatingDTO() {
	}

	public String getPlace_name() {
		return place_name;
	}

	public void setPlace_name(String place_name) {
		this.place_name = place_name;
	}

	public double getRating() {
		return rating;
	}

	public void setRating(double rating) {
		this.rating = rating;
	}

	@Override
	public String toString() {
		return "RatingDTO [place_name=" + place_name + ", rating=" + rating + "]";
	}

}
