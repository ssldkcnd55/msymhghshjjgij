package com.kh.farm.shoppingBasket.model.vo;

public class ShowBasket implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 7959286690434290917L;
	

	
	private int market_no;//마켓번호
	private String market_img;//마켓 이미지
	private String market_title;//마켓 타이틀
	private int market_price;//판매 가격
	
	private int buy_amount;//수량
	
	
	public ShowBasket() {
	
	}


	public ShowBasket(int market_no, String market_img, String market_title, int market_price, int buy_amount) {
		super();
		this.market_no = market_no;
		this.market_img = market_img;
		this.market_title = market_title;
		this.market_price = market_price;
		this.buy_amount = buy_amount;
	}


	@Override
	public String toString() {
		return "ShowBasket [market_no=" + market_no + ", market_img=" + market_img + ", market_title=" + market_title
				+ ", market_price=" + market_price + ", buy_amount=" + buy_amount + "]";
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
	
}
