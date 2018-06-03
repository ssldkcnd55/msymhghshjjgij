package com.kh.farm.report.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.farm.report.model.dao.ReportDao;
import com.kh.farm.report.model.vo.Report;

@Service
public class ReportServiceImpl implements ReportService{
	@Autowired private ReportDao reportDao;
	@Autowired private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertReport(Report report) {
		// TODO Auto-generated method stub
		return reportDao.insertReport(sqlSession,report);
	}
}
