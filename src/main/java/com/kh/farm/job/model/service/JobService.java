package com.kh.farm.job.model.service;

import java.util.ArrayList;

import com.kh.farm.job.model.vo.Job;

public interface JobService {

	int selectListcount();
	
	int insertJobMake(Job job);

	ArrayList<Job> selectJobList(int currentPage);

}
