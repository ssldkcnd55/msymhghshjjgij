package com.kh.farm.report.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.farm.report.model.service.ReportService;
import com.kh.farm.report.model.vo.Report;


@Controller
public class ReportController {
@Autowired private ReportService reportService;

	@RequestMapping("report.do")
	@ResponseBody
	public void report(HttpServletResponse response,Report report) throws IOException{
		System.out.println("리포트 입력 메서드 실행!!!");
		response.setContentType("application/json; charset=utf-8");
		int result = reportService.insertReport(report);
		
		if(result < 0) {
			JSONObject json = new JSONObject();
			json.put("result", 100);
			PrintWriter out = response.getWriter();
			out.print(json.toJSONString());
			out.flush();
			out.close();
		}
		
	}
}
