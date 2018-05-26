package com.kh.farm.payment.model.service;

import java.util.*;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.farm.payment.model.dao.PaymentDao;
import com.kh.farm.shoppingBasket.model.vo.*;

@Service
public class PaymentServiceImpl implements PaymentService{
@Autowired private PaymentDao paymentDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Override
	public ArrayList<ShowBasket> selectPaymentInfo(Map dm) {
		
		return (ArrayList<ShowBasket>)paymentDao.selectPaymentInfo(sqlSession,dm);
	}
	@Override
	public ShowBasket selectPaymentInfo(ShoppingBasket sb) {
	
		return paymentDao.selectPaymentInfo(sqlSession,sb);
	}
}
