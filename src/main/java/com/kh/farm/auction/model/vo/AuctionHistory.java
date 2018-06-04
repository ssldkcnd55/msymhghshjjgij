package com.kh.farm.auction.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("auctionHistory")
public class AuctionHistory implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 11111L;
	
	private int rnum;
	private int auction_history_no;//입찰 번호
	private int auction_no;//경매 번호
	private String member_id;//입찰자 아이디
	private int auction_history_price;//입찰가
	private Date auction_history_date;//입찰 시간
	private int auction_startprice;// 경매 시작가
	private int auction_startprice2;// 경매 시작가2
	private int auction_directprice;	
	private String auction_title; //옥션테이블의 제목
	



	public AuctionHistory() {}

	

	public AuctionHistory(int rnum, int auction_history_no, int auction_no, String member_id, int auction_history_price,
			Date auction_history_date, int auction_startprice, int auction_startprice2, int auction_directprice,
			String auction_title) {
		super();
		this.rnum = rnum;
		this.auction_history_no = auction_history_no;
		this.auction_no = auction_no;
		this.member_id = member_id;
		this.auction_history_price = auction_history_price;
		this.auction_history_date = auction_history_date;
		this.auction_startprice = auction_startprice;
		this.auction_startprice2 = auction_startprice2;
		this.auction_directprice = auction_directprice;
		this.auction_title = auction_title;
	}


	
	
	@Override
	public String toString() {
		return "AuctionHistory [rnum=" + rnum + ", auction_history_no=" + auction_history_no + ", auction_no="
				+ auction_no + ", member_id=" + member_id + ", auction_history_price=" + auction_history_price
				+ ", auction_history_date=" + auction_history_date + ", auction_startprice=" + auction_startprice
				+ ", auction_startprice2=" + auction_startprice2 + ", auction_directprice=" + auction_directprice
				+ ", auction_title=" + auction_title + "]";
	}


	public String getAuction_title() {
		return auction_title;
	}

	public void setAuction_title(String auction_title) {
		this.auction_title = auction_title;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public int getAuction_history_no() {
		return auction_history_no;
	}

	public void setAuction_history_no(int auction_history_no) {
		this.auction_history_no = auction_history_no;
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

	public int getAuction_history_price() {
		return auction_history_price;
	}

	public void setAuction_history_price(int auction_history_price) {
		this.auction_history_price = auction_history_price;
	}

	public Date getAuction_history_date() {
		return auction_history_date;
	}

	public void setAuction_history_date(Date auction_history_date) {
		this.auction_history_date = auction_history_date;
	}



	public int getAuction_startprice() {
		return auction_startprice;
	}


	public void setAuction_startprice(int auction_startprice) {
		this.auction_startprice = auction_startprice;
	}

	public int getAuction_startprice2() {
		return auction_startprice2;
	}

	public void setAuction_startprice2(int auction_startprice2) {
		this.auction_startprice2 = auction_startprice2;
	}
	
	public int getAuction_directprice() {
		return auction_directprice;
	}
	
	public void setAuction_directprice(int auction_directprice ) {
		this.auction_directprice = auction_directprice;
	}
	
		
}
