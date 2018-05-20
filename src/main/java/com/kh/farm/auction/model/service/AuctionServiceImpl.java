package com.kh.farm.auction.model.service;


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
	public List<Auction> selectAuctionList() {
		return auctionDao.selectAuctionList(sqlSession);
	}
	
	@Override
	public Auction selectAuctionDetail(int auction_no) {
		return auctionDao.selectAuctionDetail(sqlSession,auction_no);
	}

}
