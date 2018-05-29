package com.kh.farm.market.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.eclipse.jdt.internal.compiler.flow.InsideSubRoutineFlowContext;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.farm.common.model.vo.PageNumber;
import com.kh.farm.market.exception.DeleteFailException;
import com.kh.farm.market.model.vo.Daily;
import com.kh.farm.market.model.vo.Market;
import com.kh.farm.market.model.vo.Reply;
import com.kh.farm.market.model.vo.Review;
import com.kh.farm.market.model.vo.UnderReply;
import com.kh.farm.qna.model.vo.Market_qna;

@Repository
public class MarketDao {

	public ArrayList<Market> marketList(int page,SqlSessionTemplate sqlSession,String search) {
		PageNumber pn = new PageNumber();
		pn.setStartRow(page * 9 -8);
		pn.setEndRow(pn.getStartRow() + 8);
		pn.setSearch(search);
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
	
	public int insertMarket(SqlSessionTemplate sqlSession, Market market) {
		int insertMarket = sqlSession.insert("market.insertMarket", market);
		return insertMarket;
	}

	public int insertMarket_qna(SqlSessionTemplate sqlSession, Market_qna qna) {
		// TODO Auto-generated method stub
		int insertMarket_qna = sqlSession.insert("market.insertMarket_qna",qna);
		return insertMarket_qna;
	}



	public int insertReview(SqlSessionTemplate sqlSession, Review rv) {
		int insertReview = sqlSession.insert("market.insertReview",rv);
		return insertReview;
	}

	public ArrayList<Daily> selectDailyList(SqlSessionTemplate sqlSession, Market market) {
		// TODO Auto-generated method stub
		List<Daily> list =sqlSession.selectList("market.dailyList",market.getMarket_no());
		return (ArrayList<Daily>)list;
	}

	public int insertMarket_daily(SqlSessionTemplate sqlSession, Daily daily) {
		// TODO Auto-generated method stub
		return sqlSession.insert("market.insertMarketDaily",daily);
	}

	public ArrayList<Market> selectHomeNewMarketList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		List<Market> list =sqlSession.selectList("market.selectHomeNewMarketList");
		return (ArrayList<Market>)list;
	}

	public ArrayList<Market> selectHomePopularMarketList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		List<Market> list = sqlSession.selectList("market.selectHomePopularMarketList");
		return (ArrayList<Market>)list;
	}

	public Review selectReviewDetail(SqlSessionTemplate sqlSession, int review_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("market.reviewDetail", review_no);
	}

	public Daily selectDailyDetail(SqlSessionTemplate sqlSession, int daily_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("market.dailyDetail", daily_no);
	}

<<<<<<< HEAD
	
=======
	public ArrayList<Reply> selectReviewReply(SqlSessionTemplate sqlSession, int review_no,int currentPage) {
		// TODO Auto-generated method stub
		int startRow = (currentPage-1)*10+1; 
		int endRow = startRow+9;
		PageNumber pnum = new PageNumber();
		pnum.setStartRow(startRow);
		pnum.setEndRow(endRow);
		pnum.setReview_no(review_no);
		List<Reply> list = sqlSession.selectList("market.reviewReply", pnum);
		return (ArrayList<Reply>)list;
	}

	public int selectReviewReplyCount(SqlSessionTemplate sqlSession, int review_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("market.reviewReplyCount", review_no);
	}

	public ArrayList<UnderReply> selectReviewUnderReply(SqlSessionTemplate sqlSession,
			HashMap<String, ArrayList<Integer>> map) {
		// TODO Auto-generated method stub
		List<UnderReply> list = sqlSession.selectList("market.reviewUnderReply", map);
		return (ArrayList<UnderReply>)list;
	}

	public ArrayList<Reply> selectDailyReply(SqlSessionTemplate sqlSession, int daily_no, int currentPage) {
		int startRow = (currentPage-1)*10+1; 
		int endRow = startRow+9;
		PageNumber pnum = new PageNumber();
		pnum.setStartRow(startRow);
		pnum.setEndRow(endRow);
		pnum.setDaily_no(daily_no);
		List<Reply> list = sqlSession.selectList("market.dailyReply", pnum);
		return (ArrayList<Reply>)list;
	}

	public int selectDailyReplyCount(SqlSessionTemplate sqlSession, int daily_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("market.dailyReplyCount", daily_no);
	}

	public ArrayList<UnderReply> selectDailyUnderReply(SqlSessionTemplate sqlSession,
			HashMap<String, ArrayList<Integer>> map) {
		// TODO Auto-generated method stub
		List<UnderReply> list = sqlSession.selectList("market.dailyUnderReply", map);
		return (ArrayList<UnderReply>)list;
	}

	public int insertReviewReply(SqlSessionTemplate sqlSession, Reply reply) {
		// TODO Auto-generated method stub
		return sqlSession.insert("market.insertReviewReply", reply);
	}

	public int insertUnderReply(SqlSessionTemplate sqlSession, UnderReply reply) {
		// TODO Auto-generated method stub
		return sqlSession.insert("market.insertUnderReply", reply);
	}

	public int deleteReply(SqlSessionTemplate sqlSession, Reply reply) throws DeleteFailException{
		// TODO Auto-generated method stub
		int deleteReply = sqlSession.delete("market.deleteReply", reply);
		if(deleteReply > 0 ) {
			return deleteReply;
		}else {
			throw new DeleteFailException("답글이 있는 댓글은 삭제되지않습니다.");
		}
	}

	public int deleteUnderReply(SqlSessionTemplate sqlSession, UnderReply reply) {
		// TODO Auto-generated method stub
		return sqlSession.delete("market.deleteUnderReply", reply);
	}

	public int updateReplyNull(SqlSessionTemplate sqlSession, Reply reply) {
		// TODO Auto-generated method stub
		return sqlSession.update("market.updateReplyNull", reply);
	}
>>>>>>> branch 'master' of https://github.com/ssldkcnd55/msymhghshjjgij
}