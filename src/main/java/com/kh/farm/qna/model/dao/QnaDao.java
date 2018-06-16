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
	
	public ArrayList<Market_qna> selectCusQnaList(SqlSessionTemplate sqlSession, int currentPage) {
		// TODO Auto-generated method stub
		int startRow =(currentPage-1)*10+1; //1~10, 11~20 계산할 거 ex) 1, 11, 21, 31,)
		int endRow = startRow+9;
		PageNumber pnum = new PageNumber();
		pnum.setStartRow(startRow);
		pnum.setEndRow(endRow);
		List<Market_qna> ac = sqlSession.selectList("qna.selectCusQnaList",pnum);
		return (ArrayList)ac;
	}

	public int selectCusQnaListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		int listCount = sqlSession.selectOne("qna.selectCusQnaListCount");
		return listCount;
	}

	public ArrayList<Market_qna> qnaList(SqlSessionTemplate sqlSession, Market mk,int currentPage,String qnaSearch) {
		// TODO Auto-generated method stub
		int startRow =(currentPage-1)*10+1; //1~10, 11~20 계산할 거 ex) 1, 11, 21, 31,)
		int endRow = startRow+9;
		PageNumber pnum = new PageNumber();
		pnum.setStartRow(startRow);
		pnum.setEndRow(endRow);
		pnum.setMarket_no(mk.getMarket_no());
		pnum.setQnaSearch(qnaSearch);
		
		List<Market_qna> sq = sqlSession.selectList("qna.qnaList",pnum);
		return (ArrayList)sq;
	}

	public int selectQnaCount(SqlSessionTemplate sqlSession, Market mk,String qnaSearch) {
		PageNumber pnum = new PageNumber();
		pnum.setMarket_no(mk.getMarket_no());
		pnum.setQnaSearch(qnaSearch);
		
		int listCount = sqlSession.selectOne("qna.qnaCount",pnum);
		return listCount;
	}

	public Market_qna selectQna(SqlSessionTemplate sqlSession, int qna_no) {
		Market_qna qna = sqlSession.selectOne("qna.selectQna",qna_no);
		return qna;
	}

	public ArrayList<MainQna> mainQnaList(SqlSessionTemplate sqlSession, int currentPage, String qnaSearch) {
		// TODO Auto-generated method stub
		int startRow =(currentPage-1)*10+1; //1~10, 11~20 계산할 거 ex) 1, 11, 21, 31,)
		int endRow = startRow+9;
		PageNumber pnum = new PageNumber();
		pnum.setStartRow(startRow);
		pnum.setEndRow(endRow);
		pnum.setQnaSearch(qnaSearch);
		System.out.println(qnaSearch);
		List<MainQna> sq = sqlSession.selectList("qna.mainQnaList",pnum);
		return (ArrayList)sq;
	}

	public int selectMainQnaCount(SqlSessionTemplate sqlSession, String qnaSearch) {
		// TODO Auto-generated method stub
		PageNumber pnum = new PageNumber();
		pnum.setQnaSearch(qnaSearch);
		int listCount = sqlSession.selectOne("qna.mainQnaCount",pnum);
		return listCount;
	}

	public MainQna selectMainQnaDetail(SqlSessionTemplate sqlSession, int main_qna_no) {
		// TODO Auto-generated method stub
		
		MainQna mq = sqlSession.selectOne("qna.mainQnaDetail",main_qna_no);
		return mq;
	}

	public int updateAnswer(SqlSessionTemplate sqlSession, MainQna mq) {
		// TODO Auto-generated method stub
		int result = sqlSession.update("qna.updateAnswer",mq);
		return result;
	}

	public int deleteQnaAnswer(SqlSessionTemplate sqlSession, int qanswer_no) {
		
		int result = sqlSession.update("qna.deleteQnaAnswer",qanswer_no);
		return result;
	}

	public int insertMainQna(SqlSessionTemplate sqlSession, MainQna mq) {
		// TODO Auto-generated method stub
	
		int result = sqlSession.insert("qna.insertMainQna",mq);
		
		return result;
	}

	public int updateMainQna(SqlSessionTemplate sqlSession, MainQna mq) {
		// TODO Auto-generated method stub
		int result = sqlSession.update("qna.updateMainQna",mq);
		return result;
	}

	public int updateMarketAnswer(SqlSessionTemplate sqlSession, Market_qna mq) {
		// TODO Auto-generated method stub
		return sqlSession.update("qna.updateMarketAnswer",mq);
	}

	public int deleteMarketQnaAnswer(SqlSessionTemplate sqlSession, int qanswer_no) {
		// TODO Auto-generated method stub
		return sqlSession.update("qna.deleteMarketQnaAnswer",qanswer_no);
	}

	public int updateMarketQna(SqlSessionTemplate sqlSession, Market_qna mq) {
		// TODO Auto-generated method stub
		return sqlSession.update("qna.updateMarketQna",mq);
	}

	public int deleteMarketQna(SqlSessionTemplate sqlSession, int market_qna_no) {
		// TODO Auto-generated method stub
		return sqlSession.delete("qna.deleteMarketQna",market_qna_no);
	}

	public int deleteMainQna(SqlSessionTemplate sqlSession, int main_qna_no) {
		// TODO Auto-generated method stub
		return sqlSession.delete("qna.deleteMainQna",main_qna_no);
	}

}
