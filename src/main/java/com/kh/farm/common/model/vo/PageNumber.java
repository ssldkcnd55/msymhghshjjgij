package com.kh.farm.common.model.vo;

import java.util.Arrays;
import java.util.List;

public class PageNumber implements java.io.Serializable {
	private static final long serialVersionUID = 2020L;

	private int startRow;
	private int endRow;
	private int market_no;
	private int auction_no;
	private String member_id;
	private String search;
	private String ctype;
	private String cname;
	private String sort;
	private int review_no;
	private int daily_no;
	private int report_no;
	private String keyword;
	private int select;
	private int type;
	private String reviewSearch;
	private String addr;

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	private String job_search; // 구인구직 검색

	public String getJob_search() {
		return job_search;
	}

	public void setJob_search(String job_search) {
		this.job_search = job_search;
	}

	private String qnaSearch;

	public PageNumber() {
	}

	public PageNumber(int startRow, int endRow, int market_no, int auction_no, String member_id, String search,
			String ctype, String cname, String sort, int review_no, int daily_no, int report_no, String keyword,
			int select, int type, String reviewSearch, String qnaSearch , String addr) {
		super();
		this.startRow = startRow;
		this.endRow = endRow;
		this.market_no = market_no;
		this.auction_no = auction_no;
		this.member_id = member_id;
		this.search = search;
		this.ctype = ctype;
		this.cname = cname;
		this.sort = sort;
		this.review_no = review_no;
		this.daily_no = daily_no;
		this.report_no = report_no;
		this.keyword = keyword;
		this.select = select;
		this.type = type;
		this.reviewSearch = reviewSearch;
		this.qnaSearch = qnaSearch;
		this.addr = addr;
	}

	public String getQnaSearch() {
		return qnaSearch;
	}

	public void setQnaSearch(String qnaSearch) {
		this.qnaSearch = qnaSearch;
	}

	@Override
	public String toString() {
		return "PageNumber [startRow=" + startRow + ", endRow=" + endRow + ", market_no=" + market_no + ", auction_no="
				+ auction_no + ", member_id=" + member_id + ", search=" + search + ", ctype=" + ctype + ", cname="
				+ cname + ", sort=" + sort + ", review_no=" + review_no + ", daily_no=" + daily_no + ", report_no="
				+ report_no + ", keyword=" + keyword + ", select=" + select + ", type=" + type + ", reviewSearch="
				+ reviewSearch + ", qnaSearch=" + qnaSearch + "]";
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	public int getMarket_no() {
		return market_no;
	}

	public void setMarket_no(int market_no) {
		this.market_no = market_no;
	}

	public int getAuction_no() {
		return auction_no;
	}

	public void setAuction_no(int auction_no) {
		this.auction_no = auction_no;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public String getCtype() {
		return ctype;
	}

	public void setCtype(String ctype) {
		this.ctype = ctype;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public int getReview_no() {
		return review_no;
	}

	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}

	public int getDaily_no() {
		return daily_no;
	}

	public void setDaily_no(int daily_no) {
		this.daily_no = daily_no;
	}

	public int getReport_no() {
		return report_no;
	}

	public void setReport_no(int report_no) {
		this.report_no = report_no;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getSelect() {
		return select;
	}

	public void setSelect(int select) {
		this.select = select;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getReviewSearch() {
		return reviewSearch;
	}

	public void setReviewSearch(String reviewSearch) {
		this.reviewSearch = reviewSearch;
	}

}