package com.kh.farm.category.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.farm.category.model.vo.Category;

@Repository
public class CategoryDao {

	public List<Category> selectCategory(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectList("selectCategory");
	}

	public List<Category> selectCategory_main(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("selectCategory_main");
	}

	public List<Category> selectCategory_small(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("selectCategory_small");
	}

	public List<Category> selectCategory_name(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("selectCategory");
	}
}
