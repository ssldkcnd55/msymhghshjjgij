package com.kh.farm.report.model.service;

import java.util.List;

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

	@Override
	public List<Report> selectReportList(int currentPage) {
		// TODO Auto-generated method stub
		return reportDao.selectReportList(sqlSession,currentPage);
	}

	@Override
	public int selectReportCount() {
		// TODO Auto-generated method stub
		return reportDao.selectReportCount(sqlSession);
	}
	
	
}
