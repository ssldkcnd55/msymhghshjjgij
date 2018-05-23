package com.kh.farm.category.model.service;

import java.util.List;

import com.kh.farm.category.model.vo.Category;

public interface CategoryService {
	
	List<Category> selectCategory();
	
	List<Category> selectCategory_main();


	List<Category> selectCategory_name();

	int deleteCategory_main(String category_main);

	int deleteCategory_name(int category_no);

	int addCategory_main(String category_main);
}
