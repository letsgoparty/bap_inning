package com.app.dto;

import java.util.List;

public class PageDTO {

	List<Board> list;
	int curPage; // 현재 페이지
	int perPage = 3; // 한페이지에 보여질 데이터 개수
	int totalCount; // 데이터 개수

	String type;
	String keyword;
	String team;


	public PageDTO() {
	}

	public PageDTO(List<Board> list, int curPage, int perPage, int totalCount, String type, String keyword, String team) {
		super();
		this.list = list;
		this.curPage = curPage;
		this.perPage = perPage;
		this.totalCount = totalCount;
		this.type = type;
		this.keyword = keyword;
		this.team = team;
	}

	public List<Board> getList() {
		return list;
	}

	public void setList(List<Board> list) {
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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getTeam() {
		return team;
	}

	public void setTeam(String team) {
		this.team = team;
	}

	@Override
	public String toString() {
		return "PageDTO [list=" + list + ", curPage=" + curPage + ", perPage=" + perPage + ", totalCount=" + totalCount
				+ ",  type=" + type + ", keyword=" + keyword + ", team=" + team + "]";
	}

	
}
