package com.app.dto;

import java.util.List;

public class UpgradePageDTO {

	List<Board> list;//내용물

	int startPage;//현재페이징에서 시작번호
	int endPage;//현재페이징에서 마지막번호

	boolean prev, next; //
	
	int amount;//페이지에서 보여줄 데이터 갯수
	int curPage; //현재 페이지 번호
	int total;//전체 데이터 수 
	int realEnd;//전체페이지중 제일 마지막페이지
	
	public UpgradePageDTO() {

	}

	public UpgradePageDTO(List<Board> list, int startPage, int endPage, boolean prev, boolean next, int amount,
			int curPage, int total) {
		this.list = list;
		this.startPage = startPage;
		this.endPage = endPage;
		this.prev = prev;
		this.next = next;
		this.amount = amount;
		this.curPage = curPage;
		this.total = total;
	}



	public int getRealEnd() {
		return realEnd;
	}

	public void setRealEnd(int realEnd) {
		this.realEnd = realEnd;
	}

	public List<Board> getList() {
		return list;
	}

	public void setList(List<Board> list) {
		this.list = list;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	@Override
	public String toString() {
		return "UpgradePageDTO [list=" + list + ", startPage=" + startPage + ", endPage=" + endPage + ", prev=" + prev
				+ ", next=" + next + ", amount=" + amount + ", curPage=" + curPage + ", total=" + total + "]";
	}
	
	
	
	
	
	
}
