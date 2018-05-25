package com.kh.farm.market.model.service;

import java.util.ArrayList;

import com.kh.farm.market.model.vo.Daily;
import com.kh.farm.market.model.vo.Market;
import com.kh.farm.market.model.vo.Review;
import com.kh.farm.qna.model.vo.Market_qna;

public interface MarketService {

	ArrayList<Market> selectMarketList(int page);

	Market selectMarketInfo(int market_no);

	ArrayList<Review> selectReviewList(Market mk, int currentPage);

	int selectReviewCount(Market mk);
	int insertMarket(Market market);

	int insertMarket_qna(Market_qna qna);

	int insertReview(Review rv);

	ArrayList<Daily> selectDailyList(Market market);

}
