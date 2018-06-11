package com.kh.farm.auction.model.vo;

import org.springframework.stereotype.Component;

@Component("auctionOrder")
public class AuctionOrder implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 247824L;
	
	private int auction_no;
	private String auction_title;
	private String auction_note;
	private int auction_directprice;
	private String auction_img;

	private String member_id;
	private String member_name;
	
	public AuctionOrder() {}
	
	public AuctionOrder(int auction_no, String auction_title, String auction_note, int auction_directprice,
			String auction_img, String member_id, String member_name) {
		super();
		this.auction_no = auction_no;
		this.auction_title = auction_title;
		this.auction_note = auction_note;
		this.auction_directprice = auction_directprice;
		this.auction_img = auction_img;
		this.member_id = member_id;
		this.member_name = member_name;
	}

	@Override
	public String toString() {
		return "AuctionOrder [auction_no=" + auction_no + ", auction_title=" + auction_title + ", auction_note="
				+ auction_note + ", auction_directprice=" + auction_directprice + ", auction_img=" + auction_img
				+ ", member_id=" + member_id + ", member_name=" + member_name + "]";
	}

	public int getAuction_no() {
		return auction_no;
	}

	public void setAuction_no(int auction_no) {
		this.auction_no = auction_no;
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

	public int getAuction_directprice() {
		return auction_directprice;
	}

	public void setAuction_directprice(int auction_directprice) {
		this.auction_directprice = auction_directprice;
	}

	public String getAuction_img() {
		return auction_img;
	}

	public void setAuction_img(String auction_img) {
		this.auction_img = auction_img;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	
	

}
