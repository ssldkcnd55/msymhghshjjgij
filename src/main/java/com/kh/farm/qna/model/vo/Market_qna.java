package com.kh.farm.qna.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("Market_qna")
public class Market_qna implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 3333L;
	
	private int market_qna_no; //질문글 번호
	private int market_no	; //판매글 번호
	private String member_id; //질문글 작성자 아이디
	private Date market_qna_question_date; //질문글 작성일
	private String market_qna_answer; //답글 내용
	private Date market_qna_answer_date; //답글 작성일
	private String market_qna_title; //질문글 제목
	private String market_qna_contents; //질문글 내용
	private String market_category; //질문글 카테고리	
	private String rnum;
	
	public Market_qna() {
	
	}

	public Market_qna(int market_qna_no, int market_no, String member_id, Date market_qna_question_date,
			String market_qna_answer, Date market_qna_answer_date, String market_qna_title, String market_qna_contents,
			String market_category, String rnum) {
		super();
		this.market_qna_no = market_qna_no;
		this.market_no = market_no;
		this.member_id = member_id;
		this.market_qna_question_date = market_qna_question_date;
		this.market_qna_answer = market_qna_answer;
		this.market_qna_answer_date = market_qna_answer_date;
		this.market_qna_title = market_qna_title;
		this.market_qna_contents = market_qna_contents;
		this.market_category = market_category;
		this.rnum = rnum;
	}
	public String getRnum() {
		return rnum;
	}
	public void setRnum(String rnum) {
		this.rnum = rnum;
	}

	public int getMarket_qna_no() {
		return market_qna_no;
	}


	public void setMarket_qna_no(int market_qna_no) {
		this.market_qna_no = market_qna_no;
	}


	public int getMarket_no() {
		return market_no;
	}


	public void setMarket_no(int market_no) {
		this.market_no = market_no;
	}


	public String getMember_id() {
		return member_id;
	}


	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}


	public Date getMarket_qna_question_date() {
		return market_qna_question_date;
	}


	public void setMarket_qna_question_date(Date market_qna_question_date) {
		this.market_qna_question_date = market_qna_question_date;
	}


	public String getMarket_qna_answer() {
		return market_qna_answer;
	}


	public void setMarket_qna_answer(String market_qna_answer) {
		this.market_qna_answer = market_qna_answer;
	}


	public Date getMarket_qna_answer_date() {
		return market_qna_answer_date;
	}


	public void setMarket_qna_answer_date(Date market_qna_answer_date) {
		this.market_qna_answer_date = market_qna_answer_date;
	}


	public String getMarket_qna_title() {
		return market_qna_title;
	}


	public void setMarket_qna_title(String market_qna_title) {
		this.market_qna_title = market_qna_title;
	}


	public String getMarket_qna_contents() {
		return market_qna_contents;
	}


	public void setMarket_qna_contents(String market_qna_contents) {
		this.market_qna_contents = market_qna_contents;
	}


	public String getMarket_category() {
		return market_category;
	}


	public void setMarket_category(String market_category) {
		this.market_category = market_category;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	@Override
	public String toString() {
		return "Market_qna [market_qna_no=" + market_qna_no + ", market_no=" + market_no + ", member_id=" + member_id
				+ ", market_qna_question_date=" + market_qna_question_date + ", market_qna_answer=" + market_qna_answer
				+ ", market_qna_answer_date=" + market_qna_answer_date + ", market_qna_title=" + market_qna_title
				+ ", market_qna_contents=" + market_qna_contents + ", market_category=" + market_category + "]";
	}

	
	
	

}
