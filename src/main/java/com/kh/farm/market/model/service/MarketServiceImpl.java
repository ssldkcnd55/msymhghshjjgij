package com.kh.farm.market.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.farm.common.model.vo.*;
import com.kh.farm.market.model.dao.MarketDao;
import com.kh.farm.market.model.vo.Daily;
import com.kh.farm.market.model.vo.Market;
import com.kh.farm.market.model.vo.Review;
import com.kh.farm.qna.model.vo.Market_qna;

@Service
public class MarketServiceImpl implements MarketService{
	@Autowired private MarketDao marketDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Override
	public ArrayList<Market> selectMarketList(int page) {
		return marketDao.marketList(page,sqlSession);
	}
	@Override
	public Market selectMarketInfo(int market_no) {
		// TODO Auto-generated method stub
		return marketDao.marketInfo(sqlSession,market_no);
	}
	@Override
	public ArrayList<Review> selectReviewList(Market mk, int currentPage) {
		// TODO Auto-generated method stub
		return marketDao.reviewList(sqlSession,mk,currentPage);
	}
	@Override
	public int selectReviewCount(Market mk) {
		// TODO Auto-generated method stub
		return marketDao.reviewListCount(sqlSession,mk);
	}
	public int insertMarket(Market market) {
		// TODO Auto-generated method stub
		return marketDao.insertMarket(sqlSession,market);
	}
	@Override
	public int insertMarket_qna(Market_qna qna) {
		// TODO Auto-generated method stub
		return marketDao.insertMarket_qna(sqlSession,qna);
	}
	@Override
	public int insertReview(Review rv) {
		// TODO Auto-generated method stub
		return marketDao.insertReview(sqlSession,rv);
	}
	@Override
	public ArrayList<Daily> selectDailyList(Market market) {
		// TODO Auto-generated method stub
		return marketDao.selectDailyList(sqlSession,market);
	}
	@Override
	public int insertMarket_daily(Daily daily) {
		// TODO Auto-generated method stub
		return marketDao.insertMarket_daily(sqlSession,daily);
	}
}
