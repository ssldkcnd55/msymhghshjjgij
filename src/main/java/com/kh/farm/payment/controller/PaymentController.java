package com.kh.farm.payment.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.maven.model.Model;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.farm.auction.model.vo.AuctionHistory;
import com.kh.farm.common.model.vo.PageNumber;
import com.kh.farm.market.model.service.MarketService;
import com.kh.farm.market.model.vo.Market;
import com.kh.farm.member.model.vo.*;
import com.kh.farm.payment.model.service.PaymentService;
import com.kh.farm.payment.model.vo.*;
import com.kh.farm.shoppingBasket.model.vo.*;
import com.sun.org.apache.xpath.internal.operations.Mod;

@Controller
public class PaymentController {
	@Autowired
	private PaymentService paymentService;
	@Autowired
	private MarketService marketService;

	@RequestMapping(value = "deleteFirstPayment.do", method = RequestMethod.POST)
	public void deleteFirstPayment(HttpServletResponse response, @RequestParam(value = "group_no") int group_no)
			throws IOException {
		int result = paymentService.deleteFirstPayment(group_no);
		PrintWriter out = response.getWriter();
		out.flush();
		out.close();
	}

	@RequestMapping(value = "paymentTest.do", method = RequestMethod.POST)
	public void paymentTest(@RequestParam(value = "objList") String list,
			@RequestParam(value = "sellerInfo") String sellerInfo, HttpServletResponse response)
			throws IOException, ParseException {

		
		JSONParser jparser = new JSONParser();
		JSONArray jarr = (JSONArray) jparser.parse(list);

		JSONArray jarr_sel = (JSONArray) jparser.parse(sellerInfo);
		JSONArray rt_jarr = new JSONArray();
		for (int i = 0; i < jarr_sel.size(); i++) {
			JSONObject obj = (JSONObject) jparser.parse((String) jarr_sel.get(i));
	
			int chat_no = paymentService.selectChatNo((String) obj.get("your_id"));
			obj.put("chat_no", chat_no);
			rt_jarr.add(obj);
			
		}
		JSONObject retn_obj = new JSONObject();
		retn_obj.put("rl", rt_jarr);
		PrintWriter out = response.getWriter();
		out.println(retn_obj.toJSONString());
		out.flush();
		out.close();
	}

	@RequestMapping(value = "insertNewPayment.do", method = RequestMethod.POST)
	public void insertNewPayment(@RequestParam(value = "objList") String list,
			@RequestParam(value = "sellerInfo") String sellerInfo, HttpServletResponse response) throws Exception {

		JSONParser jparser = new JSONParser();
		JSONArray jarr = (JSONArray) jparser.parse(list);
		JSONArray sel_jarr = (JSONArray) jparser.parse(sellerInfo);
		JSONArray retn_jarr = new JSONArray();
		int group_no = 0;
		for (int i = 0; i < jarr.size(); i++) {

			Payment pm = new Payment();
			JSONObject job = (JSONObject) jparser.parse((String) jarr.get(i));

			pm.setGroup_no(Integer.parseInt((String) job.get("group_no")));
			if (job.containsKey("market_no"))
				pm.setMarket_no(Integer.parseInt((String) job.get("market_no")));
			else if (job.containsKey("auction_no"))
				pm.setAuction_no(Integer.parseInt((String) job.get("auction_no")));
			pm.setMember_id((String) job.get("member_id"));
			pm.setBuy_amount(Integer.parseInt((String) job.get("buy_amount")));
			pm.setBuy_addr((String) job.get("buy_addr"));
			pm.setBuy_tel((String) job.get("buy_tel"));
			pm.setBuy_name((String) job.get("buy_name"));
			pm.setBuy_request((String) job.get("buy_request"));
			group_no = pm.getGroup_no();
			int buy_no = paymentService.insertNewPayment(pm);
			
			//// 장바구니 삭제////
			paymentService.deleteShoppingBasket(pm);
			/////////////////
			JSONObject obj = (JSONObject) jparser.parse((String) sel_jarr.get(i));
			obj.put("buy_no", buy_no);
			
			int chat_no = paymentService.selectChatNo((String) obj.get("your_id"));
			obj.put("chat_no", chat_no);
			retn_jarr.add(obj);
			
		}
		
		int result = paymentService.deleteFirstPayment(group_no);
		
		JSONObject retn_obj = new JSONObject();
		retn_obj.put("rl", retn_jarr);

		PrintWriter out = response.getWriter();
		out.println(retn_obj.toJSONString());
		out.flush();
		out.close();
	}

	@RequestMapping("makePayment.do")
	public ModelAndView makePayment(@RequestParam("buy_no") String buy_no, ModelAndView mv, HttpSession session) {
		String member_id = ((Member) session.getAttribute("loginUser")).getMember_id();
		StringTokenizer st = new StringTokenizer(buy_no, ",");
		List<String> buyNoList = new ArrayList<String>();
		while (st.hasMoreTokens()) {
			buyNoList.add(st.nextToken());
		}
		Map dm = new HashMap();
		dm.put("member_id", member_id);
		dm.put("buyList", buyNoList);

		ArrayList<ShowBasket> sbl = (ArrayList<ShowBasket>) paymentService.selectPaymentInfo(dm);

		mv.addObject("sbl", sbl);
		mv.setViewName("payment/payment");
		return mv;
	}

	@RequestMapping(value = "marketBuy.do")
	public ModelAndView marketBuy(ModelAndView mv, ShoppingBasket sb, HttpSession session) {

		sb.setMember_id(((Member) session.getAttribute("loginUser")).getMember_id());
		ArrayList<ShowBasket> sbl = new ArrayList<ShowBasket>();
		sbl.add(paymentService.selectPaymentInfo(sb));
		sbl.get(0).setBuy_amount(sb.getBuy_amount());

		mv.addObject("sbl", sbl);
		mv.setViewName("payment/payment");
		return mv;
	}

	@RequestMapping(value = "insertFirstPayment.do", method = RequestMethod.POST)
	public void insertFirstPayment(Payment pm, HttpServletResponse response) throws IOException {
		int group_no = paymentService.insertFirstPayment(pm);

		PrintWriter out = response.getWriter();
		out.append(String.valueOf(group_no));
		out.flush();
		out.close();
	}

	@RequestMapping("payment_history_list.do")
	public void selectPaymentHistory(HttpServletResponse response,@RequestParam("page") int currentPage,Member member)
			throws IOException {
		JSONArray jarr = new JSONArray();

		ArrayList<Payment> AuctionList = paymentService.selectPaymentHistory(currentPage);
		ArrayList<Market> MarketList = marketService.selectCusMarketThree();
		
		int limitPage = 10;	
		int listCount = paymentService.selectPaymentHistoryCount();

		int maxPage = (int) ((double) listCount / limitPage + 0.9); // ex) 41개면 '5'페이지나와야되는데 '5'를 계산해줌
		int startPage = ((int) ((double) currentPage / 5 + 0.8) - 1) * 5 + 1;
		int endPage = startPage + 5 - 1;

		if (maxPage < endPage) {
			endPage = maxPage;
		}
		for (Payment ac : AuctionList) {
			if(member.getMember_id().equals(ac.getMember_id())) {
			JSONObject json = new JSONObject();
			json.put("rnum", ac.getRnum());
			json.put("buy_no", ac.getBuy_no());
			json.put("group_no", ac.getGroup_no());
			json.put("market_no", ac.getMarket_no());
			for(Market ab : MarketList) {
				if(ac.getMarket_no() == ab.getMarket_no()) {
					json.put("market_title", ab.getMarket_title());
					json.put("buy_price", ac.getBuy_amount() * ab.getMarket_price());
				}
			}
			json.put("auction_no", ac.getAuction_no());
			json.put("member_id", ac.getMember_id());
			json.put("buy_date", ac.getBuy_date().toString());
			json.put("buy_amount", ac.getBuy_amount());
			json.put("buy_addr", ac.getBuy_addr());
			json.put("buy_tel", ac.getBuy_tel());
			json.put("buy_name", ac.getBuy_name());
			json.put("buy_status", ac.getBuy_status());
			json.put("buy_request", ac.getBuy_request());
			json.put("buy_transport_name", ac.getBuy_transport_name());
			json.put("buy_transport_no", ac.getBuy_transport_no());
			json.put("startPage", startPage);
			json.put("endPage", endPage);
			json.put("maxPage", maxPage);
			json.put("currentPage", currentPage);
			jarr.add(json);
			}
		}

		JSONObject sendJson = new JSONObject();
		sendJson.put("list", jarr);
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.append(sendJson.toJSONString());
		out.flush();
		out.close();

	}

	@RequestMapping("payment_seller_history_list.do")
	public void selectSellerPaymentHistory(HttpServletResponse response,@RequestParam("page") int currentPage,PageNumber pa,Member mem)
			throws IOException {
		JSONArray jarr = new JSONArray();

		ArrayList<Payment> AuctionList = paymentService.selectSellerPaymentHistory(currentPage,pa);
		int limitPage = 10;	
		int listCount = paymentService.selectSellerPaymentHistoryCount();
		int maxPage = (int) ((double) listCount / limitPage + 0.9); // ex) 41개면 '5'페이지나와야되는데 '5'를 계산해줌
		int startPage = ((int) ((double) currentPage / 5 + 0.8) - 1) * 5 + 1;
		int endPage = startPage + 5 - 1;

		if (maxPage < endPage) {
			endPage = maxPage;
		}
		for (Payment ac : AuctionList) {
			JSONObject json = new JSONObject();
			json.put("rnum", ac.getRnum());
			json.put("buy_no", ac.getBuy_no());
			json.put("group_no", ac.getGroup_no());
			json.put("market_no", ac.getMarket_no());
			json.put("market_title", ac.getMarket_title());
			json.put("auction_no", ac.getAuction_no());
			json.put("member_id", ac.getMember_id());
			json.put("buy_date", ac.getBuy_date().toString());
			json.put("buy_amount", ac.getBuy_amount());
			json.put("buy_addr", ac.getBuy_addr());
			json.put("buy_tel", ac.getBuy_tel());
			json.put("buy_name", ac.getBuy_name());
			json.put("buy_status", ac.getBuy_status());
			json.put("buy_request", ac.getBuy_request());
			json.put("buy_transport_name", ac.getBuy_transport_name());
			json.put("buy_transport_no", ac.getBuy_transport_no());
			json.put("startPage", startPage);
			json.put("endPage", endPage);
			json.put("maxPage", maxPage);
			json.put("currentPage", currentPage);
			jarr.add(json);
		}

		JSONObject sendJson = new JSONObject();
		sendJson.put("list", jarr);
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.append(sendJson.toJSONString());
		out.flush();
		out.close();

	}
	
	@RequestMapping(value = "movePaymentComplete.do", method = RequestMethod.POST)
	public ModelAndView movePaymentComplete(ModelAndView mv, PaymentComplete pc) {

		mv.addObject("pc", pc);
		mv.setViewName("payment/payment_complete");
		return mv;
	}
	@RequestMapping(value="orderDeliveryDetail.do")
	public ModelAndView selectOrderDeliveryDetail(ModelAndView mv,HttpServletResponse response,@RequestParam("buy_no") int buy_no ) {
		Payment pm = paymentService.selectOrderDeliveryDetail(buy_no);
		
		mv.addObject("payment",pm);
		mv.setViewName("payment/orderDeliveryDetail");
		return mv;
		
	}
	@RequestMapping("buyComplete.do")
	public void buyComplete(HttpServletResponse response,@RequestParam("buy_no") int buy_no) {
		int buyComplete = paymentService.updateBuyComplete(buy_no);
		int buyPoint = paymentService.insertPoint(buy_no);
	}
	@RequestMapping("transportUpdate.do")
	public void transportUpdate(HttpServletResponse response,Payment payment) {
		int buyTransport = paymentService.updateBuyTransport(payment);
	}
}
