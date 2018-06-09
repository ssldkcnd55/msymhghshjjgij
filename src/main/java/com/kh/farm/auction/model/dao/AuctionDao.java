package com.kh.farm.auction.model.dao;


import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
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
import com.kh.farm.payment.model.vo.Payment;
import com.kh.farm.qna.model.vo.Market_qna;

@Repository
public class AuctionDao {
	
	public ArrayList<AuctionQnA> selectAuctionCusQnaList(SqlSessionTemplate sqlSession, int currentPage) {
		// TODO Auto-generated method stub
		int startRow =(currentPage-1)*10+1; //1~10, 11~20 계산할 거 ex) 1, 11, 21, 31,)
		int endRow = startRow+9;
		PageNumber pnum = new PageNumber();
		pnum.setStartRow(startRow);
		pnum.setEndRow(endRow);
		List<AuctionQnA> ac = sqlSession.selectList("auction.selectAuctionCusQnaList",pnum);
		return (ArrayList)ac;
	}

	public int selectAuctionCusQnaListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		int listCount = sqlSession.selectOne("auction.selectAuctionCusQnaListCount");
		return listCount;
	}
	
	public int insertAuctionMake(Auction auction,SqlSessionTemplate sqlSession) {
		return sqlSession.insert("auction.insertAuctionMake", auction);
	}


	public Auction selectAuctionDetail(SqlSessionTemplate sqlSession, int auction_no) {
		return sqlSession.selectOne("auction.selectAuctionDetail",auction_no);
	}

	public List<Auction> selectAuctionList(SqlSessionTemplate sqlSession, int currentPage) {
		PageNumber pn = new PageNumber();
		pn.setStartRow(currentPage * 9 -8);
		pn.setEndRow(pn.getStartRow() + 8);
		List<Auction> list = sqlSession.selectList("auction.selectAuctionList",pn);
		list.toString();
		return list;
	}

	//경매 맨처음 List 카운트
	public int selectajaxAuctionListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("auction.selectajaxAuctionListCount");

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

	public List<AuctionHistory> selectAuctionHistory(SqlSessionTemplate sqlSession, int currentPage) {
		// TODO Auto-generated method stub
		int startRow =(currentPage-1)*10+1; //1~10, 11~20 계산할 거 ex) 1, 11, 21, 31,)
		int endRow = startRow+9;
		HashMap<Object,Object> map=new HashMap<Object,Object>();
		map.put("startRow",startRow);
		map.put("endRow", endRow);
		return sqlSession.selectList("selectAuctionHistory",map);
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
		int listCount = sqlSession.selectOne("selectAuctionHistoryCount");
		return listCount;
	}


	public int selectAuctionBiddingCount(SqlSessionTemplate sqlSession, int auction_no) {
		return sqlSession.insert("auction.selectAuctionBiddingCount", auction_no);
	}


	public int updateAuctionStatus(SqlSessionTemplate sqlSession) {
		return sqlSession.update("auction.updateAuctionStatus");

	}


	public Auction selectauction_timeRemaining(SqlSessionTemplate sqlSession, int auction_no) {
		return sqlSession.selectOne("auction.selectauction_timeRemaining", auction_no);

	}


	public List<AuctionQnA> selectAuction_searchTitle(SqlSessionTemplate sqlSession, String keyword, int currentPage,
			int auction_no) {
		int startRow =(currentPage-1)*10+1; //1~10, 11~20 계산할 거 ex) 1, 11, 21, 31,)
		int endRow = startRow+9;
		PageNumber pnum = new PageNumber();
		pnum.setStartRow(startRow);
		pnum.setEndRow(endRow);
		pnum.setKeyword(keyword);
		pnum.setAuction_no(auction_no);
		return sqlSession.selectList("auction.selectAuction_searchTitle",pnum);
	}
	
	public List<AuctionQnA> selectAuction_searchMember_id(SqlSessionTemplate sqlSession, String keyword, int currentPage,
			int auction_no) {
		int startRow =(currentPage-1)*10+1; //1~10, 11~20 계산할 거 ex) 1, 11, 21, 31,)
		int endRow = startRow+9;
		PageNumber pnum = new PageNumber();
		pnum.setStartRow(startRow);
		pnum.setEndRow(endRow);
		pnum.setKeyword(keyword);
		pnum.setAuction_no(auction_no);
		return sqlSession.selectList("auction.selectAuction_searchMember_id",pnum);
	}


	public int selectAuction_searchCount(SqlSessionTemplate sqlSession, int auction_no) {
		return sqlSession.selectOne("auction.selectAuction_searchCount",auction_no);

	}


	public String selectauction_startdateCheck(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("auction.selectauction_startdateCheck");

	}


	public List<Auction> selectLeft_AuctionStandBy(SqlSessionTemplate sqlSession, int currentPage) {
		//  select box에서 경매대기: 0
		int startRow =(currentPage-1)*10+1; //1~10, 11~20 계산할 거 ex) 1, 11, 21, 31,)
		int endRow = startRow+8;
		PageNumber pnum = new PageNumber();
		pnum.setStartRow(startRow);
		pnum.setEndRow(endRow);
		return sqlSession.selectList("auction.selectLeft_AuctionStandBy",pnum);

	}

	public List<Auction> selectLeft_AuctionProgress(SqlSessionTemplate sqlSession, int currentPage) {
		//  select box에서 경매중 : 1
		int startRow =(currentPage-1)*10+1; //1~10, 11~20 계산할 거 ex) 1, 11, 21, 31,)
		int endRow = startRow+8;
		PageNumber pnum = new PageNumber();
		pnum.setStartRow(startRow);
		pnum.setEndRow(endRow);
		return sqlSession.selectList("auction.selectLeft_AuctionProgress",pnum);
	}

	public List<Auction> selectLeft_AuctionFinish(SqlSessionTemplate sqlSession, int currentPage) {
		// select box에서 경매마감 : 2
		int startRow =(currentPage-1)*10+1; //1~10, 11~20 계산할 거 ex) 1, 11, 21, 31,)
		int endRow = startRow+8;
		PageNumber pnum = new PageNumber();
		pnum.setStartRow(startRow);
		pnum.setEndRow(endRow);
		return sqlSession.selectList("auction.selectLeft_AuctionFinish",pnum);
	}

	public List<Auction> selectLeft_boxLatest(SqlSessionTemplate sqlSession, int currentPage) {
		// select box에서 경매 최신순: 3
		int startRow =(currentPage-1)*10+1; //1~10, 11~20 계산할 거 ex) 1, 11, 21, 31,)
		int endRow = startRow+8;
		PageNumber pnum = new PageNumber();
		pnum.setStartRow(startRow);
		pnum.setEndRow(endRow);
		return sqlSession.selectList("auction.selectLeft_boxLatest",pnum);
	}

	public int selectLeft_AuctionStandByCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("auction.selectLeft_AuctionStandByCount");
	}

	public int selectLeft_AuctionProgressCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("auction.selectLeft_AuctionProgressCount");
	}

	public int selectLeft_AuctionFinishCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("auction.selectLeft_AuctionFinishCount");
	}

	public int selectLeft_boxLatestCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("auction.selectLeft_boxLatestCount");
	}

	public List<Auction> select_auction_background(SqlSessionTemplate sqlSession, String member_id) {
		return sqlSession.selectList("auction.select_auction_background",member_id);
	}

	public List<Auction> selectmoreAuctionCategory(SqlSessionTemplate sqlSession, int currentPage, int type) {
		PageNumber pn = new PageNumber();
		pn.setStartRow(currentPage * 9 -8);
		pn.setEndRow(pn.getStartRow() + 8);
		pn.setSelect(type);
		return sqlSession.selectList("auction.selectmoreAuctionCategory",pn);

	}

	public int selectmoreAuctionCategoryCount(SqlSessionTemplate sqlSession, int type) {
		return sqlSession.selectOne("auction.selectmoreAuctionCategoryCount",type);

	}

	public int updateAuctionBuy(SqlSessionTemplate sqlSession, int  auction_no) {
		return sqlSession.update("auction.updateAuctionBuy",auction_no);

	}

	public int insertAuctionBuy(SqlSessionTemplate sqlSession, Auction auction) {
		return sqlSession.insert("auction.insertAuctionBuy",auction);

	}

	public Payment selectAuctionBuy(SqlSessionTemplate sqlSession, int  auction_no) {
		return sqlSession.selectOne("auction.selectAuctionBuy",auction_no);
	}
	

	
	

	


	


	



	

}
