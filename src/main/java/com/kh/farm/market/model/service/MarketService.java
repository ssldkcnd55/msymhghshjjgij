package com.kh.farm.market.model.service;

import java.util.ArrayList;

import com.kh.farm.market.model.vo.Market;

public interface MarketService {

	ArrayList<Market> marketList(int page);

	Market selectMarketInfo(int market_no);

}
