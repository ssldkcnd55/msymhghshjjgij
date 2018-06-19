package com.kh.farm.market.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.farm.common.model.vo.*;
import com.kh.farm.market.exception.DeleteFailException;
import com.kh.farm.market.model.dao.MarketDao;
import com.kh.farm.market.model.vo.Category;
import com.kh.farm.market.model.vo.Daily;
import com.kh.farm.market.model.vo.Market;
import com.kh.farm.market.model.vo.Reply;
import com.kh.farm.market.model.vo.Review;
import com.kh.farm.market.model.vo.UnderReply;
import com.kh.farm.qna.model.vo.Market_qna;

@Service
public class MarketServiceImpl implements MarketService{
	@Autowired private MarketDao marketDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Override
	public ArrayList<Market> selectMarketList(int page,String search,String ctype,String cname,String sort) {
		return marketDao.marketList(page,sqlSession,search,ctype,cname,sort);
	}
	@Override
	public Market selectMarketInfo(int market_no) {
		// TODO Auto-generated method stub
		return marketDao.marketInfo(sqlSession,market_no);
	}
	@Override
	public ArrayList<Review> selectReviewList(Market mk, int currentPage, String reviewSearch) {
		// TODO Auto-generated method stub
		return marketDao.reviewList(sqlSession,mk,currentPage,reviewSearch);
	}
	@Override
	public int selectReviewCount(Market mk,String reviewSearch) {
		// TODO Auto-generated method stub
		return marketDao.reviewListCount(sqlSession,mk,reviewSearch);
	}
	public int insertMarket(Market market) {
		// TODO Auto-generated method stub
		return marketDao.insertMarket(sqlSession,market);
	}
	@Override
	public int insertMarket_qna(Market_qna qna) {
		// TODO Auto-generated method stub
		return marketDao.insertMarket_qna(sqlSession,qna);
	}
	@Override
	public int insertReview(Review rv) {
		// TODO Auto-generated method stub
		return marketDao.insertReview(sqlSession,rv);
	}
	@Override
	public ArrayList<Daily> selectDailyList(Market market) {
		// TODO Auto-generated method stub
		return marketDao.selectDailyList(sqlSession,market);
	}
	@Override
	public int insertMarket_daily(Daily daily) {
		// TODO Auto-generated method stub
		return marketDao.insertMarket_daily(sqlSession,daily);
	}
	@Override
	public ArrayList<Market> selectHomeNewMarketList() {
		// TODO Auto-generated method stub
		return marketDao.selectHomeNewMarketList(sqlSession);
	}
	@Override
	public ArrayList<Market> selectHomePopularMarketList() {
		// TODO Auto-generated method stub
		return marketDao.selectHomePopularMarketList(sqlSession);
	}
	public Review selectReviewDetail(int review_no) {
		// TODO Auto-generated method stub
		return marketDao.selectReviewDetail(sqlSession,review_no);
	}
	@Override
	public Daily selectDailyDetail(int daily_no) {
		// TODO Auto-generated method stub
		return marketDao.selectDailyDetail(sqlSession,daily_no);
	}
	
	/*@Override
	public Market selectSearchList(String search) {
		// TODO Auto-generated method stub
		return marketDao.selectMarketSearchList(sqlSession,search);
	}*/
	
	@Override
	public Market selectSearchList(String search) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public ArrayList<Reply> selectReviewReply(int review_no,int currentPage) {
		// TODO Auto-generated method stub
		return marketDao.selectReviewReply(sqlSession,review_no,currentPage);
	}
	@Override
	public int selectReviewReplyCount(int review_no) {
		// TODO Auto-generated method stub
		return marketDao.selectReviewReplyCount(sqlSession,review_no);
	}
	@Override
	public ArrayList<UnderReply> selectReviewUnderReply(HashMap<String, ArrayList<Integer>> map) throws DeleteFailException{
		// TODO Auto-generated method stub
		return marketDao.selectReviewUnderReply(sqlSession,map);
	}
	@Override
	public ArrayList<Reply> selectDailyReply(int daily_no, int currentPage) {
		// TODO Auto-generated method stub
		return marketDao.selectDailyReply(sqlSession,daily_no,currentPage);
	}
	@Override
	public int selectDailyReplyCount(int daily_no) {
		// TODO Auto-generated method stub
		return marketDao.selectDailyReplyCount(sqlSession,daily_no);
	}
	@Override
	public ArrayList<UnderReply> selectDailyUnderReply(HashMap<String, ArrayList<Integer>> map) throws DeleteFailException{
		// TODO Auto-generated method stub
		return marketDao.selectDailyUnderReply(sqlSession,map);
	}
	@Override
	public int insertReply(Reply reply) {
		// TODO Auto-generated method stub
		return marketDao.insertReviewReply(sqlSession,reply);
	}
	@Override
	public int insertUnderReply(UnderReply reply) {
		// TODO Auto-generated method stub
		return marketDao.insertUnderReply(sqlSession,reply);
	}
	@Override
	public int deleteReply(Reply reply) throws DeleteFailException{
		// TODO Auto-generated method stub
		return marketDao.deleteReply(sqlSession,reply);
	}
	@Override
	public int deleteUnderReply(UnderReply reply) {
		// TODO Auto-generated method stub
		return marketDao.deleteUnderReply(sqlSession,reply);
	}
	@Override
	public int updateReplyNull(Reply reply) {
		// TODO Auto-generated method stub
		return marketDao.updateReplyNull(sqlSession,reply);
	}
	@Override
	public int updateReviewReply(Reply reply) {
		// TODO Auto-generated method stub
		return marketDao.updateReviewReply(sqlSession,reply);
	}
	@Override
	public int updateDailyReply(Reply reply) {
		// TODO Auto-generated method stub
		return marketDao.updateDailyReply(sqlSession,reply);
	}
	@Override
	public int updateReviewUnderReply(UnderReply reply) {
		// TODO Auto-generated method stub
		return marketDao.updateUnderReply(sqlSession,reply);
	}
	@Override
	public int updateDaily(Daily daily) {
		// TODO Auto-generated method stub
		return marketDao.updateDaily(sqlSession,daily);
	}
	@Override
	public int updateReview(Review review) {
		// TODO Auto-generated method stub
		return marketDao.updateReview(sqlSession,review);
	}
	@Override
	public int deleteReview(Review review) {
		// TODO Auto-generated method stub
		return marketDao.deleteReview(sqlSession,review);
	}
	@Override
	public int deleteDaily(Daily daily) {
		// TODO Auto-generated method stub
		return marketDao.deleteDaily(sqlSession,daily);
	}
	@Override
	public ArrayList<Category> selectCategory(String ctype) {
		// TODO Auto-generated method stub
		return marketDao.selectCategory(sqlSession,ctype);
	}
	@Override
	public ArrayList<Market> selectCusMarketThree() {
		// TODO Auto-generated method stub
		return marketDao.selectCusMarketThree(sqlSession);
	}
	@Override
	public List<Market> selectSellerMarketList(String member_id,int market_no) {
		// TODO Auto-generated method stub
		return marketDao.selectSellerMarketList(sqlSession,member_id,market_no);
	}
	@Override
	public int selectSellerMarketCount(String member_id,int market_no) {
		// TODO Auto-generated method stub
		return marketDao.selectSellerMarketCount(sqlSession,member_id,market_no);
	}
	@Override
	public List<Category> selectCategoryList() {
		
		return marketDao.selectCategoryList(sqlSession);
	}
	@Override
	public List<Category> selectCategoryNameList(String category_main) {
		// TODO Auto-generated method stub
		return marketDao.selectCategoryNameList(sqlSession,category_main);
	}
	@Override
	public ArrayList<Market> selectSellerMarketHistory(int currentPage, PageNumber pa) {
		// TODO Auto-generated method stub
		return marketDao.selectSellerMarketHistory(sqlSession,currentPage,pa);
	}
	@Override
	public int selectSellerMarketHistoryCount() {
		// TODO Auto-generated method stub
		return marketDao.selectSellerMarketHistoryCount(sqlSession);
	}
	@Override
	public int updateMarketDel(int market_no) {
		// TODO Auto-generated method stub
		return marketDao.updateMarketDel(sqlSession,market_no);
	}
	@Override
	public int updateMarket(Market market) {
		// TODO Auto-generated method stub
		return marketDao.updateMarket(sqlSession,market);
	}
}
