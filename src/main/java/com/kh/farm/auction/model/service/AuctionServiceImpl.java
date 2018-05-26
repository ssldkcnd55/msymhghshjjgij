package com.kh.farm.auction.model.service;


import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.kh.farm.auction.model.dao.AuctionDao;
import com.kh.farm.auction.model.vo.*;
import com.kh.farm.member.model.vo.Member;

@Service
public class AuctionServiceImpl implements AuctionService{
	

	@Autowired
	private AuctionDao auctionDao;
	@Autowired
	private SqlSessionTemplate sqlSession;/*커넥션*/
	
	@Override
	public int insertAuctionMake(Auction auction) {
		return auctionDao.insertAuctionMake(auction,sqlSession);
	}
	
	@Override
	public List<Auction> selectAuctionList(int page) {
		return auctionDao.selectAuctionList(sqlSession,page);
	}
	
	@Override
	public Auction selectAuctionDetail(int auction_no) {
		return auctionDao.selectAuctionDetail(sqlSession,auction_no);
	}
	
	@Override
	public Auction deleteAuction(int auction_no) {
		return auctionDao.deleteAuction(sqlSession,auction_no);
	}
	
	@Override
	public Auction selectModifyAuction(int auction_no) {
		return auctionDao.selectModifyAuction(sqlSession,auction_no);

	}
	
	@Override
	public int updateAuctionMake(Auction auction) {
		return auctionDao.updateAuctionMake(sqlSession,auction);
	}
	
	@Override
	public int insertAuctionQnAMake(AuctionQnA auctionqna) {
		return auctionDao.insertAuctionQnAMake(sqlSession,auctionqna);
	}
	
	@Override
	public ArrayList<AuctionQnA> selectAuctionQnAList(Auction auction, int currentPage) {
		return auctionDao.selectAuctionQnAList(sqlSession,auction,currentPage);
	}
	
	@Override
	public int selectAuctionQnACount(Auction auction) {
		return auctionDao.selectAuctionQnACount(sqlSession,auction);
	}
	
	@Override
	public AuctionQnA selectAuctionQnADetail(int auction_qna_no) {
		return auctionDao.selectAuctionQnADetail(sqlSession,auction_qna_no);
	}
	
	@Override
	public AuctionQnA selectshowAuctionQnAModify(int auction_qna_no) {
		return auctionDao.selectshowAuctionQnAModify(sqlSession,auction_qna_no);
	}
	
	@Override
	public int updateAuctionQnA(AuctionQnA auctionqna) {
		return auctionDao.updateAuctionQnA(sqlSession,auctionqna);
	}
	
	@Override
	public int updateauctionQnA_Answer(AuctionQnA auctionqna) {
		return auctionDao.updateauctionQnA_Answer(sqlSession,auctionqna);
	}

	@Override
	public ArrayList<Auction> selectHomeAuctionList() {
		// TODO Auto-generated method stub
		
		return auctionDao.selectHomeAuctionList(sqlSession);
	}
	
	@Override
	public int updateSellerAuctionQnAanswer(int auction_qna_no) {
		return auctionDao.updateSellerAuctionQnAanswer(sqlSession,auction_qna_no);
	}

	@Override
	public AuctionQnA selectseller_QnAanswer(int auction_qna_no) {
		return auctionDao.selectseller_QnAanswer(sqlSession,auction_qna_no);
	}
	
	
}
