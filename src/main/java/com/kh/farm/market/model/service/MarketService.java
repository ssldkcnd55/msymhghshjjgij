package com.kh.farm.market.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

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

public interface MarketService {

	ArrayList<Market> selectMarketList(int page,String search,String ctype,String cname,String sort);
	
	
	Market selectMarketInfo(int market_no);

	ArrayList<Review> selectReviewList(Market mk, int currentPage, String reviewSearch);

	int selectReviewCount(Market mk, String reviewSearch);
	int insertMarket(Market market);

	int insertMarket_qna(Market_qna qna);

	int insertReview(Review rv);

	ArrayList<Daily> selectDailyList(Market market);

	int insertMarket_daily(Daily daily);

	ArrayList<Market> selectHomeNewMarketList();

	ArrayList<Market> selectHomePopularMarketList();


	Review selectReviewDetail(int review_no);

	Daily selectDailyDetail(int daily_no);

	Market selectSearchList(String search);
	ArrayList<Reply> selectReviewReply(int review_no,int currentPage);

	int selectReviewReplyCount(int review_no);

	ArrayList<UnderReply> selectReviewUnderReply(HashMap<String, ArrayList<Integer>> map) throws DeleteFailException;

	ArrayList<Reply> selectDailyReply(int daily_no, int currentPage);

	int selectDailyReplyCount(int daily_no);

	ArrayList<UnderReply> selectDailyUnderReply(HashMap<String, ArrayList<Integer>> map) throws DeleteFailException;

	int insertReply(Reply reply);

	int insertUnderReply(UnderReply reply);

	int deleteReply(Reply reply) throws DeleteFailException;

	int deleteUnderReply(UnderReply reply);

	int updateReplyNull(Reply reply);

	int updateReviewReply(Reply reply);

	int updateDailyReply(Reply reply);

	int updateReviewUnderReply(UnderReply reply);


	int updateDaily(Daily daily);


	int updateReview(Review review);


	int deleteReview(Review review);


	int deleteDaily(Daily daily);


	ArrayList<Category> selectCategory(String ctype);

	ArrayList<Market> selectCusMarketThree();


	List<Market> selectSellerMarketList(String member_id,int market_no);


	int selectSellerMarketCount(String member_id,int market_no);


	List<Category> selectCategoryList();


	List<Category> selectCategoryNameList(String category_main);
	
	ArrayList<Market> selectSellerMarketHistory(int currentPage,PageNumber pa);

	int selectSellerMarketHistoryCount();


	int updateMarketDel(int market_no);


	int updateMarket(Market market);
	
}
