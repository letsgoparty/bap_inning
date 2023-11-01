package com.app.dto;

public class VisitDTO {
	String visit_date; // 날짜
	int visit_num; // 방문자 수
	
	public VisitDTO() {

	}
	public VisitDTO(String visit_date, int visit_num) {
		super();
		this.visit_date = visit_date;
		this.visit_num = visit_num;
	}
	public String getVisit_date() {
		return visit_date;
	}
	public void setVisit_date(String visit_date) {
		this.visit_date = visit_date;
	}
	public int getVisit_num() {
		return visit_num;
	}
	public void setVisit_num(int visit_num) {
		this.visit_num = visit_num;
	}
	
	
}
