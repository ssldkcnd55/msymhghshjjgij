package com.kh.farm.notice.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.farm.notice.model.dao.NoticeDao;

@Service
public class NoticeServiceImpl implements NoticeService{
	@Autowired private NoticeDao noticeDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
}
