package com.kh.farm.qna.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.farm.market.model.vo.Market;
import com.kh.farm.qna.model.service.QnaService;
import com.kh.farm.qna.model.vo.MainQna;
import com.kh.farm.qna.model.vo.Market_qna;



@Controller
public class QnaController {
	@Autowired private QnaService qnaService;

	@RequestMapping(value="qnaList.do")
	public void qnaList(Market mk, HttpServletResponse response,@RequestParam("page") int currentPage) throws IOException{
		
		JSONArray jarr =new JSONArray();
		
		ArrayList<Market_qna> qnaList = qnaService.selectQnaList(mk,currentPage);
		int limitPage = 10;
		
		int listCount = qnaService.selectQnaCount(mk);
		
		int maxPage=(int)((double)listCount/limitPage+0.9); //ex) 41개면 '5'페이지나와야되는데 '5'를 계산해줌
		int startPage=((int)((double)currentPage/5+0.8)-1)*5+1;
		int endPage=startPage+5-1;
		
		if(maxPage<endPage) {
			endPage = maxPage;
		}
		for (Market_qna sq : qnaList) {
			JSONObject jsq = new JSONObject();
			jsq.put("rnum", sq.getRnum());
			jsq.put("market_qna_no", sq.getMarket_qna_no());
			jsq.put("member_id", sq.getMember_id());
			jsq.put("market_qna_question_date", sq.getMarket_qna_question_date().toString());
			jsq.put("market_qna_title", sq.getMarket_qna_title());
			jsq.put("startPage", startPage);
			jsq.put("endPage", endPage);
			jsq.put("maxPage", maxPage);
			jsq.put("currentPage",currentPage);
			jarr.add(jsq);
		}
		
		JSONObject sendJson = new JSONObject();
		sendJson.put("list", jarr);
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.append(sendJson.toJSONString());
		out.flush();
		out.close();
	}
	@RequestMapping("marketQnaDetail.do")
	public ModelAndView marketQnaDetail(ModelAndView mv,@RequestParam("qna_no") int qna_no) {
		Market_qna qna = qnaService.selectQna(qna_no);
		
		mv.addObject("qna",qna);
		mv.setViewName("market/marketQnaDetail");
		return mv;
	}
	@RequestMapping(value="mainqnaList.do")
	public void MainQnaList(HttpServletResponse response,@RequestParam("page") int currentPage) throws IOException{
		
		JSONArray jarr =new JSONArray();
		
		ArrayList<MainQna> qnaList = qnaService.selectMainQnaList(currentPage);
		int limitPage = 10;
		System.out.println("111");
		int listCount = qnaService.selectMainQnaCount();
		
		int maxPage=(int)((double)listCount/limitPage+0.9); //ex) 41개면 '5'페이지나와야되는데 '5'를 계산해줌
		int startPage=((int)((double)currentPage/5+0.8)-1)*5+1;
		int endPage=startPage+5-1;
		
		if(maxPage<endPage) {
			endPage = maxPage;
		}
		for (MainQna sq : qnaList) {
			JSONObject jsq = new JSONObject();
			jsq.put("rnum", sq.getRnum());
			jsq.put("main_qna_no", sq.getMain_qna_no());
			jsq.put("member_id", sq.getMember_id());
			jsq.put("main_qna_date", sq.getMain_qna_date().toString());
			jsq.put("main_qna_title", sq.getMain_qna_title());
			jsq.put("startPage", startPage);
			jsq.put("endPage", endPage);
			jsq.put("maxPage", maxPage);
			jsq.put("currentPage",currentPage);
			jarr.add(jsq);
		}
		
		JSONObject sendJson = new JSONObject();
		sendJson.put("list", jarr);
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.append(sendJson.toJSONString());
		out.flush();
		out.close();
		
	}
	
	@RequestMapping(value="qnaDetail.do")
	public ModelAndView qnaDetail(ModelAndView mv,@RequestParam("main_qna_no") int qna_no) {
		MainQna mq = qnaService.selectMainQnaDetail(qna_no);
		mv.addObject("main_qna",mq);
		mv.setViewName("qna/qnaDetail");
		return mv;
	}
	
	@RequestMapping(value="qnaAnswer.do", method=RequestMethod.POST )
	public String qnaAnswer(@RequestParam("main_qna_answer") String qna_answer, @RequestParam("main_qna_no") int qna_no) {
		MainQna mq = new MainQna();
		mq.setMain_qna_answer(qna_answer);
		mq.setMain_qna_no(qna_no);
		
		int mainQ = qnaService.updateAnswer(mq); 

		return "forward:/qnaDetail.do?main_qna_no="+qna_no;
	}
	
	@RequestMapping(value ="deleteQnaAnswer.do")
	public String deleteQnaAnswer(@RequestParam("main_qna_no") int qanswer_no) {
		
		int deleteQnaAnswer = qnaService.deleteQnaAnswer(qanswer_no);
		return "forward:/qnaDetail.do?main_qna_no="+qanswer_no;
	}
	
	@RequestMapping(value ="qnaMake.do", method=RequestMethod.POST)
	public String qnaMake(MainQna mq) {
		
		int insertMainQna= qnaService.insertMainQna(mq);
		
		return "qna/qna"; 
		
	}
	@RequestMapping(value="qnaUpdateMove.do") 
	public ModelAndView qnaUpdateMove(ModelAndView mv, MainQna mq) {
		mv.addObject("main_qna",mq);
		mv.setViewName("qna/qnaUpdate");
		
		return mv;
	}
	
	@RequestMapping(value="qnaUpdate.do", method=RequestMethod.POST)
	public String qnaUpdate(MainQna mq) {
		int qnaUpdate = qnaService.updateMainQna(mq);
		
		return "forward:/qnaDetail.do?main_qna_no="+mq.getMain_qna_no();
				
			
		
	}
	
	
}
