package com.kh.farm.auction.model.service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.kh.farm.auction.model.dao.AuctionDao;
import com.kh.farm.auction.model.vo.*;
import com.kh.farm.member.model.vo.Member;
import com.kh.farm.payment.model.vo.Payment;
import com.kh.farm.qna.model.vo.Market_qna;

@Service
public class AuctionServiceImpl implements AuctionService {

	@Autowired
	private AuctionDao auctionDao;
	@Autowired
	private SqlSessionTemplate sqlSession;/* 커넥션 */

	@Override
	public int insertAuctionMake(Auction auction) {
		return auctionDao.insertAuctionMake(auction, sqlSession);
	}

	@Override
	public List<Auction> selectAuctionList(int currentPage) {
		return auctionDao.selectAuctionList(sqlSession, currentPage);
	}

	@Override
	public int selectajaxAuctionListCount() {
		return auctionDao.selectajaxAuctionListCount(sqlSession);
	}

	@Override
	public Auction selectAuctionDetail(int auction_no) {
		return auctionDao.selectAuctionDetail(sqlSession, auction_no);
	}

	@Override
	public Auction deleteAuction(int auction_no) {
		return auctionDao.deleteAuction(sqlSession, auction_no);
	}

	@Override
	public Auction selectModifyAuction(int auction_no) {
		return auctionDao.selectModifyAuction(sqlSession, auction_no);

	}

	@Override
	public int updateAuctionMake(Auction auction) {
		return auctionDao.updateAuctionMake(sqlSession, auction);
	}

	@Override
	public int insertAuctionQnAMake(AuctionQnA auctionqna) {
		return auctionDao.insertAuctionQnAMake(sqlSession, auctionqna);
	}

	@Override
	public ArrayList<AuctionQnA> selectAuctionQnAList(Auction auction, int currentPage) {
		return auctionDao.selectAuctionQnAList(sqlSession, auction, currentPage);
	}

	@Override
	public int selectAuctionQnACount(Auction auction) {
		return auctionDao.selectAuctionQnACount(sqlSession, auction);
	}

	@Override
	public AuctionQnA selectAuctionQnADetail(int auction_qna_no) {
		return auctionDao.selectAuctionQnADetail(sqlSession, auction_qna_no);
	}

	@Override
	public AuctionQnA selectshowAuctionQnAModify(int auction_qna_no) {
		return auctionDao.selectshowAuctionQnAModify(sqlSession, auction_qna_no);
	}

	@Override
	public int updateAuctionQnA(AuctionQnA auctionqna) {
		return auctionDao.updateAuctionQnA(sqlSession, auctionqna);
	}

	@Override
	public int updateauctionQnA_Answer(AuctionQnA auctionqna) {
		return auctionDao.updateauctionQnA_Answer(sqlSession, auctionqna);
	}

	@Override
	public ArrayList<Auction> selectHomeAuctionList() {
		// TODO Auto-generated method stub

		return auctionDao.selectHomeAuctionList(sqlSession);
	}

	@Override
	public int updateSellerAuctionQnAanswer(AuctionQnA auctionqna) {
		return auctionDao.updateSellerAuctionQnAanswer(sqlSession, auctionqna);
	}

	@Override
	public AuctionQnA selectseller_QnAanswer(int auction_qna_no) {
		return auctionDao.selectseller_QnAanswer(sqlSession, auction_qna_no);
	}

	@Override
	public int delete_auction_qna_answer(int auction_qna_no) {
		return auctionDao.delete_auction_qna_answer(sqlSession, auction_qna_no);
	}

	@Override
	public List<Auction> selectAuctionHistory(int currentPage) {
		// TODO Auto-generated method stub
		return auctionDao.selectAuctionHistory(sqlSession, currentPage);
	}

	@Override
	public int selectAuctionHistoryCount() {
		// TODO Auto-generated method stub
		return auctionDao.selectAuctionHistoryCount(sqlSession);
	}

	@Override
	public AuctionHistory selectcheckAuction_history_price(int auction_no) {
		return auctionDao.selectcheckAuction_history_price(sqlSession, auction_no);
	}

	@Override
	public int insertAuctionBidding(AuctionHistory auctionhistory) {
		return auctionDao.insertAuctionBidding(sqlSession, auctionhistory);
	}

	@Override
	public ArrayList<AuctionHistory> selectAuctionBiddingList(int auction_no) {
		return auctionDao.selectAuctionBiddingList(sqlSession, auction_no);
	}

	@Override
	public int selectAuctionBiddingCount(int auction_no) {
		return auctionDao.selectAuctionBiddingCount(sqlSession, auction_no);
	}

	@Override
	public int updateAuctionStatus() {
		return auctionDao.updateAuctionStatus(sqlSession);

	}

	@Override
	public Auction selectauction_timeRemaining(int auction_no) {
		return auctionDao.selectauction_timeRemaining(sqlSession, auction_no);
	}

	@Override
	public List<AuctionQnA> selectAuction_search(String keyword, int select, int currentPage, int auction_no) {

		switch (select) {
		case 1:
			return auctionDao.selectAuction_searchTitle(sqlSession, keyword, currentPage, auction_no);
		default:
			return auctionDao.selectAuction_searchMember_id(sqlSession, keyword, currentPage, auction_no);

		}

	}

	@Override
	public int selectAuction_searchCount(int auction_no) {
		return auctionDao.selectAuction_searchCount(sqlSession, auction_no);

	}

	@Override
	public ArrayList<AuctionQnA> selectAuctionCusQnaList(int currentPage) {
		return auctionDao.selectAuctionCusQnaList(sqlSession, currentPage);
	}

	@Override
	public int selectAuctionCusQnaListCount() {
		return auctionDao.selectAuctionCusQnaListCount(sqlSession);
	}
 
	@Override
	public List<Auction> selectLeft_boxChangeList(int currentPage, int type) {
		switch (type) {
		case 0:
			return auctionDao.selectLeft_AuctionStandBy(sqlSession, currentPage);
		case 1:
			return auctionDao.selectLeft_AuctionProgress(sqlSession, currentPage);
		case 2:
			return auctionDao.selectLeft_AuctionFinish(sqlSession, currentPage);
		default:
			return auctionDao.selectLeft_boxLatest(sqlSession, currentPage);
		}
	}

	@Override
	public int selectLeft_boxChangeCount(int type) {
		switch (type) {
		case 0:
			return auctionDao.selectLeft_AuctionStandByCount(sqlSession);
		case 1:
			return auctionDao.selectLeft_AuctionProgressCount(sqlSession);
		case 2:
			return auctionDao.selectLeft_AuctionFinishCount(sqlSession);
		default:
			return auctionDao.selectLeft_boxLatestCount(sqlSession);/*최신*/
		}
	}

	@Override
	public List<Auction> select_auction_background(String member_id) {
		System.out.println("서비스 : "+auctionDao.select_auction_background(sqlSession, member_id));
		return auctionDao.select_auction_background(sqlSession, member_id);
	}

	@Override
	public List<Auction> selectmoreAuctionCategory(int currentPage, int atype) {
		return auctionDao.selectmoreAuctionCategory(sqlSession, currentPage, atype);
	}

	@Override
	public int updateAuctionBuy(int auction_no) {
		return auctionDao.updateAuctionBuy(sqlSession, auction_no);
	}
	@Override
	public int updateAuctionBuyComplete(int auction_no) {
		return auctionDao.updateAuctionBuyComplete(sqlSession, auction_no);
	}

	@Override
	public int insertAuctionBuy(Auction auction) {
		return auctionDao.insertAuctionBuy(sqlSession, auction);
	}

	@Override
	public Payment selectAuctionBuy(int auction_no) {
		return auctionDao.selectAuctionBuy(sqlSession, auction_no);

	}

	@Override
	public Payment selectAuctionPayment(int buy_no) {
		return auctionDao.selectAuctionPayment(sqlSession, buy_no);
	}

	@Override
	public Auction selectAuction(int auction_no) {
		return auctionDao.selectAuction(sqlSession, auction_no);
	}
	
	@Override

	public AuctionOrder selectAuctionPaymentInfo(int auction_no) {
		return auctionDao.selectAuctionPaymentInfo(sqlSession,auction_no);
	}
	@Override
	public int insertAuctionPayment(Payment pm) {
		
		return auctionDao.insertAuctionPayment(sqlSession,pm);
	}


	@Override
	public int insertMaxpriceAuction(Auction auction) {
		return auctionDao.insertMaxpriceAuction(sqlSession,auction);
	}
	
	
	@Override
	public int selectAuction_no(String member_id) {
		return auctionDao.selectAuction_no(sqlSession,member_id);

	}
	
	@Override
	public int selectprice(int auction_no) {
		return auctionDao.selectprice(sqlSession,auction_no);
	}
	
	@Override
	public int selectDay(int auction_no) {
		return auctionDao.selectDay(sqlSession,auction_no);
	}
	
	@Override
	public ArrayList<AuctionHistory> selectb() {
		return auctionDao.selectb(sqlSession);
	}
	
	
	
	@Override
	public int insertdirectprice(AuctionCommon common) {
		return auctionDao.insertdirectprice(sqlSession,common);

	}
	
	@Override
	public ArrayList<Auction> selectStatus_2() {
		return auctionDao.selectStatus_2(sqlSession);

	}

	@Override
	public AuctionCommon selectWinBid(int auction_no) {
		// TODO Auto-generated method stub
		return auctionDao.selectWinBid(sqlSession,auction_no);
	}

	@Override
	public int updateAuctionStatusDeadline(int auction_no) {
		// TODO Auto-generated method stub
		return auctionDao.updateAuctionStatusDeadline(sqlSession,auction_no);
	}

	@Override
	public List<Auction> selectStatus_4() {
		// TODO Auto-generated method stub
		return auctionDao.selectStatus_4(sqlSession);
	}
	
	@Override
	public int selectMiscarry(String member_id) {
		// TODO Auto-generated method stub
		return auctionDao.selectMiscarry(sqlSession,member_id);
	}
	
	@Override
	public AuctionOrder selectAuctionPaymentInfoFromCS(AuctionCommon common) {
		// TODO Auto-generated method stub
		return auctionDao.selectAuctionPaymentInfoFromCS(sqlSession,common);
	}
	
	@Override
	public Auction selectbid(int auction_no) {
		return auctionDao.selectbid(sqlSession,auction_no);

	}
}
