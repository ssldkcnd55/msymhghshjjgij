package com.kh.farm.category.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.farm.category.model.vo.Category;

@Repository
public class CategoryDao {

	public List<Category> selectCategory(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectList("category.selectCategory");
	}

	public List<Category> selectCategory_main(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("category.selectCategory_main");
	}


	public List<Category> selectCategory_name(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("category.selectCategory");
	}

	public int deleteCategory_main(SqlSessionTemplate sqlSession, String category_main) {
		// TODO Auto-generated method stub
		return sqlSession.delete("category.deleteCategory_main", category_main);
	}

	public int deleteCategory_name(SqlSessionTemplate sqlSession, int category_no) {
		// TODO Auto-generated method stub
		return sqlSession.delete("category.deleteCategory_name", category_no);
	}

	public int addCategory_main(SqlSessionTemplate sqlSession, String category_main) {
		// TODO Auto-generated method stub
		return sqlSession.insert("category.addCategory_main", category_main);
	}

	public int addCategory_name(SqlSessionTemplate sqlSession, Category category) {
		// TODO Auto-generated method stub
		return sqlSession.insert("category.addCategory_name", category);
	}

	public Category selectCategory_name(SqlSessionTemplate sqlSession, Category category) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("category.selectCategory_name", category);
	}

	public int updateCategory_main(SqlSessionTemplate sqlSession, Category c) {
		// TODO Auto-generated method stub
		return sqlSession.update("category.updateCategory_main", c);
	}

	public int updateCategory_name(SqlSessionTemplate sqlSession, Category c) {
		// TODO Auto-generated method stub
		return sqlSession.update("category.updateCategory_name", c);
	}

	
}
