package com.kh.farm.auction.model.dao;


import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.farm.auction.model.vo.Auction;
import com.kh.farm.common.model.vo.PageNumber;
import com.kh.farm.member.model.vo.Member;

@Repository
public class AuctionDao {
	
	public int insertAuctionMake(Auction auction,SqlSessionTemplate sqlSession) {
		return sqlSession.insert("auction.insertAuctionMake", auction);
	}


	public Auction selectAuctionDetail(SqlSessionTemplate sqlSession, int auction_no) {
		return sqlSession.selectOne("auction.selectAuctionDetail",auction_no);
	}

	public List<Auction> selectAuctionList(SqlSessionTemplate sqlSession, int page) {
		PageNumber pn = new PageNumber();
		pn.setStartRow(page * 9 -8);
		pn.setEndRow(pn.getStartRow() + 8);
		List<Auction> list = sqlSession.selectList("auction.selectAuctionList",pn);
		list.toString();
		return list;
	}


	public Auction deleteAuction(SqlSessionTemplate sqlSession, int auction_no) {
		return sqlSession.selectOne("auction.deleteAuction",auction_no);
	}


	public Auction selectModifyAuction(SqlSessionTemplate sqlSession, int auction_no) {
		return sqlSession.selectOne("auction.selectmodifyAuction",auction_no);
	}


	public int updateAuctionMake(SqlSessionTemplate sqlSession, Auction auction) {
		return sqlSession.update("auction.updateAuctionMake",auction);
	}

}
