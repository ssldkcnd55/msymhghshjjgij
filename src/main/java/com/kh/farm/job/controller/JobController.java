package com.kh.farm.job.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.farm.job.model.service.JobService;
import com.kh.farm.job.model.vo.Job;
import com.kh.farm.notice.model.vo.Notice;

@Controller
public class JobController {
	@Autowired
	private JobService jobService;

	// 구인구직페이징처리
	@RequestMapping(value = "jobList.do")
	public void jobList(HttpServletResponse response, HttpServletRequest request) throws IOException {
		int limitPage = 10;
		int currentPage = 1;
		if (request.getParameter("page") != null) {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		int listCount = jobService.selectListcount();
		int startPage = ((int) ((double) currentPage / 5 + 0.8) - 1) * 5 + 1;
		int endPage = startPage + 4;
		int maxPage = (int) ((double) listCount / limitPage + 0.9);

		if (endPage > maxPage) {
			endPage = maxPage;
		}

		ArrayList<Job> jobList = jobService.selectJobList(currentPage);
		JSONObject json = new JSONObject();
		JSONArray jarr = new JSONArray();

		for (Job job : jobList) {
			JSONObject jsonobj = new JSONObject();
			jsonobj.put("rnum", job.getRnum());
			jsonobj.put("job_no", job.getJob_no());
			jsonobj.put("job_status", job.getJob_status());
			jsonobj.put("job_title", job.getJob_title());
			jsonobj.put("member_id", job.getMember_id());
			jsonobj.put("job_date", job.getJob_date().toString());
			jsonobj.put("startPage", startPage);
			jsonobj.put("endPage", endPage);
			jsonobj.put("maxPage", maxPage);
			jsonobj.put("currentPage", currentPage);

			jarr.add(jsonobj);
		}
		json.put("list", jarr);
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(json.toString());
		out.flush();
		out.close();
	}

	// 구인구직 글등록
	@RequestMapping(value = "jobMake.do", method = {RequestMethod.POST,RequestMethod.GET})
	public String insertJobMake(HttpServletResponse response, HttpServletRequest request, Job job) {

		String a = "ab";

		// 구인구직 주소/전화번호 객체 합치기
		/*String addrvalue = request.getParameter("job_addr");
		String addrvalue2 = request.getParameter("job_addr2");

		String addr = addrvalue + addrvalue2;*/

		String telvalue = request.getParameter("job_tel");
		String telvalue2 = request.getParameter("job_tel2");
		String telvalue3 = request.getParameter("job_tel3");

		String tel = telvalue + telvalue2 + telvalue3;

		/*job.setJob_addr(addr);*/
		job.setJob_tel(tel);

		int result = jobService.insertJobMake(job);

		if (result > 0) {

			return "job/job";
		}

		return a;

	}

	// 구인구직 상세보기
	@RequestMapping(value = "jobDetail.do")
	public String noticeDetail(Model model, @RequestParam(value = "job_no") int job_no) {

		System.out.println(job_no);
		Job job = jobService.jobDeatil(job_no);
		System.out.println(job.getJob_title());
		job.toString();
		if (job != null) {

			model.addAttribute("job", job);
			return "job/jobDetail";
		}
		return "에러페이지";
	}

	// 구인구직 수정
	// 구인구직 삭제
	// 구인중/마감 식별
	// 구인구직 장소 지도 api
	@RequestMapping(value = "jobmap.do")
	public void jobmap(HttpServletRequest request) {
		

	}

}
