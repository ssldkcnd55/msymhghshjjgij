package com.kh.farm.payment.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("payment")
public class Payment implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4444L;

	private int buy_no; // 구매 번호
	private int group_no;//그룹 번호
	private int sell_no; // 판매글 번호
	private String member_id; // 구매자 아이디
	private Date buy_date; // 구매 일자
	private int buy_amount; // 구매량
	private String buy_addr; // 배송지 주소
	private String buy_tel; // 배송지 전화번호
	private String buy_name; // 구매자 이름
	private String buy_status; // 거래 상태

	public Payment() {
	}

	public Payment(int buy_no, int group_no, int sell_no, String member_id, Date buy_date, int buy_amount,
			String buy_addr, String buy_tel, String buy_name, String buy_status) {
		super();
		this.buy_no = buy_no;
		this.group_no = group_no;
		this.sell_no = sell_no;
		this.member_id = member_id;
		this.buy_date = buy_date;
		this.buy_amount = buy_amount;
		this.buy_addr = buy_addr;
		this.buy_tel = buy_tel;
		this.buy_name = buy_name;
		this.buy_status = buy_status;
	}

	@Override
	public String toString() {
		return "Payment [buy_no=" + buy_no + ", group_no=" + group_no + ", sell_no=" + sell_no + ", member_id="
				+ member_id + ", buy_date=" + buy_date + ", buy_amount=" + buy_amount + ", buy_addr=" + buy_addr
				+ ", buy_tel=" + buy_tel + ", buy_name=" + buy_name + ", buy_status=" + buy_status + "]";
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

	

}
