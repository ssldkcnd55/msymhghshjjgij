package com.kh.farm.market.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("reply")
public class Reply implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 88888L;
	
	private int reply_no;//댓글 번호
	private int review_no;//리뷰 번호
	private int daily_no;//일지 번호
	private String member_id;//작성자 아이디
	private String reply_contents;//댓글 내용
private Date	 reply_date;//댓글 작성일
	
public Reply() {

}

public Reply(int reply_no, int review_no, int daily_no, String member_id, String reply_contents, Date reply_date) {
	super();
	this.reply_no = reply_no;
	this.review_no = review_no;
	this.daily_no = daily_no;
	this.member_id = member_id;
	this.reply_contents = reply_contents;
	this.reply_date = reply_date;
}

@Override
public String toString() {
	return "Reply [reply_no=" + reply_no + ", review_no=" + review_no + ", daily_no=" + daily_no + ", member_id="
			+ member_id + ", reply_contents=" + reply_contents + ", reply_date=" + reply_date + ", getClass()="
			+ getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
}

public int getReply_no() {
	return reply_no;
}

public void setReply_no(int reply_no) {
	this.reply_no = reply_no;
}

public int getReview_no() {
	return review_no;
}

public void setReview_no(int review_no) {
	this.review_no = review_no;
}

public int getDaily_no() {
	return daily_no;
}

public void setDaily_no(int daily_no) {
	this.daily_no = daily_no;
}

public String getMember_id() {
	return member_id;
}

public void setMember_id(String member_id) {
	this.member_id = member_id;
}

public String getReply_contents() {
	return reply_contents;
}

public void setReply_contents(String reply_contents) {
	this.reply_contents = reply_contents;
}

public Date getReply_date() {
	return reply_date;
}

public void setReply_date(Date reply_date) {
	this.reply_date = reply_date;
}


}
