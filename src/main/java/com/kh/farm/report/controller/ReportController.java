package com.kh.farm.report.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.farm.report.model.service.ReportService;
import com.kh.farm.report.model.vo.Report;


@Controller
public class ReportController {
@Autowired private ReportService reportService;

	@RequestMapping("report.do")
	@ResponseBody
	public void report(HttpServletResponse response,Report report) throws IOException{
		System.out.println("리포트 입력 메서드 실행!!!"+report.toString());
		response.setContentType("application/json; charset=utf-8");
		int result = reportService.insertReport(report);
		
		if(result < 0) {
			JSONObject json = new JSONObject();
			json.put("result", 100);
			PrintWriter out = response.getWriter();
			out.print(json.toJSONString());
			out.flush();
			out.close();
		}else {
		JSONObject json = new JSONObject();
		json.put("result", 200);
		PrintWriter out = response.getWriter();
		out.print(json.toJSONString());
		out.flush();
		out.close();
		}
	}
	
	@RequestMapping(value="reportList.do",method=RequestMethod.POST)
	@ResponseBody
	public void reportList(HttpServletResponse response,@RequestParam("page") int currentPage) throws IOException{
		System.out.println("리포트 리스트 메서드 실행~~");
		//response.setContentType("application/json; charset=utf-8");
		JSONArray jarr =new JSONArray();
		List<Report> report = reportService.selectReportList(currentPage);
		int limitPage = 10;
		int listCount = reportService.selectReportCount();
		
		int maxPage=(int)((double)listCount/limitPage+0.9); //ex) 41개면 '5'페이지나와야되는데 '5'를 계산해줌
		int startPage=((int)((double)currentPage/5+0.8)-1)*5+1;
		int endPage=startPage+5-1;
		
		if(maxPage<endPage) {
			endPage = maxPage;
		}
		
		for(Report r : report) {
			JSONObject json = new JSONObject();
			json.put("rnum", r.getRnum());
			json.put("report_no", r.getReport_no());
			json.put("review_no", r.getReview_no());
			json.put("member_id", r.getMember_id());
			json.put("report_date", r.getReport_date());
			json.put("startPage", startPage);
			json.put("endPage", endPage);
			json.put("maxPage", maxPage);
			json.put("currentPage",currentPage);
			json.put("report_status",r.getReport_status());
			
			/*if(r.getReport_status().equals('0')) {
				json.put("report_status", "미처리");
			}else {
				json.put("report_status", "처리됨");
			}*/
			
			json.put("report_contents", r.getReport_contents());
			json.put("report_category", r.getReport_category());
			jarr.add(json);
		}
		
		JSONObject sendJson = new JSONObject();
		sendJson.put("list", jarr);
		System.out.println("리포트 리스트 메서드 종료");
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		System.out.println(sendJson.toJSONString());
		out.append(sendJson.toJSONString());
		out.flush();
		out.close();
	}
}
