package com.kh.farm.auction.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("auctionQnA")
public class AuctionQnA implements java.io.Serializable{
	
	private static final long serialVersionUID = 11112L;
	
	private int auction_qna_no;
	private int auction_no;
	private String member_id;
	private Date auction_qna_question_date;
	private String auction_qna_answer;
	private Date auction_qna_answer_date;
	private String auction_qna_title;
	private String auction_qna_contents;
	private String auction_category;
	private int rnum;
	
	public AuctionQnA() {}
	
	

	public AuctionQnA(int auction_qna_no, int auction_no, String member_id, Date auction_qna_question_date,
			String auction_qna_answer, Date auction_qna_answer_date, String auction_qna_title,
			String auction_qna_contents, String auction_category, int rnum) {
		super();
		this.auction_qna_no = auction_qna_no;
		this.auction_no = auction_no;
		this.member_id = member_id;
		this.auction_qna_question_date = auction_qna_question_date;
		this.auction_qna_answer = auction_qna_answer;
		this.auction_qna_answer_date = auction_qna_answer_date;
		this.auction_qna_title = auction_qna_title;
		this.auction_qna_contents = auction_qna_contents;
		this.auction_category = auction_category;
		this.rnum = rnum;
	}



	public int getAuction_qna_no() {
		return auction_qna_no;
	}


	public void setAuction_qna_no(int auction_qna_no) {
		this.auction_qna_no = auction_qna_no;
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


	public Date getAuction_qna_question_date() {
		return auction_qna_question_date;
	}


	public void setAuction_qna_question_date(Date auction_qna_question_date) {
		this.auction_qna_question_date = auction_qna_question_date;
	}


	public String getAuction_qna_answer() {
		return auction_qna_answer;
	}


	public void setAuction_qna_answer(String auction_qna_answer) {
		this.auction_qna_answer = auction_qna_answer;
	}


	public Date getAuction_qna_answer_date() {
		return auction_qna_answer_date;
	}


	public void setAuction_qna_answer_date(Date auction_qna_answer_date) {
		this.auction_qna_answer_date = auction_qna_answer_date;
	}


	public String getAuction_qna_title() {
		return auction_qna_title;
	}


	public void setAuction_qna_title(String auction_qna_title) {
		this.auction_qna_title = auction_qna_title;
	}


	public String getAuction_qna_contents() {
		return auction_qna_contents;
	}


	public void setAuction_qna_contents(String auction_qna_contents) {
		this.auction_qna_contents = auction_qna_contents;
	}


	public String getAuction_category() {
		return auction_category;
	}


	public void setAuction_category(String auction_category) {
		this.auction_category = auction_category;
	}



	public int getRnum() {
		return rnum;
	}



	public void setRnum(int rnum) {
		this.rnum = rnum;
	}



	@Override
	public String toString() {
		return "AuctionQnA [auction_qna_no=" + auction_qna_no + ", auction_no=" + auction_no + ", member_id="
				+ member_id + ", auction_qna_question_date=" + auction_qna_question_date + ", auction_qna_answer="
				+ auction_qna_answer + ", auction_qna_answer_date=" + auction_qna_answer_date + ", auction_qna_title="
				+ auction_qna_title + ", auction_qna_contents=" + auction_qna_contents + ", auction_category="
				+ auction_category + ", rnum=" + rnum + "]";
	}

	
	
}
