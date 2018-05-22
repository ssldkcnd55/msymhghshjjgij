package com.kh.farm.market.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.farm.common.model.vo.PageNumber;
import com.kh.farm.market.model.vo.Market;
import com.kh.farm.market.model.vo.Review;

@Repository
public class MarketDao {

	public ArrayList<Market> marketList(int page,SqlSessionTemplate sqlSession) {
		PageNumber pn = new PageNumber();
		pn.setStartRow(page * 9 -8);
		pn.setEndRow(pn.getStartRow() + 8);
		List<Market> list = sqlSession.selectList("market.marketList",pn);
		return (ArrayList)list;
	}

	public Market marketInfo(SqlSessionTemplate sqlSession, int market_no) {
		Market mk = sqlSession.selectOne("market.marketInfo",market_no);
		
		return mk;
	}

	public ArrayList<Review> reviewList(SqlSessionTemplate sqlSession, Market mk, int currentPage) {
		int startRow = (currentPage-1)*10+1; 
		int endRow = startRow+9;
		PageNumber pnum = new PageNumber();
		pnum.setStartRow(startRow);
		pnum.setEndRow(endRow);
		pnum.setMarket_no(mk.getMarket_no());
		List<Review> list =sqlSession.selectList("market.reviewList",pnum);
		return (ArrayList<Review>)list;
	}

	public int reviewListCount(SqlSessionTemplate sqlSession, Market mk) {
		// TODO Auto-generated method stub
		int listCount = sqlSession.selectOne("market.reviewCount",mk.getMarket_no());
		return listCount;
	}
}