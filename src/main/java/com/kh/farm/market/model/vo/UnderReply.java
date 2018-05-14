package com.kh.farm.market.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("underReply")
public class UnderReply implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 99999L;
	
	private int under_reply_no;//댓글의 댓글번호
	private int reply_no;//댓글 번호
private String	 member_id;//작성자 아이디
private String	 under_reply_content;//댓글의 댓글 내용
private Date  under_reply_date;//댓글의 댓글 작성일

public UnderReply() {}

public UnderReply(int under_reply_no, int reply_no, String member_id, String under_reply_content,
		Date under_reply_date) {
	super();
	this.under_reply_no = under_reply_no;
	this.reply_no = reply_no;
	this.member_id = member_id;
	this.under_reply_content = under_reply_content;
	this.under_reply_date = under_reply_date;
}

@Override
public String toString() {
	return "UnderReply [under_reply_no=" + under_reply_no + ", reply_no=" + reply_no + ", member_id=" + member_id
			+ ", under_reply_content=" + under_reply_content + ", under_reply_date=" + under_reply_date + "]";
}

public int getUnder_reply_no() {
	return under_reply_no;
}

public void setUnder_reply_no(int under_reply_no) {
	this.under_reply_no = under_reply_no;
}

public int getReply_no() {
	return reply_no;
}

public void setReply_no(int reply_no) {
	this.reply_no = reply_no;
}

public String getMember_id() {
	return member_id;
}

public void setMember_id(String member_id) {
	this.member_id = member_id;
}

public String getUnder_reply_content() {
	return under_reply_content;
}

public void setUnder_reply_content(String under_reply_content) {
	this.under_reply_content = under_reply_content;
}

public Date getUnder_reply_date() {
	return under_reply_date;
}

public void setUnder_reply_date(Date under_reply_date) {
	this.under_reply_date = under_reply_date;
}



}
