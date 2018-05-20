package com.kh.farm.auction.model.service;

import com.kh.farm.auction.model.vo.Auction;
import com.kh.farm.member.model.vo.Member;

public interface AuctionService {
	
	/*경매 등록*/
	int insertAuctionMake(Auction auction);
}
