package com.kh.farm.qna.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.farm.market.model.vo.Market;
import com.kh.farm.qna.model.dao.QnaDao;
import com.kh.farm.qna.model.vo.Market_qna;

@Service
public class QnaServiceImpl implements QnaService{
	@Autowired private QnaDao qnaDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Override
	public ArrayList<Market_qna> selectQnaList(Market mk, int currentPage) {
		// TODO Auto-generated method stub
		return qnaDao.qnaList(sqlSession,mk,currentPage);
	}
	@Override
	public int selectQnaCount(Market mk) {
		// TODO Auto-generated method stub
		return qnaDao.selectQnaCount(sqlSession,mk);
	}
}
