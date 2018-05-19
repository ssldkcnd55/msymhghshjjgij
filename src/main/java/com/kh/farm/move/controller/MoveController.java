package com.kh.farm.move.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MoveController {
	public MoveController() {}
	
	
	@RequestMapping("moveSmartEditor2Skin.do")
	public String moveSmartEditor2Skin()
	{
		return "naver/SmartEditor2Skin";
	}
	
	@RequestMapping("moveHome.do")
	public String moveHomePage() {
		return "home";
	}
	@RequestMapping("moveMessenger.do")
	public String moveMessengerPage() {
		return "messenger/messenger";
	}
	@RequestMapping("moveMarket.do")
	public String moveMarket() {
		return "market/marketList";
	}
	@RequestMapping("moveMarketDetail.do")
	public String moveMarketDetail() {
		return "market/marketDetail";
	}
	@RequestMapping("moveMarketMake.do")
	public String moveMarketMake() {
		return "market/marketMake";
	}
	@RequestMapping("moveAuction.do")
	public String moveAuction() {
		return "auction/auctionList";
	}
	@RequestMapping("moveAuctionDetail.do")
	public String moveAuctionDetail() {
		return "auction/auctionDetail";
	}
	@RequestMapping("moveAuctionMake.do")
	public String moveAuctionMake() {
		return "auction/auctionMake";
	}
	@RequestMapping("moveJob.do")
	public String moveJob() {
		return "job/job";
	}
	@RequestMapping("moveJobDetail.do")
	public String moveJobDetail() {
		return "job/jobDetail";
	}
	@RequestMapping("moveJobMake.do")
	public String moveJobMake() {
		return "job/jobMake";
	}
	@RequestMapping("moveLogin.do")
	public String moveLogin() {
		return "member/login";
	}
	@RequestMapping("moveSignUp.do")
	public String moveSignUp() {
		return "member/signUp";
	}
	@RequestMapping("moveFindPwd.do")
	public String moveFindPwd() {
		return "member/findPwd";
	}
	@RequestMapping("moveFindId.do")
	public String moveFindId() {
		return "member/findId";
	}
	@RequestMapping("moveCustomerMypage.do")
	public String moveCustomerMypage() {
		return "member/customerMypage";
	}
	@RequestMapping("moveNotice.do")
	public String moveNotice() {
		return "notice/notice";
	}
	@RequestMapping("moveNoticeMake.do")
	public String moveNoticeMake() {
		return "notice/noticeMake";
	}
	@RequestMapping("moveNoticeDetail.do")
	public String moveNoticeDetail() {
		return "notice/noticeDetail";
	}
	@RequestMapping("moveQna.do")
	public String moveQna() {
		return "qna/qna";
	}
	@RequestMapping("moveQnaMake.do")
	public String moveQnaMake() {
		return "qna/qnaMake";
	}
	@RequestMapping("moveQnaDetail.do")
	public String moveQnaDetail() {
		return "qna/qnaDetail";
	}
	@RequestMapping("movePayment.do")
	public String movePayment() {
		return "payment/payment";
	}
	@RequestMapping("moveShoppingBasket.do")
	public String moveShoppingBasket() {
		return "shoppingBasket/shoppingBasket";
	}
	@RequestMapping("moveAdminPage.do")
	public String moveAdminPage() {
		return "admin/admin_page";
	}

	@RequestMapping("moveQnAPage.do")
	public String moveQnAPage() {
		return "qna/qna";
	}
	@RequestMapping("moveNoticePage.do")
	public String moveNoticePage() {
		return "notice/notice";
		
	}

	@RequestMapping("moveQuote.do")
	public String moveQuote() {
		return "quote/quote";

	}
	
	@RequestMapping("moveAdminCategory.do")
	public String moveAdminCategory() {
		return "admin/admin_category";
	}
	
	@RequestMapping("moveAcution_write.do")
	public String moveAcution_writePage() {
		return "auction/auctionMake";
	}
	
	@RequestMapping("moveAcutionDetail.do")
	public String moveAcutionDetailPage() {
		return "auction/auctionDetail";
	}
	
}

