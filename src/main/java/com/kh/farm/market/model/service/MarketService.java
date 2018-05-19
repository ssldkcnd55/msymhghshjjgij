package com.kh.farm.market.model.service;

import java.util.ArrayList;

import com.kh.farm.market.model.vo.Market;

public interface MarketService {

	ArrayList<Market> marketList();

	Market selectMarketInfo(int market_no);

}
