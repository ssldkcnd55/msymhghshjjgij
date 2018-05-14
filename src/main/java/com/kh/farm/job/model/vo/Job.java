package com.kh.farm.job.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("job")
public class Job implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 8888L;
	
	private int job_no;//구인구직 번호
	private String member_id;//작성자 아이디
	private String job_title;//구인구직 제목
	private String job_contents;//구인구직 내용
	private Date job_date;//구인구직 작성일
	private String job_status;//구인구직 상태
	private Date job_startdate;//구인구직 시작일
	private Date job_enddate;//구인구직 종료일
	private String job_addr;//구인구직 주소
	private String job_tel;//구인구직 전화번호
	
	public Job() {
	
	}

	public Job(int job_no, String member_id, String job_title, String job_contents, Date job_date, String job_status,
			Date job_startdate, Date job_enddate, String job_addr, String job_tel) {
		super();
		this.job_no = job_no;
		this.member_id = member_id;
		this.job_title = job_title;
		this.job_contents = job_contents;
		this.job_date = job_date;
		this.job_status = job_status;
		this.job_startdate = job_startdate;
		this.job_enddate = job_enddate;
		this.job_addr = job_addr;
		this.job_tel = job_tel;
	}

	@Override
	public String toString() {
		return "Job [job_no=" + job_no + ", member_id=" + member_id + ", job_title=" + job_title + ", job_contents="
				+ job_contents + ", job_date=" + job_date + ", job_status=" + job_status + ", job_startdate="
				+ job_startdate + ", job_enddate=" + job_enddate + ", job_addr=" + job_addr + ", job_tel=" + job_tel
				+ "]";
	}

	public int getJob_no() {
		return job_no;
	}

	public void setJob_no(int job_no) {
		this.job_no = job_no;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getJob_title() {
		return job_title;
	}

	public void setJob_title(String job_title) {
		this.job_title = job_title;
	}

	public String getJob_contents() {
		return job_contents;
	}

	public void setJob_contents(String job_contents) {
		this.job_contents = job_contents;
	}

	public Date getJob_date() {
		return job_date;
	}

	public void setJob_date(Date job_date) {
		this.job_date = job_date;
	}

	public String getJob_status() {
		return job_status;
	}

	public void setJob_status(String job_status) {
		this.job_status = job_status;
	}

	public Date getJob_startdate() {
		return job_startdate;
	}

	public void setJob_startdate(Date job_startdate) {
		this.job_startdate = job_startdate;
	}

	public Date getJob_enddate() {
		return job_enddate;
	}

	public void setJob_enddate(Date job_enddate) {
		this.job_enddate = job_enddate;
	}

	public String getJob_addr() {
		return job_addr;
	}

	public void setJob_addr(String job_addr) {
		this.job_addr = job_addr;
	}

	public String getJob_tel() {
		return job_tel;
	}

	public void setJob_tel(String job_tel) {
		this.job_tel = job_tel;
	}
	
	
}
