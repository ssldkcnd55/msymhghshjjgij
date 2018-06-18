package com.kh.farm.auction.model.vo;

import org.springframework.stereotype.Component;

@Component("AuctionCommon")
public class AuctionCommon implements java.io.Serializable {
	
	private static final long serialVersionUID = 9191L;
	
	private String member_id;
	private int auction_no;
	private int auction_history_price;
	private String auction_title;
	private int auction_status;
	
	public AuctionCommon() {}

	public AuctionCommon(String member_id, int auction_no, int auction_history_price, String auction_title,
			int auction_status) {
		super();
		this.member_id = member_id;
		this.auction_no = auction_no;
		this.auction_history_price = auction_history_price;
		this.auction_title = auction_title;
		this.auction_status = auction_status;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public int getAuction_no() {
		return auction_no;
	}

	public void setAuction_no(int auction_no) {
		this.auction_no = auction_no;
	}

	public int getAuction_history_price() {
		return auction_history_price;
	}

	public void setAuction_history_price(int auction_history_price) {
		this.auction_history_price = auction_history_price;
	}

	public String getAuction_title() {
		return auction_title;
	}

	public void setAuction_title(String auction_title) {
		this.auction_title = auction_title;
	}

	public int getAuction_status() {
		return auction_status;
	}

	public void setAuction_status(int auction_status) {
		this.auction_status = auction_status;
	}

	@Override
	public String toString() {
		return "AuctionCommon [member_id=" + member_id + ", auction_no=" + auction_no + ", auction_history_price="
				+ auction_history_price + ", auction_title=" + auction_title + ", auction_status=" + auction_status
				+ "]";
	}


	

	
	

	
}
