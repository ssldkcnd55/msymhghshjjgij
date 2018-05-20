package com.kh.farm.market.model.service;

import java.util.ArrayList;

import com.kh.farm.market.model.vo.Market;

public interface MarketService {

	ArrayList<Market> selectMarketList(int page);

	Market selectMarketInfo(int market_no);

	int insertMarket(Market market);

}
