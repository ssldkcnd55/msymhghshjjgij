package com.kh.farm.payment.model.dao;

import java.util.*;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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
	
		return sqlSession.insert("payment.insertNewPayment", pm);
	}

	public int deleteFirstPayment(SqlSessionTemplate sqlSession, int group_no) {
		
		return sqlSession.delete("payment.deleteFirstPayment",group_no);
	}

}
