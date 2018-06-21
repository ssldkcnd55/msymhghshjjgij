package com.kh.farm.kakao.model.vo;

import org.springframework.stereotype.Component;

@Component("kakao")
public class Kakao implements java.io.Serializable{
	private static final long serialVersionUID = 5545141L;
	
	private String kakao_id;
	private String kakao_access;
	private String kakao_refresh;
	
	public Kakao() {
		// TODO Auto-generated constructor stub
	}
	
	public Kakao(String kakao_id, String kakao_access, String kakao_refresh) {
		super();
		this.kakao_id = kakao_id;
		this.kakao_access = kakao_access;
		this.kakao_refresh = kakao_refresh;
	}

	public String getKakao_id() {
		return kakao_id;
	}

	public void setKakao_id(String kakao_id) {
		this.kakao_id = kakao_id;
	}

	public String getKakao_access() {
		return kakao_access;
	}

	public void setKakao_access(String kakao_access) {
		this.kakao_access = kakao_access;
	}

	public String getKakao_refresh() {
		return kakao_refresh;
	}

	public void setKakao_refresh(String kakao_refresh) {
		this.kakao_refresh = kakao_refresh;
	}

	@Override
	public String toString() {
		return "Kakao [kakao_id=" + kakao_id + ", kakao_access=" + kakao_access + ", kakao_refresh=" + kakao_refresh
				+ "]";
	}
	
	
}
