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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.farm.job.model.service.JobService;
import com.kh.farm.job.model.vo.Job;



@Controller
public class JobController {
	@Autowired private JobService jobService;
	
	//备牢备流 其捞隆 贸府
	@RequestMapping(value="jobList.do")
	public void jobList(HttpServletResponse response,HttpServletRequest request)throws IOException {
		int limitPage =10;
		int currentPage =1;
		if(request.getParameter("page") !=null) {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		int listCount = jobService.selectListcount();
		int startPage =((int)((double)currentPage/5 +0.8)-1)*5+1;
		int endPage =startPage+4;
		int maxPage= (int)((double)listCount/limitPage+0.9);
		
		if(endPage>maxPage) {
			endPage =maxPage;
		}
		
		ArrayList<Job> jobList = jobService.selectJobList(currentPage); 
		JSONObject json = new JSONObject();
		JSONArray jarr = new JSONArray();
		
		for(Job job : jobList) {
			JSONObject jsonobj = new JSONObject();
			jsonobj.put("rnum", job.getRnum());
			jsonobj.put("job_no",job.getJob_no());
			jsonobj.put("job_status", job.getJob_status());
			jsonobj.put("job_title", job.getJob_title());
			jsonobj.put("member_id", job.getMember_id());
			jsonobj.put("job_date", job.getJob_date().toString());
			jsonobj.put("startPage",startPage );
			jsonobj.put("endPage",endPage);
			jsonobj.put("maxPage", maxPage);
			jsonobj.put("currentPage", currentPage);
			 
			jarr.add(jsonobj);
		}
		json.put("list", jarr);
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out =response.getWriter();
		out.print(json.toString());
		out.flush();
		out.close();
	}
	//备牢备流 臂 殿废
	@RequestMapping(value="jobMake.do")
	public ModelAndView JobMake(ModelAndView mv){
	
		return mv;
	}
	//备牢备流 焊扁
	
	
	
}
