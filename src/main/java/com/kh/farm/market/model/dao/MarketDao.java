package com.kh.farm.market.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.eclipse.jdt.internal.compiler.flow.InsideSubRoutineFlowContext;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.farm.common.model.vo.PageNumber;
import com.kh.farm.market.exception.DeleteFailException;
import com.kh.farm.market.model.vo.Category;
import com.kh.farm.market.model.vo.Daily;
import com.kh.farm.market.model.vo.Market;
import com.kh.farm.market.model.vo.Reply;
import com.kh.farm.market.model.vo.Review;
import com.kh.farm.market.model.vo.UnderReply;
import com.kh.farm.payment.model.vo.Payment;
import com.kh.farm.qna.model.vo.Market_qna;

@Repository
public class MarketDao {

	public ArrayList<Market> marketList(int page,SqlSessionTemplate sqlSession,String search,String ctype,String cname,String sort) {
		PageNumber pn = new PageNumber();
		pn.setStartRow(page * 9 -8);
		pn.setEndRow(pn.getStartRow() + 8);
		pn.setSearch(search);
		System.out.println(sort);
		if(ctype != null && ctype != "")
			pn.setCtype(ctype);
		if(cname != null && cname != "")
			pn.setCname(cname);
		if(sort != null && sort != "")
			pn.setSort(sort);
		List<Market> list = sqlSession.selectList("market.marketList",pn);
		return (ArrayList)list;
	}

	public Market marketInfo(SqlSessionTemplate sqlSession, int market_no) {
		Market mk = sqlSession.selectOne("market.marketInfo",market_no);
		return mk;
	}

	public ArrayList<Review> reviewList(SqlSessionTemplate sqlSession, Market mk, int currentPage, String reviewSearch) {
		int startRow = (currentPage-1)*10+1; 
		int endRow = startRow+9;
		PageNumber pnum = new PageNumber();
		pnum.setStartRow(startRow);
		pnum.setEndRow(endRow);
		pnum.setMarket_no(mk.getMarket_no());
		pnum.setReviewSearch(reviewSearch);
		List<Review> list =sqlSession.selectList("market.reviewList",pnum);
		return (ArrayList<Review>)list;
	}

	public int reviewListCount(SqlSessionTemplate sqlSession, Market mk, String reviewSearch) {
		// TODO Auto-generated method stub
		PageNumber pnum = new PageNumber();
		pnum.setMarket_no(mk.getMarket_no());
		pnum.setReviewSearch(reviewSearch);
		int listCount = sqlSession.selectOne("market.reviewCount",pnum);
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
			HashMap<String, ArrayList<Integer>> map) throws DeleteFailException{
		// TODO Auto-generated method stub
		List<UnderReply> list = new ArrayList<UnderReply>();
		try {
			list = sqlSession.selectList("market.reviewUnderReply", map);
		}catch(Exception e) {
			throw new DeleteFailException("댓글이 존재하지않습니다.");
		}
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
			HashMap<String, ArrayList<Integer>> map) throws DeleteFailException{
		// TODO Auto-generated method stub
		List<UnderReply> list = new ArrayList<UnderReply>();
		try {
			list = sqlSession.selectList("market.dailyUnderReply", map);
		}catch(Exception e) {
			throw new DeleteFailException("댓글이 존재하지않습니다.");
		}
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
		int deleteReply = 0;
		try {
			deleteReply = sqlSession.delete("market.deleteReply", reply);
		}catch(Exception e) {
			throw new DeleteFailException("답글이 있는 댓글은 삭제되지않습니다.");
		}
		return deleteReply;
	}

	public int deleteUnderReply(SqlSessionTemplate sqlSession, UnderReply reply) {
		// TODO Auto-generated method stub
		return sqlSession.delete("market.deleteUnderReply", reply);
	}

	public int updateReplyNull(SqlSessionTemplate sqlSession, Reply reply) {
		// TODO Auto-generated method stub
		return sqlSession.update("market.updateReplyNull", reply);
	}

	public int updateDailyReply(SqlSessionTemplate sqlSession, Reply reply) {
		// TODO Auto-generated method stub
		return sqlSession.update("market.updateReply",reply);
	}

	public int updateReviewReply(SqlSessionTemplate sqlSession, Reply reply) {
		// TODO Auto-generated method stub
		return sqlSession.update("market.updateReply",reply);
	}

	public int updateUnderReply(SqlSessionTemplate sqlSession, UnderReply reply) {
		// TODO Auto-generated method stub
		return sqlSession.update("market.updateUnderReply",reply);
	}

	public int updateReview(SqlSessionTemplate sqlSession, Review review) {
		// TODO Auto-generated method stub
		return sqlSession.update("market.updateReview",review);
	}

	public int updateDaily(SqlSessionTemplate sqlSession, Daily daily) {
		// TODO Auto-generated method stub
		return sqlSession.update("market.updateDaily",daily);
	}

	public int deleteReview(SqlSessionTemplate sqlSession, Review review) {
		// TODO Auto-generated method stub
		return sqlSession.delete("market.deleteReview",review);
	}

	public int deleteDaily(SqlSessionTemplate sqlSession, Daily daily) {
		// TODO Auto-generated method stub
		return sqlSession.delete("market.deleteDaily",daily);
	}

	public ArrayList<Category> selectCategory(SqlSessionTemplate sqlSession, String ctype) {
		// TODO Auto-generated method stub
		List<Category> list = sqlSession.selectList("market.selectCategory",ctype);
		return (ArrayList<Category>)list;
	}
	public ArrayList<Market> selectCusMarketThree(SqlSessionTemplate sqlSession) {
		List<Market> ac = sqlSession.selectList("market.selectCusMarketThree");
		return (ArrayList)ac;
	}

	public List<Market> selectSellerMarketList(SqlSessionTemplate sqlSession, String member_id,int market_no) {
		// TODO Auto-generated method stub
		PageNumber pn = new PageNumber();
		pn.setMember_id(member_id);
		pn.setMarket_no(market_no);
		List<Market> list = sqlSession.selectList("market.selectSellerMarketList",pn);
		return list;
	}

	public int selectSellerMarketCount(SqlSessionTemplate sqlSession, String member_id,int market_no) {
		// TODO Auto-generated method stub
		PageNumber pn = new PageNumber();
		pn.setMember_id(member_id);
		pn.setMarket_no(market_no);
		return sqlSession.selectOne("market.selectSellerMarketCount",pn);
	}

	public List<Category> selectCategoryList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("market.selectCategoryList");
	}

	public List<Category> selectCategoryNameList(SqlSessionTemplate sqlSession,String category_main) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("market.selectCategoryNameList",category_main);
	}
	public ArrayList<Market> selectSellerMarketHistory(SqlSessionTemplate sqlSession, int currentPage, PageNumber pa) {
		// TODO Auto-generated method stub
		int startRow =(currentPage-1)*10+1; //1~10, 11~20 계산할 거 ex) 1, 11, 21, 31,)
		int endRow = startRow+9;
		PageNumber pnum = new PageNumber();
		pnum.setStartRow(startRow);
		pnum.setEndRow(endRow);
		pnum.setMember_id(pa.getMember_id());
		List<Market> ac = sqlSession.selectList("market.selectSellerMarketHistory",pnum);
		return (ArrayList)ac;
	}

	public int selectSellerMarketHistoryCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		int listCount = sqlSession.selectOne("market.selectSellerMarketHistoryCount");
		return listCount;
	}

	public int updateMarketDel(SqlSessionTemplate sqlSession, int market_no) {
		// TODO Auto-generated method stub
		return sqlSession.update("market.updateMarketDel", market_no);
	}

	public int updateMarket(SqlSessionTemplate sqlSession, Market market) {
		// TODO Auto-generated method stub
		return sqlSession.update("market.updateMarket", market);
	}
}