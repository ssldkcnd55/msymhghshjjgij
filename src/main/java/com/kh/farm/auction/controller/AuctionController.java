package com.kh.farm.auction.controller;


import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	/*경매 등록시 DB저장*/
	@RequestMapping(value="insertAuctionMake.do", method=RequestMethod.POST)
	public String insertAuctionMake(Auction auction, ModelAndView mv,HttpServletResponse response){
		int insertAuctionMake =  auctionService.insertAuctionMake(auction);
		System.out.println("insertAuctionMake : "+insertAuctionMake);
		
		//mv.addObject("auction", insertAuctionMake);
		/*mv.setViewName("/farm/AuctionList_controller.do");*/
		return "forward:/AuctionList_controller.do";
		
	}
	
	/*경매 메인 list뿌려주기*/
	@RequestMapping(value="AuctionList_controller.do")
	public String AuctionList(Auction auction, Model model){		
		List<Auction> AuctionList =  auctionService.selectAuctionList();
		System.out.println(AuctionList.size());
		model.addAttribute("auctionlist", AuctionList);
		return "auction/auctionList";	
	}
	
	/*경매 디테일*/
	@RequestMapping(value="AuctionDetail_controller.do")
	public String selectAuctionDetail(Model model, @RequestParam(value="auction_no") int auction_no) {
		Auction selectAuctionDetail = auctionService.selectAuctionDetail(auction_no);
		model.addAttribute("auction", selectAuctionDetail);
		return "auction/auctionDetail";
	}
	
	
}
