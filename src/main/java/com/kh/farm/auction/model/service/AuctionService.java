package com.kh.farm.auction.model.service;



import java.util.ArrayList;
import java.util.List;

import com.kh.farm.auction.model.vo.Auction;
import com.kh.farm.auction.model.vo.AuctionHistory;
import com.kh.farm.auction.model.vo.AuctionQnA;
import com.kh.farm.member.model.vo.Member;
import com.kh.farm.notice.model.vo.Notice;

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

	int updateauctionQnA_Answer(AuctionQnA auctionqna);

	ArrayList<Auction> selectHomeAuctionList();

	int updateSellerAuctionQnAanswer(AuctionQnA auctionqna);

	AuctionQnA selectseller_QnAanswer(int auction_qna_no);

	int delete_auction_qna_answer(int auction_qna_no);
	
	int insertAuctionBidding(AuctionHistory auctionhistory);

	AuctionHistory selectcheckAuction_history_price(int auction_no);

	
	/*한결*/
	ArrayList<AuctionHistory> selectAuctionHistory(int currentPage);

	int selectAuctionHistoryCount();
	/*한결*/
	
	
	/*경매 입찰내역 List*/
	ArrayList<AuctionHistory> selectAuctionBiddingList(int auction_no);

	/*경매 입찰내역 List count*/
	int selectAuctionBiddingCount(int auction_no);

	int updateAuctionStatus();


	

}
