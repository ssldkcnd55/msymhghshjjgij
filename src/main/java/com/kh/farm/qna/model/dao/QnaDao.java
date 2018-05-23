package com.kh.farm.qna.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.farm.common.model.vo.PageNumber;
import com.kh.farm.market.model.vo.Market;
import com.kh.farm.qna.model.vo.MainQna;
import com.kh.farm.qna.model.vo.Market_qna;

@Repository
public class QnaDao {

	public ArrayList<Market_qna> qnaList(SqlSessionTemplate sqlSession, Market mk,int currentPage) {
		// TODO Auto-generated method stub
		int startRow =(currentPage-1)*10+1; //1~10, 11~20 계산할 거 ex) 1, 11, 21, 31,)
		int endRow = startRow+9;
		PageNumber pnum = new PageNumber();
		pnum.setStartRow(startRow);
		pnum.setEndRow(endRow);
		pnum.setMarket_no(mk.getMarket_no());
		
		List<Market_qna> sq = sqlSession.selectList("qna.qnaList",pnum);
		return (ArrayList)sq;
	}

	public int selectQnaCount(SqlSessionTemplate sqlSession, Market mk) {
		
		int listCount = sqlSession.selectOne("qna.qnaCount",mk.getMarket_no());
		return listCount;
	}

	public Market_qna selectQna(SqlSessionTemplate sqlSession, int qna_no) {
		Market_qna qna = sqlSession.selectOne("qna.selectQna",qna_no);
		return qna;
	}

	public ArrayList<MainQna> mainQnaList(SqlSessionTemplate sqlSession, int currentPage) {
		// TODO Auto-generated method stub
		int startRow =(currentPage-1)*10+1; //1~10, 11~20 계산할 거 ex) 1, 11, 21, 31,)
		int endRow = startRow+9;
		PageNumber pnum = new PageNumber();
		pnum.setStartRow(startRow);
		pnum.setEndRow(endRow);
		List<MainQna> sq = sqlSession.selectList("qna.mainQnaList",pnum);
		return (ArrayList)sq;
	}

	public int selectMainQnaCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		int listCount = sqlSession.selectOne("qna.mainQnaCount");
		return listCount;
	}

}
