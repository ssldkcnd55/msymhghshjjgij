package com.kh.farm.member.model.vo;

import org.springframework.stereotype.Component;

@Component("member")
public class Member implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 6666L;
	
	private String member_id;//회원 아이디
	private String member_pwd;//회원 비밀번호
	private String member_category;//회원 분류
	private String member_name;//회원 이름
	private String member_addr;//회원 주소
	private String member_tel;//회원 전화번호
	private String member_approval;//회원 승인상태
	private String member_img;//회원 프로필 사진
	private String member_withdraw;//회원 탈퇴여부
	private int member_warning_count;//회원 경고 횟수
	private int rnum;
	private String ip; //접속 ip
	public Member() {
	
	}
	public Member(String member_id, String member_pwd, String member_category, String member_name, String member_addr,
			String member_tel, String member_approval, String member_img, String member_withdraw,
			int member_warning_count, int rnum, String ip) {
		super();
		this.member_id = member_id;
		this.member_pwd = member_pwd;
		this.member_category = member_category;
		this.member_name = member_name;
		this.member_addr = member_addr;
		this.member_tel = member_tel;
		this.member_approval = member_approval;
		this.member_img = member_img;
		this.member_withdraw = member_withdraw;
		this.member_warning_count = member_warning_count;
		this.rnum = rnum;
		this.ip = ip;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_pwd() {
		return member_pwd;
	}
	public void setMember_pwd(String member_pwd) {
		this.member_pwd = member_pwd;
	}
	public String getMember_category() {
		return member_category;
	}
	public void setMember_category(String member_category) {
		this.member_category = member_category;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_addr() {
		return member_addr;
	}
	public void setMember_addr(String member_addr) {
		this.member_addr = member_addr;
	}
	public String getMember_tel() {
		return member_tel;
	}
	public void setMember_tel(String member_tel) {
		this.member_tel = member_tel;
	}
	public String getMember_approval() {
		return member_approval;
	}
	public void setMember_approval(String member_approval) {
		this.member_approval = member_approval;
	}
	public String getMember_img() {
		return member_img;
	}
	public void setMember_img(String member_img) {
		this.member_img = member_img;
	}
	public String getMember_withdraw() {
		return member_withdraw;
	}
	public void setMember_withdraw(String member_withdraw) {
		this.member_withdraw = member_withdraw;
	}
	public int getMember_warning_count() {
		return member_warning_count;
	}
	public void setMember_warning_count(int member_warning_count) {
		this.member_warning_count = member_warning_count;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	@Override
	public String toString() {
		return "Member [member_id=" + member_id + ", member_pwd=" + member_pwd + ", member_category=" + member_category
				+ ", member_name=" + member_name + ", member_addr=" + member_addr + ", member_tel=" + member_tel
				+ ", member_approval=" + member_approval + ", member_img=" + member_img + ", member_withdraw="
				+ member_withdraw + ", member_warning_count=" + member_warning_count + ", rnum=" + rnum + ", ip=" + ip
				+ "]";
	}

	
}
