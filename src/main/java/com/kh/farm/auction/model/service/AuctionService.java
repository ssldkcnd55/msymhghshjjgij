package com.kh.farm.auction.model.service;

import com.kh.farm.auction.model.vo.Auction;

public interface AuctionService {
	
	/*경매 등록*/
	int insertAuctionMake(Auction auction);
}
