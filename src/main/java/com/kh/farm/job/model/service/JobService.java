package com.kh.farm.job.model.service;

import java.util.ArrayList;

import com.kh.farm.common.model.vo.PageNumber;
import com.kh.farm.job.model.vo.Job;
import com.kh.farm.notice.model.vo.Notice;

public interface JobService {

	int selectListcount();
	
	int insertJobMake(Job job);
	
	Job jobDeatil(int job_no);

	ArrayList<Job> selectJobList(int currentPage);
	
	ArrayList<Job> selectJobaddr(int currentPage,String addr);
	
	ArrayList<Job> searchJobList(int currentPage, PageNumber pp);

}
