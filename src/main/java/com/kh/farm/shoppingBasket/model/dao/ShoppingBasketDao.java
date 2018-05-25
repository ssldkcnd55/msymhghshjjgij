package com.kh.farm.shoppingBasket.model.dao;

import java.util.ArrayList;
import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.farm.shoppingBasket.model.vo.*;

@Repository
public class ShoppingBasketDao {

	public List<ShowBasket> selectShoppingBasket(SqlSessionTemplate sqlSession, String member_id) {
		
		
		return sqlSession.selectList("selectShoppingBasket", member_id) ;
	}

}
