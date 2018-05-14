package com.kh.farm.qna.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("sellQna")
public class SellQna implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 3333L;
	
	private int sell_qna_no; //질문글 번호
	private int sell_no	; //판매글 번호
	private String member_id; //질문글 작성자 아이디
	private Date sell_qna_question_date; //질문글 작성일
	private String sell_qna_answer; //답글 내용
	private Date sell_qna_answer_date; //답글 작성일
	private String sell_qna_title; //질문글 제목
	private String sell_qna_contents; //질문글 내용
	private String sell_category; //질문글 카테고리
	
	public SellQna() {
	
	}

	public SellQna(int sell_qna_no, int sell_no, String member_id, Date sell_qna_question_date, String sell_qna_answer,
			Date sell_qna_answer_date, String sell_qna_title, String sell_qna_contents, String sell_category) {
		super();
		this.sell_qna_no = sell_qna_no;
		this.sell_no = sell_no;
		this.member_id = member_id;
		this.sell_qna_question_date = sell_qna_question_date;
		this.sell_qna_answer = sell_qna_answer;
		this.sell_qna_answer_date = sell_qna_answer_date;
		this.sell_qna_title = sell_qna_title;
		this.sell_qna_contents = sell_qna_contents;
		this.sell_category = sell_category;
	}

	@Override
	public String toString() {
		return "SellQna [sell_qna_no=" + sell_qna_no + ", sell_no=" + sell_no + ", member_id=" + member_id
				+ ", sell_qna_question_date=" + sell_qna_question_date + ", sell_qna_answer=" + sell_qna_answer
				+ ", sell_qna_answer_date=" + sell_qna_answer_date + ", sell_qna_title=" + sell_qna_title
				+ ", sell_qna_contents=" + sell_qna_contents + ", sell_category=" + sell_category + "]";
	}

	public int getSell_qna_no() {
		return sell_qna_no;
	}

	public void setSell_qna_no(int sell_qna_no) {
		this.sell_qna_no = sell_qna_no;
	}

	public int getSell_no() {
		return sell_no;
	}

	public void setSell_no(int sell_no) {
		this.sell_no = sell_no;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public Date getSell_qna_question_date() {
		return sell_qna_question_date;
	}

	public void setSell_qna_question_date(Date sell_qna_question_date) {
		this.sell_qna_question_date = sell_qna_question_date;
	}

	public String getSell_qna_answer() {
		return sell_qna_answer;
	}

	public void setSell_qna_answer(String sell_qna_answer) {
		this.sell_qna_answer = sell_qna_answer;
	}

	public Date getSell_qna_answer_date() {
		return sell_qna_answer_date;
	}

	public void setSell_qna_answer_date(Date sell_qna_answer_date) {
		this.sell_qna_answer_date = sell_qna_answer_date;
	}

	public String getSell_qna_title() {
		return sell_qna_title;
	}

	public void setSell_qna_title(String sell_qna_title) {
		this.sell_qna_title = sell_qna_title;
	}

	public String getSell_qna_contents() {
		return sell_qna_contents;
	}

	public void setSell_qna_contents(String sell_qna_contents) {
		this.sell_qna_contents = sell_qna_contents;
	}

	public String getSell_category() {
		return sell_category;
	}

	public void setSell_category(String sell_category) {
		this.sell_category = sell_category;
	}
	
	

}
