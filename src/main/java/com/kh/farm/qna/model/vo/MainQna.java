package com.kh.farm.qna.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("mainQna")
public class MainQna implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2222L;
	private int rnum;
	private int main_qna_no;// 메인 QnA 번호
	private String member_id;// 메인 QnA 글쓴이 아이디
	private String main_qna_title;// 메인 QnA 제목
	private String main_qna_contents;// 메인 QnA 내용
	private Date main_qna_date;// 메인 QnA 작성일
	private String main_qna_answer;// 메인 QnA 답 내용
	private Date main_qna_answer_date;// 메인 QnA 답 작성일

	public MainQna() {
	}

	public MainQna(int rnum, int main_qna_no, String member_id, String main_qna_title, String main_qna_contents,
			Date main_qna_date, String main_qna_answer, Date main_qna_answer_date) {
		super();
		this.rnum = rnum;
		this.main_qna_no = main_qna_no;
		this.member_id = member_id;
		this.main_qna_title = main_qna_title;
		this.main_qna_contents = main_qna_contents;
		this.main_qna_date = main_qna_date;
		this.main_qna_answer = main_qna_answer;
		this.main_qna_answer_date = main_qna_answer_date;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	@Override
	public String toString() {
		return "Qna [main_qna_no=" + main_qna_no + ", member_id=" + member_id + ", main_qna_title=" + main_qna_title
				+ ", main_qna_contents=" + main_qna_contents + ", main_qna_date=" + main_qna_date + ", main_qna_answer="
				+ main_qna_answer + ", main_qna_answer_date=" + main_qna_answer_date + "]";
	}

	public int getMain_qna_no() {
		return main_qna_no;
	}

	public void setMain_qna_no(int main_qna_no) {
		this.main_qna_no = main_qna_no;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMain_qna_title() {
		return main_qna_title;
	}

	public void setMain_qna_title(String main_qna_title) {
		this.main_qna_title = main_qna_title;
	}

	public String getMain_qna_contents() {
		return main_qna_contents;
	}

	public void setMain_qna_contents(String main_qna_contents) {
		this.main_qna_contents = main_qna_contents;
	}

	public Date getMain_qna_date() {
		return main_qna_date;
	}

	public void setMain_qna_date(Date main_qna_date) {
		this.main_qna_date = main_qna_date;
	}

	public String getMain_qna_answer() {
		return main_qna_answer;
	}

	public void setMain_qna_answer(String main_qna_answer) {
		this.main_qna_answer = main_qna_answer;
	}

	public Date getMain_qna_answer_date() {
		return main_qna_answer_date;
	}

	public void setMain_qna_answer_date(Date main_qna_answer_date) {
		this.main_qna_answer_date = main_qna_answer_date;
	}

}
