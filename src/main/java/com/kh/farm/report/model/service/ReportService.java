package com.kh.farm.report.model.service;

import java.util.List;

import com.kh.farm.report.model.vo.Report;

public interface ReportService {

	int insertReport(Report report);

	List<Report> selectReportList(int currentPage);

	int selectReportCount();

	int changeReportStatus(int report_no);

	Report selectReport(int report_no);

	List<Report> selectChangeReport(int currentPage, int type);

}
