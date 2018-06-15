package com.kh.farm.qna.model.service;

import java.util.ArrayList;

import com.kh.farm.market.model.vo.Market;
import com.kh.farm.qna.model.vo.MainQna;
import com.kh.farm.qna.model.vo.Market_qna;

public interface QnaService {

	ArrayList<Market_qna> selectQnaList(Market mk,int currentPage,String qnaSearch);

	int selectQnaCount(Market mk,String qnaSearch);

	Market_qna selectQna(int qna_no);

	ArrayList<MainQna> selectMainQnaList(int currentPage, String qnaSearch);

	int selectMainQnaCount(String qnaSearch);

	MainQna selectMainQnaDetail(int qna_no);

	int updateAnswer(MainQna mq);

	int deleteQnaAnswer(int qanswer_no);

	int insertMainQna(MainQna mq);

	int updateMainQna(MainQna mq);

	int updateMarketAnswer(Market_qna mq);

	int deleteMarketQnaAnswer(int qanswer_no);

	int updateMarketQna(Market_qna mq);

	int deleteMarketQna(int market_qna_no);

	int deleteMainQna(int main_qna_no);
	
	ArrayList<Market_qna> selectCusQnaList(int currentPage);

	int selectCusQnaListCount();

}
