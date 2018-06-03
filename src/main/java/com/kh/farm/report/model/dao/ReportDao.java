package com.kh.farm.report.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.farm.report.model.vo.Report;

@Repository
public class ReportDao {

	public int insertReport(SqlSessionTemplate sqlSession, Report report) {
		// TODO Auto-generated method stub
		return sqlSession.insert("insertReport", report);
	}
	
}
