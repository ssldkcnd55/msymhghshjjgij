package com.kh.farm.category.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.farm.category.model.dao.CategoryDao;
import com.kh.farm.category.model.vo.Category;

@Service
public class CategoryImpl implements CategoryService{
	
	@Autowired
	private CategoryDao categoryDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Override
	public List<Category> selectCategory() {
		//카테고리 가져오기
		return categoryDao.selectCategory(sqlSession);
	}
	@Override
	public List<Category> selectCategory_main() {
		// 카테고리 대분류
		return categoryDao.selectCategory_main(sqlSession);
	}
	@Override
	public List<Category> selectCategory_small() {
		// 카테고리 소분류
		return categoryDao.selectCategory_small(sqlSession);
	}
	@Override
	public List<Category> selectCategory_name() {
		// 카테고리 이름
		return categoryDao.selectCategory_name(sqlSession);	}
	
}
