package com.kh.farm.visit.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("visit")
public class Visit implements java.io.Serializable{
	private static final long serialVersionUID = 3254L;
	private String member_id;
	private int visit_no;
	private String visit_ip;
	private Date visit_date;
	private int visit_count;
	private String visit_month;
	public Visit() {}
	public Visit(String member_id, int visit_no, String visit_ip, Date visit_date, int visit_count,
			String visit_month) {
		super();
		this.member_id = member_id;
		this.visit_no = visit_no;
		this.visit_ip = visit_ip;
		this.visit_date = visit_date;
		this.visit_count = visit_count;
		this.visit_month = visit_month;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getVisit_no() {
		return visit_no;
	}
	public void setVisit_no(int visit_no) {
		this.visit_no = visit_no;
	}
	public String getVisit_ip() {
		return visit_ip;
	}
	public void setVisit_ip(String visit_ip) {
		this.visit_ip = visit_ip;
	}
	public Date getVisit_date() {
		return visit_date;
	}
	public void setVisit_date(Date visit_date) {
		this.visit_date = visit_date;
	}
	public int getVisit_count() {
		return visit_count;
	}
	public void setVisit_count(int visit_count) {
		this.visit_count = visit_count;
	}
	public String getVisit_month() {
		return visit_month;
	}
	public void setVisit_month(String visit_month) {
		this.visit_month = visit_month;
	}
	@Override
	public String toString() {
		return "Visit [member_id=" + member_id + ", visit_no=" + visit_no + ", visit_ip=" + visit_ip + ", visit_date="
				+ visit_date + ", visit_count=" + visit_count + ", visit_month=" + visit_month + "]";
	}
	
	
	
		
}
