package com.kh.farm.chat.model.vo;


import org.springframework.stereotype.Component;

@Component("chatList")
public class ChatList implements java.io.Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 4684654L;

	private int chat_no;//채팅 번호
	
	private String member_id;//상대방 아이디
	private String member_name;//상대방 이름
	private String member_img;//상대방 프로필 사진
	private String chat_history_contents;//채팅 내용
	private String chat_history_date;//채팅 작성일
	private int chat_history_alarm;//채팅 확인 여부
	
	public ChatList() {}

	public ChatList(int chat_no, String member_id, String member_name, String member_img, String chat_history_contents,
			String chat_history_date, int chat_history_alarm) {
		super();
		this.chat_no = chat_no;
		this.member_id = member_id;
		this.member_name = member_name;
		this.member_img = member_img;
		this.chat_history_contents = chat_history_contents;
		this.chat_history_date = chat_history_date;
		this.chat_history_alarm = chat_history_alarm;
	}

	@Override
	public String toString() {
		return "ChatList [chat_no=" + chat_no + ", member_id=" + member_id + ", member_name=" + member_name
				+ ", member_img=" + member_img + ", chat_history_contents=" + chat_history_contents
				+ ", chat_history_date=" + chat_history_date + ", chat_history_alarm=" + chat_history_alarm + "]";
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

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_img() {
		return member_img;
	}

	public void setMember_img(String member_img) {
		this.member_img = member_img;
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

	public int getChat_history_alarm() {
		return chat_history_alarm;
	}

	public void setChat_history_alarm(int chat_history_alarm) {
		this.chat_history_alarm = chat_history_alarm;
	}

	


}
