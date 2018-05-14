package com.kh.farm.chat.model.vo;

import org.springframework.stereotype.Component;

@Component("chat")
public class Chat implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 22222L;
	
	private int chat_no;//채팅 번호
	private String member_id1;//참여자1 아이디
	private String member_id2;//참여자2 아이디
	
	public Chat() {}

	public Chat(int chat_no, String member_id1, String member_id2) {
		super();
		this.chat_no = chat_no;
		this.member_id1 = member_id1;
		this.member_id2 = member_id2;
	}

	@Override
	public String toString() {
		return "Chat [chat_no=" + chat_no + ", member_id1=" + member_id1 + ", member_id2=" + member_id2 + "]";
	}

	public int getChat_no() {
		return chat_no;
	}

	public void setChat_no(int chat_no) {
		this.chat_no = chat_no;
	}

	public String getMember_id1() {
		return member_id1;
	}

	public void setMember_id1(String member_id1) {
		this.member_id1 = member_id1;
	}

	public String getMember_id2() {
		return member_id2;
	}

	public void setMember_id2(String member_id2) {
		this.member_id2 = member_id2;
	}
	
	
	
}
