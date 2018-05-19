package com.kh.farm.qna.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.farm.market.model.vo.Market;
import com.kh.farm.qna.model.vo.Market_qna;

@Repository
public class QnaDao {

	public ArrayList<Market_qna> qnaList(SqlSessionTemplate sqlSession, Market mk,int currentPage) {
		// TODO Auto-generated method stub
		List<Market_qna> sq = sqlSession.selectList("qna.qnaList",mk.getMarket_no());
		return (ArrayList)sq;
	}

	public int selectQnaCount(SqlSessionTemplate sqlSession, Market mk) {
		
		int listCount = sqlSession.selectOne("qna.qnaCount",mk.getMarket_no());
		return listCount;
	}

}
