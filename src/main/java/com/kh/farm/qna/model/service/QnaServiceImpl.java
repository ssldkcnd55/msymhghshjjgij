package com.kh.farm.qna.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.farm.qna.model.dao.QnaDao;

@Service
public class QnaServiceImpl implements QnaService{
	@Autowired private QnaDao qnaDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
}
