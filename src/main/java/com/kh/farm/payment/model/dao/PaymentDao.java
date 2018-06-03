package com.kh.farm.payment.model.dao;

import java.util.*;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.farm.auction.model.vo.AuctionHistory;
import com.kh.farm.common.model.vo.PageNumber;
import com.kh.farm.payment.model.vo.Payment;
import com.kh.farm.shoppingBasket.model.vo.*;

@Repository
public class PaymentDao {

	public List<ShowBasket> selectPaymentInfo(SqlSessionTemplate sqlSession, Map dm) {
		
		return  sqlSession.selectList("payment.selectPaymentInfo", dm);
	}

	public ShowBasket selectPaymentInfo(SqlSessionTemplate sqlSession, ShoppingBasket sb) {

		return sqlSession.selectOne("payment.selectPaymentInfoOne", sb);
	}

	public int insertFirstPayment(SqlSessionTemplate sqlSession, Payment pm) {
		sqlSession.insert("payment.insertFirstPayment", pm);

		return pm.getGroup_no();
	}

	public int insertNewPayment(SqlSessionTemplate sqlSession, Payment pm) {
	
		sqlSession.insert("payment.insertNewPayment", pm);
		return pm.getBuy_no();
	}

	public int deleteFirstPayment(SqlSessionTemplate sqlSession, int group_no) {
		
		return sqlSession.delete("payment.deleteFirstPayment",group_no);
	}

	public ArrayList<Payment> selectPaymentHistory(SqlSessionTemplate sqlSession, int currentPage) {
		// TODO Auto-generated method stub
		int startRow =(currentPage-1)*10+1; //1~10, 11~20 계산할 거 ex) 1, 11, 21, 31,)
		int endRow = startRow+9;
		PageNumber pnum = new PageNumber();
		pnum.setStartRow(startRow);
		pnum.setEndRow(endRow);
		List<Payment> ac = sqlSession.selectList("payment.selectPaymentHistory",pnum);
		return (ArrayList)ac;
	}

	public int selectPaymentHistoryCount(SqlSessionTemplate sqlSession) {
		
		int listCount = sqlSession.selectOne("payment.selectPaymentHistoryCount");
		return listCount;
	}

	public int deleteShoppingBasket(SqlSessionTemplate sqlSession, Payment pm) {
		
		return sqlSession.delete("payment.deleteShoppingBasket", pm);
	}

	public List<Integer> selectChatNo(SqlSessionTemplate sqlSession, Map map) {

		return sqlSession.selectList("payment.selectChatNo", map);
	}

	public int selectChatNo(SqlSessionTemplate sqlSession, String your_id) {
	
		return sqlSession.selectOne("payment.selectOneChatNo",your_id);
	}
}
