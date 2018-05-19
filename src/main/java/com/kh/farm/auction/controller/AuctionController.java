package com.kh.farm.auction.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.farm.auction.model.service.AuctionService;
import com.kh.farm.auction.model.vo.Auction;
import com.kh.farm.member.model.vo.Member;

@Controller
public class AuctionController {

	@Autowired private AuctionService auctionService;
	
	@RequestMapping(value="insertAuctionMake.do", method=RequestMethod.POST)
	public ModelAndView insertAuctionMake(Auction auction, ModelAndView mv,HttpServletResponse response){
		int insertAuctionMake =  auctionService.insertAuctionMake(auction);
		System.out.println("insertAuctionMake : "+insertAuctionMake);
		
		mv.addObject("auction", insertAuctionMake);
		mv.setViewName("auction/auctionDetail");
		return mv;
		
	}
	
	
}
