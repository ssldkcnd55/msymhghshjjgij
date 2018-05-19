package com.kh.farm.common.model.vo;

public class PageNumber implements java.io.Serializable{
	private static final long serialVersionUID = 2020L;
	
	private int startRow;
	private int endRow;
	private int market_no;
	
	public PageNumber() {}

	

	public PageNumber(int startRow, int endRow, int market_no) {
		super();
		this.startRow = startRow;
		this.endRow = endRow;
		this.market_no = market_no;
	}



	public int getMarket_no() {
		return market_no;
	}



	public void setMarket_no(int market_no) {
		this.market_no = market_no;
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
	
	
}
