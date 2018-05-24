package com.kh.farm.category.model.vo;

import org.springframework.stereotype.Component;

@Component("category")
public class Category  implements java.io.Serializable{

	private static final long serialVersionUID = 9872L;
	private int category_no;
	private String category_main;
	private String category_name;
	
	public Category() {}

	public Category(int category_no, String category_main, String category_name) {
		super();
		this.category_no = category_no;
		this.category_main = category_main;
		this.category_name = category_name;
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


	public String getCategory_name() {
		return category_name;
	}

	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Category [category_no=" + category_no + ", category_main=" + category_main + ", category_small="
				+ ", category_name=" + category_name + "]";
	}
	
	
}
