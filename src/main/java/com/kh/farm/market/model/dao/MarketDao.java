package com.kh.farm.market.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.farm.common.model.vo.PageNumber;
import com.kh.farm.market.model.vo.Market;

@Repository
public class MarketDao {

	public ArrayList<Market> marketList(int page,SqlSessionTemplate sqlSession) {
		PageNumber pn = new PageNumber();
		pn.setStartRow(page * 9 -8);
		pn.setEndRow(pn.getStartRow() + 8);
		List<Market> list = sqlSession.selectList("market.marketList",pn);
		return (ArrayList)list;
	}
}