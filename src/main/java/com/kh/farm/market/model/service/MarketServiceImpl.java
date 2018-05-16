package com.kh.farm.market.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.farm.market.model.dao.MarketDao;
import com.kh.farm.market.model.vo.Market;

@Service
public class MarketServiceImpl implements MarketService{
	@Autowired private MarketDao marketDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Override
	public ArrayList<Market> marketList() {
		return marketDao.marketList(sqlSession);
	}
}
