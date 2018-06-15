package com.kh.farm.qna.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.farm.market.model.vo.Market;
import com.kh.farm.qna.model.dao.QnaDao;
import com.kh.farm.qna.model.vo.MainQna;
import com.kh.farm.qna.model.vo.Market_qna;

@Service
public class QnaServiceImpl implements QnaService{
	@Autowired private QnaDao qnaDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Override
	public ArrayList<Market_qna> selectQnaList(Market mk, int currentPage,String qnaSearch) {
		// TODO Auto-generated method stub
		return qnaDao.qnaList(sqlSession,mk,currentPage,qnaSearch);
	}
	@Override
	public int selectQnaCount(Market mk,String qnaSearch) {
		// TODO Auto-generated method stub
		return qnaDao.selectQnaCount(sqlSession,mk,qnaSearch);
	}
	@Override
	public Market_qna selectQna(int qna_no) {
		// TODO Auto-generated method stub
		return qnaDao.selectQna(sqlSession, qna_no);
	}
	@Override
	public ArrayList<MainQna> selectMainQnaList(int currentPage,String qnaSearch) {
		// TODO Auto-generated method stub
		return qnaDao.mainQnaList(sqlSession,currentPage,qnaSearch);
	}
	@Override
	public int selectMainQnaCount(String qnaSearch) {
		// TODO Auto-generated method stub
		return qnaDao.selectMainQnaCount(sqlSession,qnaSearch);
	}
	@Override
	public MainQna selectMainQnaDetail(int qna_no) {
		// TODO Auto-generated method stub
		return qnaDao.selectMainQnaDetail(sqlSession,qna_no);
	}
	@Override
	public int updateAnswer(MainQna mq) {
		// TODO Auto-generated method stub
		return qnaDao.updateAnswer(sqlSession,mq);
	}
	@Override
	public int deleteQnaAnswer(int qanswer_no) {
		// TODO Auto-generated method stub
		return qnaDao.deleteQnaAnswer(sqlSession,qanswer_no);
	}
	@Override
	public int insertMainQna(MainQna mq) {
		// TODO Auto-generated method stub
		return qnaDao.insertMainQna(sqlSession,mq);
	}
	@Override
	public int updateMainQna(MainQna mq) {
		// TODO Auto-generated method stub
		return qnaDao.updateMainQna(sqlSession,mq);
	}
	@Override
	public int updateMarketAnswer(Market_qna mq) {
		// TODO Auto-generated method stub
		return qnaDao.updateMarketAnswer(sqlSession,mq);
	}
	@Override
	public int deleteMarketQnaAnswer(int qanswer_no) {
		// TODO Auto-generated method stub
		return qnaDao.deleteMarketQnaAnswer(sqlSession,qanswer_no);
	}
	@Override
	public int updateMarketQna(Market_qna mq) {
		// TODO Auto-generated method stub
		return qnaDao.updateMarketQna(sqlSession,mq);
	}
	@Override
	public int deleteMarketQna(int market_qna_no) {
		// TODO Auto-generated method stub
		return qnaDao.deleteMarketQna(sqlSession,market_qna_no);
	}
	@Override
	public int deleteMainQna(int main_qna_no) {
		// TODO Auto-generated method stub
		return qnaDao.deleteMainQna(sqlSession,main_qna_no);
	}
	@Override
	public ArrayList<Market_qna> selectCusQnaList(int currentPage) {
		// TODO Auto-generated method stub
		return qnaDao.selectCusQnaList(sqlSession,currentPage);
	}
	@Override
	public int selectCusQnaListCount() {
		// TODO Auto-generated method stub
		return qnaDao.selectCusQnaListCount(sqlSession);
	}
}
