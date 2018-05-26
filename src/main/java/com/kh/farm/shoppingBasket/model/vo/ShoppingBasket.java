package com.kh.farm.shoppingBasket.model.vo;

import org.springframework.stereotype.Component;

@Component("shoppingBasket")
public class ShoppingBasket implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1111L;
	
	private String member_id; // 구매자 아이디
	private int market_no; // 판매글 번호
	private int buy_amount; //구매 수량
	
	public ShoppingBasket() {}

	public ShoppingBasket(String member_id, int market_no, int buy_amount) {
		super();
		this.member_id = member_id;
		this.market_no = market_no;
		this.buy_amount = buy_amount;
	}

	@Override
	public String toString() {
		return "ShoppingBasket [member_id=" + member_id + ", market_no=" + market_no + ", buy_amount=" + buy_amount
				+ "]";
	}

	public String getMember_id() {
		return member_id;
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

	public int getBuy_amount() {
		return buy_amount;
	}

	public void setBuy_amount(int buy_amount) {
		this.buy_amount = buy_amount;
	}

	
	
	
}
