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
	public List<Category> selectCategory_name() {
		// 카테고리 이름
		return categoryDao.selectCategory_name(sqlSession);	}
	@Override
	public int deleteCategory_main(String category_main) {
		// TODO Auto-generated method stub
		return categoryDao.deleteCategory_main(sqlSession,category_main);
	}
	@Override
	public int deleteCategory_name(int category_no) {
		// TODO Auto-generated method stub
		return categoryDao.deleteCategory_name(sqlSession,category_no);
	}
	@Override
	public int addCategory_main(String category_main) {
		// TODO Auto-generated method stub
		return categoryDao.addCategory_main(sqlSession,category_main);
	}
	@Override
	public int addCategory_name(Category category) {
		// TODO Auto-generated method stub
		return categoryDao.addCategory_name(sqlSession,category);
	}
	@Override
	public Category selectCategory_name(Category category) {
		// TODO Auto-generated method stub
		return categoryDao.selectCategory_name(sqlSession,category);
	}
	@Override
	public int updateCategory_main(Category c) {
		// TODO Auto-generated method stub
		return categoryDao.updateCategory_main(sqlSession,c);
	}
	@Override
	public int updateCategory_name(Category c) {
		// TODO Auto-generated method stub
		return categoryDao.updateCategory_name(sqlSession,c);
	}
	
	
}
