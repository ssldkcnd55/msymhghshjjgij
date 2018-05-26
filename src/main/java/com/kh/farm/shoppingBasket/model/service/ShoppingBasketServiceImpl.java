package com.kh.farm.shoppingBasket.model.service;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.farm.payment.model.vo.Payment;
import com.kh.farm.shoppingBasket.model.dao.ShoppingBasketDao;
import com.kh.farm.shoppingBasket.model.vo.*;

@Service
public class ShoppingBasketServiceImpl implements ShoppingBasketService{

	@Autowired private ShoppingBasketDao shoppingBasketDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Override
	public List<ShowBasket> selectShoppingBasket(String member_id) {
		
		return shoppingBasketDao.selectShoppingBasket(sqlSession,member_id);
	}
	@Override
	public int selectBasketCount(String member_id) {
		
		return shoppingBasketDao.selectBasketCount(sqlSession,member_id);
	}
	@Override
	public void deleteSoppingBasket(Map dm) {
	
		int result =shoppingBasketDao.deleteSoppingBasket(sqlSession,dm);
	}
	@Override
	public int selectBuyAmount(Payment pm) {
		
		return shoppingBasketDao.selectBuyAmount(sqlSession,pm);
	}
	@Override
	public void insertShoppingBasket(Payment pm) {
		int result= shoppingBasketDao.insertShoppingBasket(sqlSession,pm);
	}
	@Override
	public void updateShoppingBasket(Payment pm) {
		
		int result= shoppingBasketDao.updateShoppingBasket(sqlSession,pm);
	}
	@Override
	public void updateBasketAmount(ShoppingBasket sb) {
		int result = shoppingBasketDao.updateBasketAmount(sqlSession,sb);
	}
	
	
}
