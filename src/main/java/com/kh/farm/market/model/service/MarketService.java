package com.kh.farm.market.model.service;

import java.util.ArrayList;

import com.kh.farm.market.model.vo.Market;
import com.kh.farm.market.model.vo.Review;

public interface MarketService {

	ArrayList<Market> marketList(int page);

	Market selectMarketInfo(int market_no);

	ArrayList<Review> selectReviewList(Market mk, int currentPage);

	int selectReviewCount(Market mk);

}
