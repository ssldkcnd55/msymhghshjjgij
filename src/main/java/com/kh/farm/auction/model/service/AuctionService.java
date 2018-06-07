package com.kh.farm.auction.model.service;



import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import com.kh.farm.auction.model.vo.Auction;
import com.kh.farm.auction.model.vo.AuctionHistory;
import com.kh.farm.auction.model.vo.AuctionQnA;
import com.kh.farm.member.model.vo.Member;
import com.kh.farm.notice.model.vo.Notice;
import com.kh.farm.qna.model.vo.Market_qna;

public interface AuctionService {
	
	/*경매 등록*/
	int insertAuctionMake(Auction auction);

	/*경매 메인 ajax List  */
	List<Auction> selectAuctionList(int currentPage);
	
	int selectajaxAuctionListCount();
	
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
	List<AuctionHistory> selectAuctionHistory(int currentPage);

	int selectAuctionHistoryCount();
	/*한결*/
	
	
	/*경매 입찰내역 List*/
	ArrayList<AuctionHistory> selectAuctionBiddingList(int auction_no);

	/*경매 입찰내역 List count*/
	int selectAuctionBiddingCount(int auction_no);

	int updateAuctionStatus();

	Auction selectauction_timeRemaining(int auction_no);

	List<AuctionQnA> selectAuction_search(String keyword, int select, int currentPage, int auction_no);

	int selectAuction_searchCount(int auction_no);

	String selectauction_startdateCheck();

	ArrayList<AuctionQnA> selectAuctionCusQnaList(int currentPage);

	int selectAuctionCusQnaListCount();

	//경매 카테고리
	List<Auction> selectLeft_boxChangeList(int currentPage, int type);

	int selectLeft_boxChangeCount(int type);

	List<Auction> select_auction_background(String member_id);

	//경매 카테고리 더보기
	List<Auction> selectmoreAuctionCategory(int currentPage, int type);
	
	//경매 카테고리 더보기 listCount
	int selectmoreAuctionCategoryCount(int type);

	//경매 즉시 구매
	int updateAuctionBuy(int auction_no);

	

	


	

}
