package com.kh.farm.qna.model.service;

import java.util.ArrayList;

import com.kh.farm.market.model.vo.Market;
import com.kh.farm.qna.model.vo.MainQna;
import com.kh.farm.qna.model.vo.Market_qna;

public interface QnaService {

	ArrayList<Market_qna> selectQnaList(Market mk,int currentPage);

	int selectQnaCount(Market mk);

	Market_qna selectQna(int qna_no);

	ArrayList<MainQna> selectMainQnaList(int currentPage);

	int selectMainQnaCount();

}
