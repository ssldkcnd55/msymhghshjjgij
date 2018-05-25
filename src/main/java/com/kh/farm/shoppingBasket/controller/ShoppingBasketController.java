package com.kh.farm.shoppingBasket.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.farm.payment.model.vo.*;
import com.kh.farm.shoppingBasket.model.service.ShoppingBasketService;
import com.kh.farm.shoppingBasket.model.vo.*;
import com.kh.farm.member.model.vo.*;

@Controller
public class ShoppingBasketController {
@Autowired private ShoppingBasketService shoppingBasketService;


	@RequestMapping(value="addSoppingBasket.do",method=RequestMethod.POST)
	public void addSoppingBasket(Payment pm,HttpServletResponse response) throws IOException
	{//기존에 같은 상품이 존재하면 수량만 바꿔야함
		System.out.println(pm);
		PrintWriter out = response.getWriter();
		out.flush();
		out.close();
	}
	
	@RequestMapping(value="selectShoppingBasket.do",method=RequestMethod.GET)
	public ModelAndView selectShoppingBasket(ModelAndView mv,HttpSession session)
	{	ArrayList<ShowBasket> basketList = (ArrayList<ShowBasket>)shoppingBasketService.selectShoppingBasket(((Member)session.getAttribute("loginUser")).getMember_id());
		mv.addObject("basketList", basketList);
		System.out.println(basketList);
		mv.setViewName("shoppingBasket/shoppingBasket");
		return mv;
	}



}
