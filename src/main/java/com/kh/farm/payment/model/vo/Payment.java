package com.kh.farm.payment.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("payment")
public class Payment implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4444L;

	private int rnum;
	private int buy_no; // 구매 번호
	private int group_no;//그룹 번호
	private int market_no; // 판매글 번호
	private int auction_no; // 경매글 번호
	private String member_id; // 구매자 아이디
	private Date buy_date; // 구매 일자 
	private int buy_amount; // 구매량
	private String buy_addr; // 배송지 주소
	private String buy_tel; // 배송지 전화번호
	private String buy_name; // 구매자 이름
	private String buy_status; // 거래 상태
	private String buy_request; // 배송 요청 사항
	private String buy_transport_name; //택배사 명
	private String buy_transport_no; //운송장 번호
	private String market_title;
	private String market_img;
	private int market_price;
	public Payment() {
	}


	public Payment(int rnum, int buy_no, int group_no, int market_no, int auction_no, String member_id, Date buy_date,
			int buy_amount, String buy_addr, String buy_tel, String buy_name, String buy_status, String buy_request,
			String buy_transport_name, String buy_transport_no) {
		super();
		this.rnum = rnum;
		this.buy_no = buy_no;
		this.group_no = group_no;
		this.market_no = market_no;
		this.auction_no = auction_no;
		this.member_id = member_id;
		this.buy_date = buy_date;
		this.buy_amount = buy_amount;
		this.buy_addr = buy_addr;
		this.buy_tel = buy_tel;
		this.buy_name = buy_name;
		this.buy_status = buy_status;
		this.buy_request = buy_request;
		this.buy_transport_name = buy_transport_name;
		this.buy_transport_no = buy_transport_no;
	}


	@Override
	public String toString() {
		return "Payment [rnum=" +rnum + ", buy_no=" + buy_no + ", group_no=" + group_no + ", market_no=" + market_no + ", auction_no="
				+ auction_no + ", member_id=" + member_id + ", buy_date=" + buy_date + ", buy_amount=" + buy_amount
				+ ", buy_addr=" + buy_addr + ", buy_tel=" + buy_tel + ", buy_name=" + buy_name + ", buy_status="
				+ buy_status + ", buy_request=" + buy_request + ", buy_transport_name=" + buy_transport_name
				+ ", buy_transport_no=" + buy_transport_no + "]";
	}

	
	
	public String getMarket_title() {
		return market_title;
	}


	public void setMarket_title(String market_title) {
		this.market_title = market_title;
	}


	public String getMarket_img() {
		return market_img;
	}


	public void setMarket_img(String market_img) {
		this.market_img = market_img;
	}


	public int getMarket_price() {
		return market_price;
	}


	public void setMarket_price(int market_price) {
		this.market_price = market_price;
	}


	public int getRnum() {
		return rnum;
	}


	public void setRnum(int rnum) {
		this.rnum = rnum;
	}


	public int getBuy_no() {
		return buy_no;
	}


	public void setBuy_no(int buy_no) {
		this.buy_no = buy_no;
	}


	public int getGroup_no() {
		return group_no;
	}


	public void setGroup_no(int group_no) {
		this.group_no = group_no;
	}


	public int getMarket_no() {
		return market_no;
	}


	public void setMarket_no(int market_no) {
		this.market_no = market_no;
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


	public Date getBuy_date() {
		return buy_date;
	}


	public void setBuy_date(Date buy_date) {
		this.buy_date = buy_date;
	}


	public int getBuy_amount() {
		return buy_amount;
	}


	public void setBuy_amount(int buy_amount) {
		this.buy_amount = buy_amount;
	}


	public String getBuy_addr() {
		return buy_addr;
	}


	public void setBuy_addr(String buy_addr) {
		this.buy_addr = buy_addr;
	}


	public String getBuy_tel() {
		return buy_tel;
	}


	public void setBuy_tel(String buy_tel) {
		this.buy_tel = buy_tel;
	}


	public String getBuy_name() {
		return buy_name;
	}


	public void setBuy_name(String buy_name) {
		this.buy_name = buy_name;
	}


	public String getBuy_status() {
		return buy_status;
	}


	public void setBuy_status(String buy_status) {
		this.buy_status = buy_status;
	}


	public String getBuy_request() {
		return buy_request;
	}


	public void setBuy_request(String buy_request) {
		this.buy_request = buy_request;
	}


	public String getBuy_transport_name() {
		return buy_transport_name;
	}


	public void setBuy_transport_name(String buy_transport_name) {
		this.buy_transport_name = buy_transport_name;
	}


	public String getBuy_transport_no() {
		return buy_transport_no;
	}


	public void setBuy_transport_no(String buy_transport_no) {
		this.buy_transport_no = buy_transport_no;
	}


	
	

}
