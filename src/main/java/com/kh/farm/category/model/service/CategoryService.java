package com.kh.farm.category.model.service;

import java.util.List;

import com.kh.farm.category.model.vo.Category;

public interface CategoryService {
	
	List<Category> selectCategory();
	
	List<Category> selectCategory_main();

	List<Category> selectCategory_small();

	List<Category> selectCategory_name();
}
