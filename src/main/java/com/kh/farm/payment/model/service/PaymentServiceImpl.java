package com.kh.farm.payment.model.service;

import java.util.*;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.farm.chat.model.service.ChatService;
import com.kh.farm.chat.model.service.ChatServiceImpl;
import com.kh.farm.chat.model.vo.*;
import com.kh.farm.common.model.vo.PageNumber;
import com.kh.farm.payment.model.dao.PaymentDao;
import com.kh.farm.payment.model.vo.*;
import com.kh.farm.shoppingBasket.model.vo.*;

@Service
public class PaymentServiceImpl implements PaymentService{
@Autowired private PaymentDao paymentDao;
@Autowired private ChatService chatService;
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
		
		 Object obj= paymentDao.selectChatNo(sqlSession, your_id);
		 
		 if(obj==null)
		 {
			 Chat chat = new Chat();
				chat.setMember_id1(your_id);
				chat.setMember_id2("system");
				return chatService.insertChat(chat);
		 }else
		 {
			 return Integer.parseInt(obj.toString());
		 }
		 
	}
	@Override
	public Payment selectOrderDeliveryDetail(int buy_no) {
		
		return paymentDao.selectOrderDeliveryDetail(sqlSession,buy_no);
	}
	@Override
	public ArrayList<Payment> selectSellerPaymentHistory(int currentPage,PageNumber pa) {
		// TODO Auto-generated method stub
		return paymentDao.selectSellerPaymentHistory(sqlSession,currentPage,pa);
	}
	@Override
	public int selectSellerPaymentHistoryCount() {
		// TODO Auto-generated method stub
		return paymentDao.selectSellerPaymentHistoryCount(sqlSession);
	}
	@Override
	public int updateBuyComplete(int buy_no) {
		// TODO Auto-generated method stub
		return paymentDao.updateBuyComplete(sqlSession,buy_no);
	}
	@Override
	public int insertPoint(int buy_no) {
		// TODO Auto-generated method stub
		return paymentDao.insertPoint(sqlSession,buy_no);
	}
	@Override
	public int updateBuyTransport(Payment payment) {
		// TODO Auto-generated method stub
		return paymentDao.updateBuyTransport(sqlSession,payment);
	}
	
}
