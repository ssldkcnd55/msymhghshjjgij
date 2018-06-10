package com.kh.farm.auction.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("auction")
public class Auction implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 9999L;

	private int rnum;
	private int auction_no;// 경매 번호
	private String member_id;// 판매자 아이디
	private String category_no;//카테고리
	private String auction_title;// 경매 제목
	private String auction_note;// 경매 노트 
	private String auction_img;// 경매 이미지
	private String auction_startdate;// 경매 시작 시간
	private String auction_enddate;// 경매 종료 시간
	private String auction_intro;// 경매 소개
	private String auction_status;// 경매 상태
	private int auction_startprice;// 경매 시작가
	private int auction_directprice;// 즉시 구매가
	private String day;//일
	private String hour;//시간
	private String minute;//분
	private String today;
	
	
	public Auction() {
	
	}

	
	


	public Auction(int rnum, int auction_no, String member_id, String category_no, String auction_title,
			String auction_note, String auction_img, String auction_startdate, String auction_enddate,
			String auction_intro, String auction_status, int auction_startprice, int auction_directprice, String day,
			String hour, String minute, String today) {
		super();
		this.rnum = rnum;
		this.auction_no = auction_no;
		this.member_id = member_id;
		this.category_no = category_no;
		this.auction_title = auction_title;
		this.auction_note = auction_note;
		this.auction_img = auction_img;
		this.auction_startdate = auction_startdate;
		this.auction_enddate = auction_enddate;
		this.auction_intro = auction_intro;
		this.auction_status = auction_status;
		this.auction_startprice = auction_startprice;
		this.auction_directprice = auction_directprice;
		this.day = day;
		this.hour = hour;
		this.minute = minute;
		this.today = today;
	}


	@Override
	public String toString() {
		return "Auction [rnum=" + rnum + ", auction_no=" + auction_no + ", member_id=" + member_id + ", category_no="
				+ category_no + ", auction_title=" + auction_title + ", auction_note=" + auction_note + ", auction_img="
				+ auction_img + ", auction_startdate=" + auction_startdate + ", auction_enddate=" + auction_enddate
				+ ", auction_intro=" + auction_intro + ", auction_status=" + auction_status + ", auction_startprice="
				+ auction_startprice + ", auction_directprice=" + auction_directprice + ", day=" + day + ", hour="
				+ hour + ", minute=" + minute + ", today=" + today + "]";
	}


	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}


	public int getAuction_no() {
		return auction_no;
	}

	public void setAuction_no(int auction_no) {
		this.auction_no = auction_no;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	
	
	public String getCategory_no() {
		return category_no;
	}

	public void setCategory_no(String category_no) {
		this.category_no = category_no;
	}

	public String getAuction_title() {
		return auction_title;
	}

	public void setAuction_title(String auction_title) {
		this.auction_title = auction_title;
	}

	public String getAuction_note() {
		return auction_note;
	}

	public void setAuction_note(String auction_note) {
		this.auction_note = auction_note;
	}

	public String getAuction_img() {
		return auction_img;
	}

	public void setAuction_img(String auction_img) {
		this.auction_img = auction_img;
	}

	

	public String getAuction_startdate() {
		return auction_startdate;
	}

	public void setAuction_startdate(String auction_startdate) {
		this.auction_startdate = auction_startdate;
	}

	public String getAuction_enddate() {
		return auction_enddate;
	}

	public void setAuction_enddate(String auction_enddate) {
		this.auction_enddate = auction_enddate;
	}

	public String getAuction_intro() {
		return auction_intro;
	}

	public void setAuction_intro(String auction_intro) {
		this.auction_intro = auction_intro;
	}

	public String getAuction_status() {
		return auction_status;
	}

	public void setAuction_status(String auction_status) {
		this.auction_status = auction_status;
	}

	public int getAuction_startprice() {
		return auction_startprice;
	}

	public void setAuction_startprice(int auction_startprice) {
		this.auction_startprice = auction_startprice;
	}

	public int getAuction_directprice() {
		return auction_directprice;
	}

	public void setAuction_directprice(int auction_directprice) {
		this.auction_directprice = auction_directprice;
	}





	public String getDay() {
		return day;
	}





	public void setDay(String day) {
		this.day = day;
	}





	public String getHour() {
		return hour;
	}


	public void setHour(String hour) {
		this.hour = hour;
	}


	public String getMinute() {
		return minute;
	}


	public void setMinute(String minute) {
		this.minute = minute;
	}




	public String getToday() {
		return today;
	}




	public void setToday(String today) {
		this.today = today;
	}


	
}
