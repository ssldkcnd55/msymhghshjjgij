package com.kh.farm.auction.model.service;



import java.util.List;

import com.kh.farm.auction.model.vo.Auction;
import com.kh.farm.member.model.vo.Member;

public interface AuctionService {
	
	/*경매 등록*/
	int insertAuctionMake(Auction auction);

	/*경매 메인 */
	List<Auction> selectAuctionList(int page);
	
	/*경매 디테일*/
	Auction selectAuctionDetail(int auction_no);

	Auction deleteAuction(int auction_no);

	Auction selectModifyAuction(int auction_no);
}
