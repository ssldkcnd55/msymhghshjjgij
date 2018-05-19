package com.kh.farm.market.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.farm.market.model.vo.Market;

@Repository
public class MarketDao {

	public ArrayList<Market> marketList(SqlSessionTemplate sqlSession) {
		List<Market> list = sqlSession.selectList("market.marketList");
		return (ArrayList)list;
	}

	public Market marketInfo(SqlSessionTemplate sqlSession, int market_no) {
		Market mk = sqlSession.selectOne("market.marketInfo",market_no);
		
		return mk;
	}
}