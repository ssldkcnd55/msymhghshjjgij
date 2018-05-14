package com.kh.farm.market.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("market")
public class Market implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 7777L;
	
	private int sell_no;// 판매글 번호
	
	private int category_no;//카테고리 번호
	private String member_id;//판매글 작성자 아이디
	private String sell_title;//판매글 제목
	private String sell_note;//판매글 노트
	private String sell_img;//판매글 이미지
	private Date sell_releasedate;//출고예정일
	private int sell_amount;//총 판매 수량
	private String sell_intro;//판매글 소개
	private String sell_complete;//판매글 상태
	private int sell_price;//판매 가격 
	
	public Market() {}

	public Market(int sell_no, int category_no, String member_id, String sell_title, String sell_note, String sell_img,
			Date sell_releasedate, int sell_amount, String sell_intro, String sell_complete, int sell_price) {
		super();
		this.sell_no = sell_no;
		this.category_no = category_no;
		this.member_id = member_id;
		this.sell_title = sell_title;
		this.sell_note = sell_note;
		this.sell_img = sell_img;
		this.sell_releasedate = sell_releasedate;
		this.sell_amount = sell_amount;
		this.sell_intro = sell_intro;
		this.sell_complete = sell_complete;
		this.sell_price = sell_price;
	}

	@Override
	public String toString() {
		return "Market [sell_no=" + sell_no + ", category_no=" + category_no + ", member_id=" + member_id
				+ ", sell_title=" + sell_title + ", sell_note=" + sell_note + ", sell_img=" + sell_img
				+ ", sell_releasedate=" + sell_releasedate + ", sell_amount=" + sell_amount + ", sell_intro="
				+ sell_intro + ", sell_complete=" + sell_complete + ", sell_price=" + sell_price + "]";
	}

	public int getSell_no() {
		return sell_no;
	}

	public void setSell_no(int sell_no) {
		this.sell_no = sell_no;
	}

	public int getCategory_no() {
		return category_no;
	}

	public void setCategory_no(int category_no) {
		this.category_no = category_no;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getSell_title() {
		return sell_title;
	}

	public void setSell_title(String sell_title) {
		this.sell_title = sell_title;
	}

	public String getSell_note() {
		return sell_note;
	}

	public void setSell_note(String sell_note) {
		this.sell_note = sell_note;
	}

	public String getSell_img() {
		return sell_img;
	}

	public void setSell_img(String sell_img) {
		this.sell_img = sell_img;
	}

	public Date getSell_releasedate() {
		return sell_releasedate;
	}

	public void setSell_releasedate(Date sell_releasedate) {
		this.sell_releasedate = sell_releasedate;
	}

	public int getSell_amount() {
		return sell_amount;
	}

	public void setSell_amount(int sell_amount) {
		this.sell_amount = sell_amount;
	}

	public String getSell_intro() {
		return sell_intro;
	}

	public void setSell_intro(String sell_intro) {
		this.sell_intro = sell_intro;
	}

	public String getSell_complete() {
		return sell_complete;
	}

	public void setSell_complete(String sell_complete) {
		this.sell_complete = sell_complete;
	}

	public int getSell_price() {
		return sell_price;
	}

	public void setSell_price(int sell_price) {
		this.sell_price = sell_price;
	}

	
	
}
