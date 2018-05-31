package com.kh.farm.payment.model.vo;


import org.springframework.stereotype.Component;

@Component("paymentComplete")
public class PaymentComplete implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6851412988023016530L;
	
	private int group_no;//주문번호
	private String name; //상품명
	private int paid_amount; //결제 금액
	private String buyer_name;//구매자명
	private String buyer_email;//구매자 이메일
	private String buyer_tel;//구매자 전화번호
	private String buyer_addr;//구매자 주소
	
	public PaymentComplete() {}

	public PaymentComplete(int group_no, String name, int paid_amount, String buyer_name, String buyer_email,
			String buyer_tel, String buyer_addr) {
		super();
		this.group_no = group_no;
		this.name = name;
		this.paid_amount = paid_amount;
		this.buyer_name = buyer_name;
		this.buyer_email = buyer_email;
		this.buyer_tel = buyer_tel;
		this.buyer_addr = buyer_addr;
	}

	@Override
	public String toString() {
		return "PaymentComplete [group_no=" + group_no + ", name=" + name + ", paid_amount=" + paid_amount
				+ ", buyer_name=" + buyer_name + ", buyer_email=" + buyer_email + ", buyer_tel=" + buyer_tel
				+ ", buyer_addr=" + buyer_addr + "]";
	}

	public int getGroup_no() {
		return group_no;
	}

	public void setGroup_no(int group_no) {
		this.group_no = group_no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPaid_amount() {
		return paid_amount;
	}

	public void setPaid_amount(int paid_amount) {
		this.paid_amount = paid_amount;
	}

	public String getBuyer_name() {
		return buyer_name;
	}

	public void setBuyer_name(String buyer_name) {
		this.buyer_name = buyer_name;
	}

	public String getBuyer_email() {
		return buyer_email;
	}

	public void setBuyer_email(String buyer_email) {
		this.buyer_email = buyer_email;
	}

	public String getBuyer_tel() {
		return buyer_tel;
	}

	public void setBuyer_tel(String buyer_tel) {
		this.buyer_tel = buyer_tel;
	}

	public String getBuyer_addr() {
		return buyer_addr;
	}

	public void setBuyer_addr(String buyer_addr) {
		this.buyer_addr = buyer_addr;
	}
	
	
}
