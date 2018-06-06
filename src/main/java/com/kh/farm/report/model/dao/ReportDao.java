package com.kh.farm.report.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.farm.common.model.vo.PageNumber;
import com.kh.farm.report.model.vo.Report;

@Repository
public class ReportDao {

	public int insertReport(SqlSessionTemplate sqlSession, Report report) {
		// TODO Auto-generated method stub
		return sqlSession.insert("insertReport", report);
	}

	public List<Report> selectReportList(SqlSessionTemplate sqlSession, int currentPage) {
		int startRow =(currentPage-1)*10+1; //1~10, 11~20 계산할 거 ex) 1, 11, 21, 31,)
		int endRow = startRow+9;
		PageNumber pnum = new PageNumber();
		pnum.setStartRow(startRow);
		pnum.setEndRow(endRow);
		return sqlSession.selectList("selectReportList",pnum);
	}

	public int selectReportCount(SqlSessionTemplate sqlSession) {
		int listCount = sqlSession.selectOne("report.reportCount");
		return listCount;
	}

	public int changeReportStatus(SqlSessionTemplate sqlSession, int report_no) {
		
		return sqlSession.update("report.changeReportStatus", report_no);
	}


	public Report selectReport(SqlSessionTemplate sqlSession, int report_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("report.selectReport", report_no);
	}

	public List<Report> selectChangeReport(SqlSessionTemplate sqlSession, int currentPage, int type) {
		int startRow =(currentPage-1)*10+1; //1~10, 11~20 계산할 거 ex) 1, 11, 21, 31,)
		int endRow = startRow+9;
		PageNumber pnum = new PageNumber();
		pnum.setStartRow(startRow);
		pnum.setEndRow(endRow);
		pnum.setType(type);
		return sqlSession.selectList("report.selectChangeList", pnum);
	}
	
	
}
