package com.kh.farm.job.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.farm.job.model.dao.JobDao;

@Service
public class JobServiceImpl implements JobService{
@Autowired private JobDao jboDao;
@Autowired
private SqlSessionTemplate sqlSession;
}
