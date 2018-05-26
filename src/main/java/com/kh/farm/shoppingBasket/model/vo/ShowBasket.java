package com.kh.farm.shoppingBasket.model.vo;

import org.springframework.stereotype.Component;

@Component("showBasket")
public class ShowBasket implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 7959286690434290917L;
	
	private int market_no;//마켓번호
	private String member_name;//판매자 이름
	private String market_img;//마켓 이미지
	private String market_title;//마켓 타이틀
	private String market_note;//상품 소개
	private int market_price;//판매 가격
	private int buy_amount;//수량
	
	
	public ShowBasket() {
	
	}

	

	public ShowBasket(int market_no, String member_name, String market_img, String market_title, String market_note,
			int market_price, int buy_amount) {
		super();
		this.market_no = market_no;
		this.member_name = member_name;
		this.market_img = market_img;
		this.market_title = market_title;
		this.market_note = market_note;
		this.market_price = market_price;
		this.buy_amount = buy_amount;
	}
	



	@Override
	public String toString() {
		return "ShowBasket [market_no=" + market_no + ", member_name=" + member_name + ", market_img=" + market_img
				+ ", market_title=" + market_title + ", market_note=" + market_note + ", market_price=" + market_price
				+ ", buy_amount=" + buy_amount + "]";
	}



	public int getMarket_no() {
		return market_no;
	}


	public void setMarket_no(int market_no) {
		this.market_no = market_no;
	}


	public String getMarket_img() {
		return market_img;
	}


	public void setMarket_img(String market_img) {
		this.market_img = market_img;
	}


	public String getMarket_title() {
		return market_title;
	}


	public void setMarket_title(String market_title) {
		this.market_title = market_title;
	}


	public int getMarket_price() {
		return market_price;
	}


	public void setMarket_price(int market_price) {
		this.market_price = market_price;
	}


	public int getBuy_amount() {
		return buy_amount;
	}


	public void setBuy_amount(int buy_amount) {
		this.buy_amount = buy_amount;
	}



	public String getMember_name() {
		return member_name;
	}



	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}



	public String getMarket_note() {
		return market_note;
	}



	public void setMarket_note(String market_note) {
		this.market_note = market_note;
	}
	
}
