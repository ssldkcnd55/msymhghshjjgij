package com.kh.farm.market.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.farm.market.model.service.MarketService;
import com.kh.farm.market.model.vo.Market;

@Controller
public class MarketController {
@Autowired private MarketService marketService;

	@RequestMapping(value="marketList.do")
	public ModelAndView marketList(ModelAndView mv) {
		ArrayList<Market> list = marketService.marketList();
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
}
