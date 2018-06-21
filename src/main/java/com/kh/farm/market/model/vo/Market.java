package com.kh.farm.market.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component("market")
public class Market implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7777L;

	private int rnum;
	private int market_no;// 판매글 번호
	private int category_no;// 카테고리 번호
	private String member_id;// 판매글 작성자 아이디
	private String market_title;// 판매글 제목
	private String market_note;// 판매글 노트
	private String market_img;// 판매글 이미지
	private Date market_releasedate;// 출고예정일
	private int market_amount;// 총 판매 수량
	private String market_intro;// 판매글 소개
	private String market_complete;// 판매글 상태
	private int market_price;// 판매 가격
	private String search;// 검색
	private int remaining;// 남은 수량
	private String member_name;// 회원 이름;
	private MultipartFile Filedata; // 다중이미지 업로드
	private String category_main;
	private String category_name;
	private Date buy_date;
	
	public Date getBuy_date() {
		return buy_date;
	}

	public void setBuy_date(Date buy_date) {
		this.buy_date = buy_date;
	}

	private String buy_amount;

	public String getBuy_amount() {
		return buy_amount;
	}

	public void setBuy_amount(String buy_amount) {
		this.buy_amount = buy_amount;
	}

	public Market() {
	}

	public Market(int rnum, int market_no, int category_no, String member_id, String market_title, String market_note,
			String market_img, Date market_releasedate, int market_amount, String market_intro, String market_complete,
			int market_price, String search, int remaining, String member_name, String buy_amount,Date buy_date) {

		super();
		this.rnum = rnum;
		this.market_no = market_no;
		this.category_no = category_no;
		this.member_id = member_id;
		this.market_title = market_title;
		this.market_note = market_note;
		this.market_img = market_img;
		this.market_releasedate = market_releasedate;
		this.market_amount = market_amount;
		this.market_intro = market_intro;
		this.market_complete = market_complete;
		this.market_price = market_price;
		this.search = search;
		this.remaining = remaining;
		this.member_name = member_name;
		this.buy_amount = buy_amount;
		this.buy_date = buy_date;

	}


	
	public String getCategory_main() {
		return category_main;
	}


	public void setCategory_main(String category_main) {
		this.category_main = category_main;
	}


	public String getCategory_name() {
		return category_name;
	}


	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}


	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public MultipartFile getFiledata() {
		return Filedata;
	}

	public void setFiledata(MultipartFile filedata) {
		Filedata = filedata;
	}

	public int getMarket_no() {
		return market_no;
	}

	public void setMarket_no(int market_no) {
		this.market_no = market_no;
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

	public String getMarket_title() {
		return market_title;
	}

	public void setMarket_title(String market_title) {
		this.market_title = market_title;
	}

	public String getMarket_note() {
		return market_note;
	}

	public void setMarket_note(String market_note) {
		this.market_note = market_note;
	}

	public String getMarket_img() {
		return market_img;
	}

	public void setMarket_img(String market_img) {
		this.market_img = market_img;
	}

	public Date getMarket_releasedate() {
		return market_releasedate;
	}

	public void setMarket_releasedate(Date market_releasedate) {
		this.market_releasedate = market_releasedate;
	}

	public int getMarket_amount() {
		return market_amount;
	}

	public void setMarket_amount(int market_amount) {
		this.market_amount = market_amount;
	}

	public String getMarket_intro() {
		return market_intro;
	}

	public void setMarket_intro(String market_intro) {
		this.market_intro = market_intro;
	}

	public String getMarket_complete() {
		return market_complete;
	}

	public void setMarket_complete(String market_complete) {
		this.market_complete = market_complete;
	}

	public int getMarket_price() {
		return market_price;
	}

	public void setMarket_price(int market_price) {
		this.market_price = market_price;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public int getRemaining() {
		return remaining;
	}

	public void setRemaining(int remaining) {
		this.remaining = remaining;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	@Override
	public String toString() {
		return "Market [rnum=" + rnum + ", market_no=" + market_no + ", category_no=" + category_no + ", member_id="
				+ member_id + ", market_title=" + market_title + ", market_note=" + market_note + ", market_img="
				+ market_img + ", market_releasedate=" + market_releasedate + ", market_amount=" + market_amount
				+ ", market_intro=" + market_intro + ", market_complete=" + market_complete + ", market_price="
				+ market_price + ", search=" + search + ", remaining=" + remaining + ", member_name=" + member_name
				+ ", Filedata=" + Filedata + ", buy_amount=" + buy_amount + "]";
	}

}