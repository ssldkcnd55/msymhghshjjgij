package com.kh.farm.payment.model.dao;

import java.util.*;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.farm.shoppingBasket.model.vo.*;

@Repository
public class PaymentDao {

	public List<ShowBasket> selectPaymentInfo(SqlSessionTemplate sqlSession, Map dm) {
		
		return  sqlSession.selectList("payment.selectPaymentInfo", dm);
	}

	public ShowBasket selectPaymentInfo(SqlSessionTemplate sqlSession, ShoppingBasket sb) {

		return sqlSession.selectOne("payment.selectPaymentInfoOne", sb);
	}

}
