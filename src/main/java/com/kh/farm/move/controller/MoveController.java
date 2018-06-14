package com.kh.farm.move.controller;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.farm.member.model.vo.Member;
import com.kh.farm.notice.model.vo.Notice;

@Controller
public class MoveController {
	public MoveController() {}
	
	@RequestMapping("moveSelPaymentHistory.do")
	public String moveSelPaymentHistory() {
		return "member/sellerMy/payment_History";
	}
	@RequestMapping("moveSelmarketHistory.do")
	public String moveSelmarketHistory() {
		return "member/sellerMy/market_History";
	}
	@RequestMapping("moveSelQnaList.do")
	public String moveSelQnaList() {
		return "member/sellerMy/qna_List";
	}
	@RequestMapping("moveSelAuctionHistory.do")
	public String moveSelAuctionHistory() {
		return "member/sellerMy/auction_History";
	}
	
	@RequestMapping("moveGetCookie.do")
	public String moveGetCookie() {
		return "messenger/test_getCookie";
	}
	
	@RequestMapping("moveQna_List.do")
	public String moveQna_List() {
		return "member/customerMy/qna_List";
	}
	
	@RequestMapping("moveDelivery_Number.do")
	public String movedelivery_Number() {
		return "delivery/delivery_Number";
	}
	
	@RequestMapping("movePaymentComplete.do")
	public String movePaymentComplete()
	{
		return "payment/payment_complete";
	}
	
	@RequestMapping("movePaymentHistory.do")
	public String buyHistory() {
		return "member/customerMy/payment_History";
	}
	
	@RequestMapping("moveAuctionHistory.do")
	public String auctionHistory() {
		return "member/customerMy/auction_History";
	}
	
	@RequestMapping("moveCusMemberInfo.do")
	public String moveCusMemberInfo() {
		return "member/customerMy/member_Info";
	}
	
	@RequestMapping("moveSelMemberInfo.do")
	public String moveSelMemberInfo() {
		return "member/sellerMy/member_Info";
	}
	
	@RequestMapping("moveSelSales.do")
	public String moveSelSales() {
		return "member/sellerMy/sales_rate";
	}
	@RequestMapping("moveSmartEditor2Skin.do")
	public String moveSmartEditor2Skin() {
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
	/*@RequestMapping("moveAuction.do")
	public String moveAuction() {
		return "auction/auctionList";
	}*/
/*	@RequestMapping("moveAuctionDetail.do")
	public String moveAuctionDetail() {
		return "auction/auctionDetail";
	}*/
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
		return "member/customerMy/customerMypage";
	}
	@RequestMapping("moveSellerMypage.do")
	public String moveSelMypage() {
		return "member/sellerMy/sellerMypage";
	}
	
	@RequestMapping("moveSelectSignUp.do")
	public ModelAndView moveSelectSignUp(ModelAndView mv, @RequestParam(value="category", required=false) String category) {
		mv.addObject("category" , category);
		mv.setViewName("member/signUp");
		System.out.println(category);
		return mv;
		
	}
	@RequestMapping("moveSignUp2.do")
	public String moveSignUp2() {
		return "member/selectSignUp";
		
	}
	@RequestMapping("moveNotice.do")
	public String moveNotice() {
		return "notice/notice";
	}
	@RequestMapping("moveNotcie_write.do")
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
		//model.addAttribute("id", session.getAttribute("loginUser"));
		return "admin/admin_category";
	}
	
	@RequestMapping("moveAdminMember.do")
	public String moveAdminMember() {
		return "admin/admin_member";
	}
	
	@RequestMapping("moveAcution_write.do")
	public String moveAcution_writePage() {
		return "auction/auctionMake";
	}
	
	@RequestMapping("moveAcutionDetail.do")
	public String moveAcutionDetailPage() {
		return "auction/auctionDetail";
	}
	@RequestMapping("moveMarketQnaMake.do")
	public String moveMarketQnaMake() {
		return "market/marketQnaMake";
	}
	
	@RequestMapping("moveNotice_Detail.do")
	public String moveNotice_DetailPage() {
		return "notice/Notice_Detail";
	}
	
	@RequestMapping("moveQnA_Detail.do")
	public String moveQnA_DetailPage() {
		return "qna/QnA_Detail";
	}
	
	@RequestMapping("moveQnA_write.do")
	public String moveQnA_writePage() {
		return "qna/qnaMake";
	}
	
	@RequestMapping("moveUpdateNotice.do")
	public String moveNotcie_writePage(Model model, Notice notice, @RequestParam(value="notice_no") int notice_no,
			@RequestParam(value="notice_title") String notice_title,@RequestParam(value="notice_contents") String notice_contents) {
		notice.setNotice_no(notice_no);
		notice.setNotice_title(notice_title);
		notice.setNotice_contents(notice_contents);
		model.addAttribute("notice",notice);
		return "notice/noticeUpdate";
	}
	@RequestMapping("moveHeader.do")
	public String moveHeader() {
		return "inc/header";
	}
	
	@RequestMapping("moveAdminReport.do")
	public String moveAdminReport() {
		return "admin/admin_report";
	}
	
	@RequestMapping("moveOrderDeliveryDetail.do")
	public String moveOrderDeliveryDetail() {
		return "payment/orderDeliveryDetail";
	}
	
	@RequestMapping("moveAuctionBidding.do")
	public String moveAuctionBidding() {
		return "member/customerMy/auction_Bidding";
	}
}

