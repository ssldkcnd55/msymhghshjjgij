package com.kh.farm.shoppingBasket.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.*;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.farm.payment.model.vo.*;
import com.kh.farm.shoppingBasket.model.service.ShoppingBasketService;
import com.kh.farm.shoppingBasket.model.vo.*;
import com.kh.farm.member.model.vo.*;

@Controller
public class ShoppingBasketController {
	@Autowired
	private ShoppingBasketService shoppingBasketService;

	@RequestMapping(value = "addSoppingBasket.do", method = RequestMethod.POST)
	public void addSoppingBasket(Payment pm, HttpServletResponse response) throws IOException {// 기존에 같은 상품이 존재하면 수량만
																								// 바꿔야함																			// 존재하면 수량 가져오자~
		int amount = shoppingBasketService.selectBuyAmount(pm);
		if (amount > 0) {
			// 업데이트
			pm.setBuy_amount(pm.getBuy_amount() + amount);
			shoppingBasketService.updateShoppingBasket(pm);
		} else {
			// 추가
			shoppingBasketService.insertShoppingBasket(pm);
		}

		PrintWriter out = response.getWriter();
		out.flush();
		out.close();
	}

	@RequestMapping(value = "selectShoppingBasket.do", method = RequestMethod.GET)
	public ModelAndView selectShoppingBasket(ModelAndView mv, HttpSession session) {
		ArrayList<ShowBasket> basketList = (ArrayList<ShowBasket>) shoppingBasketService.selectShoppingBasket(((Member) session.getAttribute("loginUser")).getMember_id());
		for(ShowBasket sb:basketList)
		{
			if(sb.getBuy_amount()>sb.getStack())
			{
				sb.setBuy_amount(sb.getStack());
			}
		}
		mv.addObject("basketList", basketList);
		mv.setViewName("shoppingBasket/shoppingBasket");
		return mv;
	}

	@RequestMapping(value = "selectBasketCount.do", method = RequestMethod.POST)
	public void selectBasketCount(String member_id, HttpServletResponse response) throws IOException {
		int count = shoppingBasketService.selectBasketCount(member_id);
		PrintWriter out = response.getWriter();
		out.print(count);
		out.flush();
		out.close();
	}

	@RequestMapping(value = "deleteSoppingBasket.do", method = RequestMethod.POST)
	@ResponseBody
	public String deleteSoppingBasket(String deleteNo, HttpSession session, HttpServletResponse response)
			throws IOException {
		response.setContentType("application/json; chatset=utf-8;");
		String member_id = ((Member) session.getAttribute("loginUser")).getMember_id();
		StringTokenizer st = new StringTokenizer(deleteNo, ",");
		List<String> deleteNoList = new ArrayList<String>();
		while (st.hasMoreTokens()) {
			deleteNoList.add(st.nextToken());
		}
		Map dm = new HashMap();
		dm.put("member_id", member_id);
		dm.put("noList", deleteNoList);
		shoppingBasketService.deleteSoppingBasket(dm);

		ArrayList<ShowBasket> basketList = (ArrayList<ShowBasket>) shoppingBasketService
				.selectShoppingBasket(member_id);

		JSONArray jarr = new JSONArray();

		for (ShowBasket sb : basketList) {
			JSONObject j = new JSONObject();
			j.put("no", sb.getMarket_no());
			j.put("img", URLEncoder.encode(sb.getMarket_img(), "utf-8"));
			j.put("title", URLEncoder.encode(sb.getMarket_title(), "utf-8"));
			j.put("price", sb.getMarket_price());
			if(sb.getBuy_amount()>sb.getStack())
			{
				sb.setBuy_amount(sb.getStack());
			}
			j.put("amount", sb.getBuy_amount());
			j.put("stack", sb.getStack());
			jarr.add(j);
		}
		JSONObject json = new JSONObject();
		json.put("bl", jarr);
		return json.toJSONString();
	}
	
	@RequestMapping(value="updateBasketAmount.do",method=RequestMethod.POST)
	public void updateBasketAmount(HttpSession session,ShoppingBasket sb,HttpServletResponse response) throws IOException
	{
		sb.setMember_id( ((Member)session.getAttribute("loginUser")).getMember_id());
		shoppingBasketService.updateBasketAmount(sb);
		PrintWriter out = response.getWriter();
		out.flush();
		out.close();
	}
}
