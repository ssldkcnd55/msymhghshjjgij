package com.kh.farm.payment.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.farm.member.model.vo.*;
import com.kh.farm.payment.model.service.PaymentService;
import com.kh.farm.payment.model.vo.Payment;
import com.kh.farm.shoppingBasket.model.vo.*;

@Controller
public class PaymentController {
@Autowired private PaymentService paymentService;
	
	@RequestMapping(value="deleteFirstPayment.do", method=RequestMethod.POST)
	public void deleteFirstPayment (HttpServletResponse response, @RequestParam(value="group_no") int group_no) throws IOException
	{	
		int result = paymentService.deleteFirstPayment(group_no);
		PrintWriter out = response.getWriter();
		out.flush();
		out.close();
	}


	@RequestMapping(value="insertNewPayment.do",method=RequestMethod.POST)
	public void insertNewPayment( @RequestParam(value = "objList[]") List<String> objList ,HttpServletResponse response) throws Exception
	{	
		
		JSONParser jparser = new JSONParser();
		for(String s:objList) {
		JSONObject job = (JSONObject)jparser.parse(s);
		Payment pm = new Payment();
		
		pm.setGroup_no(Integer.parseInt((String) job.get("group_no")));
		pm.setGroup_no(10);
		if(job.containsKey("market_no"))
			pm.setMarket_no(Integer.parseInt((String) job.get("market_no")));
		else if(job.containsKey("auction_no"))
			pm.setAuction_no(Integer.parseInt((String) job.get("auction_no")));
		pm.setMember_id((String)job.get("member_id"));
		pm.setBuy_amount(Integer.parseInt((String) job.get("buy_amount")));
		pm.setBuy_addr((String)job.get("buy_addr"));
		pm.setBuy_tel((String)job.get("buy_tel"));
		pm.setBuy_name((String)job.get("buy_name"));
		pm.setBuy_request((String)job.get("buy_request"));
		
		paymentService.insertNewPayment(pm);
		
		}
		JSONObject job = (JSONObject)jparser.parse(objList.get(0));
		int result = paymentService.deleteFirstPayment(Integer.parseInt((String) job.get("group_no")));
		PrintWriter out = response.getWriter();
		out.flush();
		out.close();
	}
	
	@RequestMapping("makePayment.do")
	public ModelAndView makePayment(@RequestParam("buy_no") String buy_no,ModelAndView mv,HttpSession session)
	{	
		String member_id = ((Member) session.getAttribute("loginUser")).getMember_id();
		StringTokenizer st = new StringTokenizer(buy_no, ",");
		List<String> buyNoList = new ArrayList<String>();
		while (st.hasMoreTokens()) {
			buyNoList.add(st.nextToken());
		}
		Map dm = new HashMap();
		dm.put("member_id", member_id);
		dm.put("buyList", buyNoList);
		
		ArrayList<ShowBasket> sbl = (ArrayList<ShowBasket>)paymentService.selectPaymentInfo(dm);
	
		
		mv.addObject("sbl",sbl);
		mv.setViewName("payment/payment");
		return mv;
	}

	@RequestMapping(value="marketBuy.do" )
	public ModelAndView marketBuy( ModelAndView mv, ShoppingBasket sb,HttpSession session)
	{	
		
		sb.setMember_id( ((Member) session.getAttribute("loginUser")).getMember_id());
		ArrayList<ShowBasket> sbl = new ArrayList<ShowBasket>();
		sbl.add( paymentService.selectPaymentInfo(sb) );
		sbl.get(0).setBuy_amount(sb.getBuy_amount());
	
		
		
		mv.addObject("sbl",sbl);
		mv.setViewName("payment/payment");
		return mv;
	}
	
	@RequestMapping(value="insertFirstPayment.do",method=RequestMethod.POST)
	public void insertFirstPayment(Payment pm,HttpServletResponse response) throws IOException
	{
		int group_no = paymentService.insertFirstPayment(pm);
		PrintWriter out = response.getWriter();
		out.append( String.valueOf( group_no));
		out.flush();
		out.close();
	}


}
