package com.kh.farm.job.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.farm.job.model.dao.JobDao;
import com.kh.farm.job.model.vo.Job;

@Service
public class JobServiceImpl implements JobService{
@Autowired private JobDao jobDao;
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
	return jobDao.selectJobList(currentPage,sqlSession);
}
}
