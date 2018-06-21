package com.kh.farm.job.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.farm.common.model.vo.PageNumber;
import com.kh.farm.job.model.dao.JobDao;
import com.kh.farm.job.model.vo.Job;
import com.kh.farm.notice.model.vo.Notice;

@Service
public class JobServiceImpl implements JobService {
	@Autowired
	private JobDao jobDao;
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int selectListcount() {
		// TODO Auto-generated method stub
		return jobDao.listCount(sqlSession);
	}

	@Override
	public ArrayList<Job> selectJobList(int currentPage) {
		// TODO Auto-generated method stub
		return jobDao.selectJobList(currentPage, sqlSession);
	}
	@Override
	public ArrayList<Job> searchJobList(int currentPage , PageNumber pp) {
		// TODO Auto-generated method stub
		return jobDao.searchJobList(currentPage, sqlSession,pp);
	}
	@Override
	public ArrayList<Job> selectJobaddr(int currentPage , String addr) {
		// TODO Auto-generated method stub
		return jobDao.selectJobaddr(currentPage, sqlSession,addr);
	}

	@Override
	public int insertJobMake(Job job) {
		// TODO Auto-generated method stub
		return jobDao.insertJobMake(sqlSession, job);
	}

	@Override
	public Job jobDeatil(int job_no) {
		// TODO Auto-generated method stub
		return jobDao.jobDeatil(sqlSession, job_no);
	}

}
