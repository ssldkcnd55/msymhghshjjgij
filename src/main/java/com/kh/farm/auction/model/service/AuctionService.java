package com.kh.farm.auction.model.service;



import java.util.ArrayList;
import java.util.List;

import com.kh.farm.auction.model.vo.Auction;
import com.kh.farm.auction.model.vo.AuctionQnA;
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

	/*경매 수정 등록*/
	int updateAuctionMake(Auction auction);

	/*경매 QnA 등록 버튼*/
	int insertAuctionQnAMake(AuctionQnA auctionqna);

	/*경매 QnA List*/
	ArrayList<AuctionQnA> selectAuctionQnAList(Auction auction, int currentPage);

	int selectAuctionQnACount(Auction auction);

	AuctionQnA selectAuctionQnADetail(int auction_qna_no);

	AuctionQnA selectshowAuctionQnAModify(int auction_qna_no);

	int updateAuctionQnA(AuctionQnA auctionqna);
}
