package com.kh.farm.market.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.farm.common.model.vo.*;
import com.kh.farm.market.model.dao.MarketDao;
import com.kh.farm.market.model.vo.Market;

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
	public int insertMarket(Market market) {
		// TODO Auto-generated method stub
		return marketDao.insertMarket(sqlSession,market);
	}
}
