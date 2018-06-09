package com.kh.farm.visit.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/*@Repository*/
public class VisitDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int visitCount() {
		return sqlSession.insert("visit.visitCount");
	}
	

	public int getTotalCount() {
		return sqlSession.selectOne("visit.totalCount");
	}

	public int getTodayCount() {
		return sqlSession.selectOne("visit.todayCount");
	}

}
