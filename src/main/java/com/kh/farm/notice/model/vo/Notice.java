package com.kh.farm.notice.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("notice")
public class Notice implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5555L;
	private int rnum;
	private int notice_no; //공지사항 번호
	private String notice_title; //공지사항 제목
	private String notice_contents; //공지사항 내용
	private Date notice_date; //공지사항 작성일
	
	public Notice() {}


	public Notice(int rnum, int notice_no, String notice_title, String notice_contents, Date notice_date) {
		super();
		this.rnum = rnum;
		this.notice_no = notice_no;
		this.notice_title = notice_title;
		this.notice_contents = notice_contents;
		this.notice_date = notice_date;
	}


	public int getRnum() {
		return rnum;
	}


	public void setRnum(int rnum) {
		this.rnum = rnum;
	}


	@Override
	public String toString() {
		return "Notice [notice_no=" + notice_no + ", notice_title=" + notice_title + ", notice_contents="
				+ notice_contents + ", notice_date=" + notice_date + "]";
	}

	public int getNotice_no() {
		return notice_no;
	}

	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}

	public String getNotice_title() {
		return notice_title;
	}

	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}

	public String getNotice_contents() {
		return notice_contents;
	}

	public void setNotice_contents(String notice_contents) {
		this.notice_contents = notice_contents;
	}

	public Date getNotice_date() {
		return notice_date;
	}

	public void setNotice_date(Date notice_date) {
		this.notice_date = notice_date;
	}
	
	
	
}
