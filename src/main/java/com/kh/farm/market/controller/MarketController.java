package com.kh.farm.market.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.farm.market.model.service.MarketService;
import com.kh.farm.market.model.vo.Market;
import com.kh.farm.market.model.vo.Review;

@Controller
public class MarketController {
@Autowired private MarketService marketService;

	@RequestMapping(value="marketList.do")
	public ModelAndView marketList(ModelAndView mv) {
		int page = 1;
		ArrayList<Market> list = marketService.marketList(page);
		mv.setViewName("market/marketList");
		mv.addObject("list",list);
		return mv;
	}
	
	@RequestMapping(value="marketDetail.do")
	public ModelAndView marketDetail(ModelAndView mv, Market mk) {
		Market market = marketService.selectMarketInfo(mk.getMarket_no());
		mv.setViewName("market/marketDetail");
		mv.addObject("market",market);
		return mv;
		
	}
	@RequestMapping(value="ajaxMoreMarket.do", method=RequestMethod.POST)
	public void moreMarketList(HttpServletResponse response,@RequestParam("page") int page) throws IOException{
		List<Market> list = marketService.marketList(page);
		JSONArray jarr = new JSONArray();
		
		//list를 jarr로 복사하기
		for(Market m : list) {
			//추출한 user를 json 객체에 담기
			JSONObject jmarket = new JSONObject();
			jmarket.put("market_title", m.getMarket_title());
			jmarket.put("market_no", m.getMarket_no());
			jmarket.put("market_note", m.getMarket_note());
			jmarket.put("market_img", m.getMarket_img());
			
			jarr.add(jmarket);
		}
		//전송용 최종 json 객체 선언
		JSONObject sendJson = new JSONObject();
		sendJson.put("list", jarr);
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.append(sendJson.toJSONString());
		out.flush();
		out.close();
	}
	
	@RequestMapping("reviewList.do")
	public void reiviewList(Market mk,HttpServletResponse response,@RequestParam("Rpage") int currentPage)
	throws IOException{
		JSONArray jarr = new JSONArray();
		
		ArrayList<Review> reviewList = marketService.selectReviewList(mk,currentPage);
		int limit = 10;
		int listCount = marketService.selectReviewCount(mk);
		int maxPage=(int)((double)listCount/limit+0.9); //ex) 41개면 '5'페이지나와야되는데 '5'를 계산해줌
		int startPage=((int)((double)currentPage/5+0.8)-1)*5+1;
		int endPage=startPage+5-1;
		
		if(maxPage<endPage) {
			endPage = maxPage;
		}
		
		for(Review rv : reviewList) {
			JSONObject jsq = new JSONObject();
			jsq.put("review_no",rv.getReview_no());
			jsq.put("review_title", rv.getReview_title());
			jsq.put("member_id", rv.getMember_id());
			jsq.put("review_date", rv.getReview_date().toString());
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
}
