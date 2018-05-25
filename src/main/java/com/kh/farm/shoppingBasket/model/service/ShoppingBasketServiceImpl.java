package com.kh.farm.shoppingBasket.model.service;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
