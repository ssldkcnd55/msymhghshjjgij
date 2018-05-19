package com.kh.farm.chat.model.vo;

import org.springframework.stereotype.Component;

@Component("chatHistory")
public class ChatHistory implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 33333L;

	private int chat_no;// 채팅 번호
	private String member_id;//작성자 아이디
	private String chat_history_contents;//채팅 내용
	private String chat_history_date;//채팅 작성일
	private String chat_history_alarm;//채팅 확인 여부

	public ChatHistory() {}

	public ChatHistory(int chat_no, String member_id, String chat_history_contents, String chat_history_date,
			String chat_history_alarm) {
		super();
		this.chat_no = chat_no;
		this.member_id = member_id;
		this.chat_history_contents = chat_history_contents;
		this.chat_history_date = chat_history_date;
		this.chat_history_alarm = chat_history_alarm;
	}

	@Override
	public String toString() {
		return "ChatHistory [chat_no=" + chat_no + ", member_id=" + member_id + ", chat_history_contents="
				+ chat_history_contents + ", chat_history_date=" + chat_history_date + ", chat_history_alarm="
				+ chat_history_alarm + "]";
	}

	public int getChat_no() {
		return chat_no;
	}

	public void setChat_no(int chat_no) {
		this.chat_no = chat_no;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getChat_history_contents() {
		return chat_history_contents;
	}

	public void setChat_history_contents(String chat_history_contents) {
		this.chat_history_contents = chat_history_contents;
	}

	public String getChat_history_date() {
		return chat_history_date;
	}

	public void setChat_history_date(String chat_history_date) {
		this.chat_history_date = chat_history_date;
	}

	public String getChat_history_alarm() {
		return chat_history_alarm;
	}

	public void setChat_history_alarm(String chat_history_alarm) {
		this.chat_history_alarm = chat_history_alarm;
	}

	
	
	
}
