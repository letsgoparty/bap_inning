package com.app.dto;

import java.util.List;

public class mypageReviewImgDTO<T> {

String review_id;
List<String> urls;

public mypageReviewImgDTO() {
	super();
	// TODO Auto-generated constructor stub
}

public mypageReviewImgDTO(String review_id, List<String> urls) {
	super();
	this.review_id = review_id;
	this.urls = urls;
}

public String getReview_id() {
	return review_id;
}

public void setReview_id(String review_id) {
	this.review_id = review_id;
}

public List<String> getUrls() {
	return urls;
}

public void setUrls(List<String> urls) {
	this.urls = urls;
}

@Override
public String toString() {
	return "mypageReviewImgDTO [review_id=" + review_id + ", urls=" + urls + "]";
}

	
	
	
}
