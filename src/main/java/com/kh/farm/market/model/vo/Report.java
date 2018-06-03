package com.kh.farm.market.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

/*@Component("report")*/
public class Report implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 66666L;
	
	private int report_no;//신고 번호
	private int review_no;//리뷰 번호
	private String member_id;//신고 작성자 아이디
	private Date report_date;//신고일
	private String report_status;//신고 상태
	private String report_contents;//신고 내용
	private String report_category;//신고 카테고리
	
	public Report() {
	
	}

	public Report(int report_no, int review_no, String member_id, Date report_date, String report_status,
			String report_contents, String report_category) {
		super();
		this.report_no = report_no;
		this.review_no = review_no;
		this.member_id = member_id;
		this.report_date = report_date;
		this.report_status = report_status;
		this.report_contents = report_contents;
		this.report_category = report_category;
	}

	@Override
	public String toString() {
		return "Report [report_no=" + report_no + ", review_no=" + review_no + ", member_id=" + member_id
				+ ", report_date=" + report_date + ", report_status=" + report_status + ", report_contents="
				+ report_contents + ", report_category=" + report_category + "]";
	}

	public int getReport_no() {
		return report_no;
	}

	public void setReport_no(int report_no) {
		this.report_no = report_no;
	}

	public int getReview_no() {
		return review_no;
	}

	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public Date getReport_date() {
		return report_date;
	}

	public void setReport_date(Date report_date) {
		this.report_date = report_date;
	}

	public String getReport_status() {
		return report_status;
	}

	public void setReport_status(String report_status) {
		this.report_status = report_status;
	}

	public String getReport_contents() {
		return report_contents;
	}

	public void setReport_contents(String report_contents) {
		this.report_contents = report_contents;
	}

	public String getReport_category() {
		return report_category;
	}

	public void setReport_category(String report_category) {
		this.report_category = report_category;
	}
	
	
}
