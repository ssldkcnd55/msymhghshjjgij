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
}
