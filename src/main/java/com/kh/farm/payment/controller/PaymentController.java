package com.kh.farm.payment.controller;

import java.util.*;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.farm.member.model.vo.*;
import com.kh.farm.payment.model.service.PaymentService;
import com.kh.farm.shoppingBasket.model.vo.*;

@Controller
public class PaymentController {
@Autowired private PaymentService paymentService;

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


}
