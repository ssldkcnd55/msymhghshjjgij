package com.kh.farm.market.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("daily")
public class Daily implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 44444L;
	
	private int daily_no;//일지 번호
	private int market_no;//판매글 번호
	private Date daily_date;//일지 작성일
	private String daily_title;//일지 제목
	private String daily_contents;//일지 내용
	private String member_id;
	
	public Daily() {
	
	}
	public Daily(int daily_no, int market_no, Date daily_date, String daily_title, String daily_contents,
			String member_id) {
		super();
		this.daily_no = daily_no;
		this.market_no = market_no;
		this.daily_date = daily_date;
		this.daily_title = daily_title;
		this.daily_contents = daily_contents;
		this.member_id = member_id;
	}


	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	@Override
	public String toString() {
		return "Daily [daily_no=" + daily_no + ", market_no=" + market_no + ", daily_date=" + daily_date
				+ ", daily_title=" + daily_title + ", daily_contents=" + daily_contents + "]";
	}

	public int getMarket_no() {
		return market_no;
	}

	public void setMarket_no(int market_no) {
		this.market_no = market_no;
	}

	public int getDaily_no() {
		return daily_no;
	}

	public void setDaily_no(int daily_no) {
		this.daily_no = daily_no;
	}

	public Date getDaily_date() {
		return daily_date;
	}

	public void setDaily_date(Date daily_date) {
		this.daily_date = daily_date;
	}

	public String getDaily_title() {
		return daily_title;
	}

	public void setDaily_title(String daily_title) {
		this.daily_title = daily_title;
	}

	public String getDaily_contents() {
		return daily_contents;
	}

	public void setDaily_contents(String daily_contents) {
		this.daily_contents = daily_contents;
	}

	
}
