package com.kh.farm.auction.model.dao;


import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.farm.auction.model.vo.Auction;
import com.kh.farm.member.model.vo.Member;

@Repository
public class AuctionDao {
	
	public int insertAuctionMake(Auction auction,SqlSessionTemplate sqlSession) {
		return sqlSession.insert("auction.insertAuctionMake", auction);
	}

	public List<Auction> selectAuctionList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("auction.selectAuctionList");
	}

	public Auction selectAuctionDetail(SqlSessionTemplate sqlSession, int auction_no) {
		return sqlSession.selectOne("auction.selectAuctionDetail",auction_no);
	}
	
	
	
}
