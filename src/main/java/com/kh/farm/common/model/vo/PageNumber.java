package com.kh.farm.common.model.vo;

public class PageNumber implements java.io.Serializable{
	private static final long serialVersionUID = 2020L;
	
	private int startRow;		
	private int endRow;			
	private int market_no;
	private int auction_no;
	private String member_id;
	private int review_no;
	private int daily_no;
	private String keyword;
	public PageNumber() {}

	
	


	public PageNumber(int startRow, int endRow, int market_no, int auction_no, String member_id, int review_no,
			int daily_no,String keyword) {
		super();
		this.startRow = startRow;
		this.endRow = endRow;
		this.market_no = market_no;
		this.auction_no = auction_no;
		this.member_id = member_id;
		this.review_no = review_no;
		this.daily_no = daily_no;
		this.keyword = keyword;
	}





	public int getReview_no() {
		return review_no;
	}





	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}





	public int getDaily_no() {
		return daily_no;
	}





	public void setDaily_no(int daily_no) {
		this.daily_no = daily_no;
	}





	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}





	public int getMarket_no() {
		return market_no;
	}

	public void setMarket_no(int market_no) {
		this.market_no = market_no;
	}


	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
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
	
	public void setMember_no(String member_id) {
		this.member_id = member_id;
	}
	
	public String getKeyword() {
		return keyword;
	}
	
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
}