package com.app.dto;

import java.util.List;

public class ReviewPageDTO {

	List<ReviewDTO> list;
	List<LodReviewDTO> lodList;
	int curPage;
	int perPage = 5;
	int totalCount;
	
	public ReviewPageDTO() {}

	public ReviewPageDTO(List<ReviewDTO> list, List<LodReviewDTO> lodList, int curPage, int perPage, int totalCount) {
		super();
		this.list = list;
		this.lodList = lodList;
		this.curPage = curPage;
		this.perPage = perPage;
		this.totalCount = totalCount;
	}

	public List<LodReviewDTO> getLodList() {
		return lodList;
	}

	public void setLodList(List<LodReviewDTO> lodList) {
		this.lodList = lodList;
	}

	public List<ReviewDTO> getList() {
		return list;
	}

	public void setList(List<ReviewDTO> list) {
		this.list = list;
	}

	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	public int getPerPage() {
		return perPage;
	}

	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	@Override
	public String toString() {
		return "ReviewPageDTO [list=" + list + ", lodList=" + lodList + ", curPage=" + curPage + ", perPage=" + perPage
				+ ", totalCount=" + totalCount + "]";
	}


}
