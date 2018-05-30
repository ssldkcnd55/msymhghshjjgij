package com.kh.farm.auction.model.dao;


import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.farm.auction.model.vo.Auction;
import com.kh.farm.auction.model.vo.AuctionHistory;
import com.kh.farm.auction.model.vo.AuctionQnA;
import com.kh.farm.common.model.vo.PageNumber;
import com.kh.farm.member.model.vo.Member;
import com.kh.farm.notice.model.vo.Notice;

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


	public int insertAuctionQnAMake(SqlSessionTemplate sqlSession, AuctionQnA auctionqna) {
		return sqlSession.insert("auction.insertAuctionQnAMake",auctionqna);
	}


	public ArrayList<AuctionQnA> selectAuctionQnAList(SqlSessionTemplate sqlSession, Auction auction, int currentPage) {
		int startRow = (currentPage-1)*10+1; 
		int endRow = startRow+9;
		PageNumber pnum = new PageNumber();
		pnum.setStartRow(startRow);
		pnum.setEndRow(endRow);
		pnum.setAuction_no(auction.getAuction_no());
		List<AuctionQnA> list =sqlSession.selectList("auction.selectAuctionQnAList",pnum);
		return (ArrayList<AuctionQnA>)list;
	}


	public int selectAuctionQnACount(SqlSessionTemplate sqlSession, Auction auction) {
		int selectAuctionQnACount = sqlSession.selectOne("auction.selectAuctionQnACount",auction.getAuction_no());
		return selectAuctionQnACount;
	}


	public AuctionQnA selectAuctionQnADetail(SqlSessionTemplate sqlSession, int auction_qna_no) {
		return sqlSession.selectOne("auction.selectAuctionQnADetail",auction_qna_no);

	}


	public AuctionQnA selectshowAuctionQnAModify(SqlSessionTemplate sqlSession, int auction_qna_no) {
		return sqlSession.selectOne("auction.selectshowAuctionQnAModify",auction_qna_no);
	}


	public int updateAuctionQnA(SqlSessionTemplate sqlSession,AuctionQnA auctionqna) {
		return sqlSession.update("auction.updateAuctionQnA",auctionqna);
	}

	//경매 QnA 답글 등록
	public int updateauctionQnA_Answer(SqlSessionTemplate sqlSession, AuctionQnA auctionqna) {
		return sqlSession.update("auction.updateauctionQnA_Answer",auctionqna);
	}


	public ArrayList<Auction> selectHomeAuctionList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		List<Auction> list = sqlSession.selectList("auction.selectHomeAuctionList");
		return (ArrayList<Auction>)list;
	}


	//경매 QnA 답글 수정
	public int updateSellerAuctionQnAanswer(SqlSessionTemplate sqlSession, AuctionQnA auctionqna) {
		return sqlSession.update("auction.updateSellerAuctionQnAanswer",auctionqna);
	}


	public AuctionQnA selectseller_QnAanswer(SqlSessionTemplate sqlSession, int auction_qna_no) {
		return sqlSession.selectOne("auction.selectseller_QnAanswer",auction_qna_no);
	}


	public int delete_auction_qna_answer(SqlSessionTemplate sqlSession, int auction_qna_no) {
		return sqlSession.update("auction.delete_auction_qna_answer", auction_qna_no);
	}

	public ArrayList<AuctionHistory> selectAuctionHistory(SqlSessionTemplate sqlSession, int currentPage) {
		// TODO Auto-generated method stub
		int startRow =(currentPage-1)*10+1; //1~10, 11~20 계산할 거 ex) 1, 11, 21, 31,)
		int endRow = startRow+9;
		PageNumber pnum = new PageNumber();
		pnum.setStartRow(startRow);
		pnum.setEndRow(endRow);
		List<AuctionHistory> ac = sqlSession.selectList("auction.selectAuctionHistory",pnum);
		return (ArrayList)ac;
	}


	public AuctionHistory selectcheckAuction_history_price(SqlSessionTemplate sqlSession, int auction_no) {
		return sqlSession.selectOne("auction.selectcheckAuction_history_price", auction_no);
	}
	
	public int insertAuctionBidding(SqlSessionTemplate sqlSession, AuctionHistory auctionhistory) {
		return sqlSession.insert("auction.insertAuctionBidding", auctionhistory);
	}


	/*경매 입찰내역 List*/
	public ArrayList<AuctionHistory> selectAuctionBiddingList(SqlSessionTemplate sqlSession, int auction_no) {
		List<AuctionHistory> selectAuctionBiddingList = sqlSession.selectList("auction.selectAuctionBiddingList",auction_no);
		return (ArrayList<AuctionHistory>)selectAuctionBiddingList;
	}



	/*한결*/
	public int selectAuctionHistoryCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		int listCount = sqlSession.selectOne("auction.selectAuctionHistoryCount");
		return listCount;
	}


	public int selectAuctionBiddingCount(SqlSessionTemplate sqlSession, int auction_no) {
		return sqlSession.insert("auction.selectAuctionBiddingCount", auction_no);
	}



	

}
