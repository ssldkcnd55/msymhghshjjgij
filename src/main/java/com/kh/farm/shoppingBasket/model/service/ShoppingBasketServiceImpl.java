package com.kh.farm.shoppingBasket.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.farm.shoppingBasket.model.dao.ShoppingBasketDao;

@Service
public class ShoppingBasketServiceImpl implements ShoppingBasketService{

	@Autowired private ShoppingBasketDao shoppingBasketDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
}
