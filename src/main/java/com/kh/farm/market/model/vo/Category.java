package com.kh.farm.market.model.vo;

import org.springframework.stereotype.Component;

@Component("category2")
public class Category implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 77777L;
	
	private int category_no;//카테고리 번호
	private String category_main;//카테고리 대분류
	private String category_small;//카테고리 중분류
	private String category_name;//카테고리 이름
	
	public Category() {
	
	}

	public Category(int category_no, String category_main, String category_small, String category_name) {
		super();
		this.category_no = category_no;
		this.category_main = category_main;
		this.category_small = category_small;
		this.category_name = category_name;
	}

	@Override
	public String toString() {
		return "Category [category_no=" + category_no + ", category_main=" + category_main + ", category_small="
				+ category_small + ", category_name=" + category_name + "]";
	}

	public int getCategory_no() {
		return category_no;
	}

	public void setCategory_no(int category_no) {
		this.category_no = category_no;
	}

	public String getCategory_main() {
		return category_main;
	}

	public void setCategory_main(String category_main) {
		this.category_main = category_main;
	}

	public String getCategory_small() {
		return category_small;
	}

	public void setCategory_small(String category_small) {
		this.category_small = category_small;
	}

	public String getCategory_name() {
		return category_name;
	}

	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	
	

}
