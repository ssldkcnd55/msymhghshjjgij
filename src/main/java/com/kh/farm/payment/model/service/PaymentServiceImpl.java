package com.kh.farm.payment.model.service;

import java.util.*;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.farm.payment.model.dao.PaymentDao;
import com.kh.farm.payment.model.vo.Payment;
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
	@Override
	public int insertFirstPayment(Payment pm) {
		
		return paymentDao.insertFirstPayment(sqlSession,pm);
	}
	@Override
	public int insertNewPayment(Payment pm) {
		
		return paymentDao.insertNewPayment(sqlSession,pm);
	}
	@Override
	public int deleteFirstPayment(int group_no) {
		
		return paymentDao.deleteFirstPayment(sqlSession,group_no);
	}
	@Override
	public ArrayList<Payment> selectPaymentHistory(int currentPage) {
		return paymentDao.selectPaymentHistory(sqlSession,currentPage);
	}
	@Override
	public int selectPaymentHistoryCount() {
		return paymentDao.selectPaymentHistoryCount(sqlSession);
	}
	@Override
	public int deleteShoppingBasket(Payment pm) {
		
		return paymentDao.deleteShoppingBasket(sqlSession,pm);
	}
	@Override
	public List<Integer> selectChatNo(Map map) {
	
		return paymentDao.selectChatNo(sqlSession,map);
	}
	@Override
	public int selectChatNo(String your_id) {
		
		return paymentDao.selectChatNo(sqlSession, your_id);
	}
	@Override
	public Payment selectOrderDeliveryDetail(int buy_no) {
		
		return paymentDao.selectOrderDeliveryDetail(sqlSession,buy_no);
	}
	
}
