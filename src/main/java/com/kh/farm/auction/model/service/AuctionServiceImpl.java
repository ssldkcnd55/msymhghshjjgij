package com.kh.farm.auction.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.kh.farm.auction.model.dao.AuctionDao;
import com.kh.farm.auction.model.vo.*;

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

}
