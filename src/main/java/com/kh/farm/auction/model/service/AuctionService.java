package com.kh.farm.auction.model.service;



import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import com.kh.farm.auction.model.vo.Auction;
import com.kh.farm.auction.model.vo.AuctionCommon;
import com.kh.farm.auction.model.vo.AuctionHistory;
import com.kh.farm.auction.model.vo.AuctionOrder;
import com.kh.farm.auction.model.vo.AuctionQnA;
import com.kh.farm.member.model.vo.Member;
import com.kh.farm.notice.model.vo.Notice;
import com.kh.farm.payment.model.vo.Payment;
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
	List<Auction> selectAuctionHistory(int currentPage);

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

	ArrayList<AuctionQnA> selectAuctionCusQnaList(int currentPage);

	int selectAuctionCusQnaListCount();

	//경매 카테고리
	List<Auction> selectLeft_boxChangeList(int currentPage, int type);

	int selectLeft_boxChangeCount(int type);

	List<Auction> select_auction_background(String member_id);

	//경매 카테고리 더보기
	List<Auction> selectmoreAuctionCategory(int currentPage, int atype);
	

	//경매 즉시 구매 경매 태이블 update
	int updateAuctionBuy(int auction_no);
	int updateAuctionBuyComplete(int auction_no);
	
	//경매 즉시 구매 buy_table insert
	int insertAuctionBuy(Auction auction);

	Payment selectAuctionBuy(int  auction_no);

	Payment selectAuctionPayment(int buy_no);

	Auction selectAuction(int auction_no);


	AuctionOrder selectAuctionPaymentInfo(int auction_no);

	int insertAuctionPayment(Payment pm);

	//경매 insert한후 history에 maxprice값 insert해주기
	int insertMaxpriceAuction(Auction auction);

	//경매 member_id로 auction_no 가져오기
	int selectAuction_no(String member_id);

	int selectprice(int auction_no);


	//입찰내역 남은 day수 가져오기
	int selectDay(int auction_no);

	//경매 상태가 2이고 그 맥스값
	ArrayList<AuctionHistory> selectb();

	

	//즉시구매 누르면 auction_history에 즉시구매값 넣어주기
	int insertdirectprice(AuctionCommon common);

	//경매 상태 2 인것만 뽑기
	ArrayList<Auction> selectStatus_2();

	AuctionCommon selectWinBid(int auction_no);

	int updateAuctionStatusDeadline(int auction_no);

	List<Auction> selectStatus_4();

	int selectMiscarry(String member_id);

	AuctionOrder selectAuctionPaymentInfoFromCS(AuctionCommon common);

	//옥션 입찰안에 값 셀렉트로 값  뽑
	Auction selectbid(int auction_no);

	

	

	


	

}
