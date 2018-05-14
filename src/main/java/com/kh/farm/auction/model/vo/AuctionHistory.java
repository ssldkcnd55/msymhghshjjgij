package com.kh.farm.auction.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("auctionHistory")
public class AuctionHistory implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 11111L;
	
	private int auction_history_no;//입찰 번호
	private int auction_no;//경매 번호
	private String member_id;//입찰자 아이디
	private int auction_history_price;//입찰가
	private Date auction_history_date;//입찰 시간
		
	public AuctionHistory() {}

	public AuctionHistory(int auction_history_no, int auction_no, String member_id, int auction_history_price,
			Date auction_history_date) {
		super();
		this.auction_history_no = auction_history_no;
		this.auction_no = auction_no;
		this.member_id = member_id;
		this.auction_history_price = auction_history_price;
		this.auction_history_date = auction_history_date;
	}

	@Override
	public String toString() {
		return "AuctionHistory [auction_history_no=" + auction_history_no + ", auction_no=" + auction_no
				+ ", member_id=" + member_id + ", auction_history_price=" + auction_history_price
				+ ", auction_history_date=" + auction_history_date + "]";
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
	
	
	
		
}
