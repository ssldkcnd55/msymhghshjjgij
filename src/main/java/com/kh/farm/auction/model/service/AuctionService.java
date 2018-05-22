package com.kh.farm.auction.model.service;



import java.util.List;

import com.kh.farm.auction.model.vo.Auction;
import com.kh.farm.member.model.vo.Member;

public interface AuctionService {
	
	/*경매 등록*/
	int insertAuctionMake(Auction auction);

	/*경매 메인 */
	List<Auction> selectAuctionList();
	
	/*경매 디테일*/
	Auction selectAuctionDetail(int auction_no);
}
