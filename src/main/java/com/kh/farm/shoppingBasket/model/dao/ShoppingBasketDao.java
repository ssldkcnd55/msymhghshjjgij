package com.kh.farm.shoppingBasket.model.dao;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.farm.payment.model.vo.Payment;
import com.kh.farm.shoppingBasket.model.vo.*;

@Repository
public class ShoppingBasketDao {

	public List<ShowBasket> selectShoppingBasket(SqlSessionTemplate sqlSession, String member_id) {
		
		
		return sqlSession.selectList("selectShoppingBasket", member_id) ;
	}

	public int selectBasketCount(SqlSessionTemplate sqlSession, String member_id) {
		
		return sqlSession.selectOne("selectBasketCount", member_id);
	}

	public int deleteSoppingBasket(SqlSessionTemplate sqlSession, Map dm) {
		
		return sqlSession.delete("deleteSoppingBasket", dm);
	}

	public int selectBuyAmount(SqlSessionTemplate sqlSession, Payment pm) {
		
	Object result=	sqlSession.selectOne("shoppingBasket.selectBuyAmount", pm);
	if(result==null)
		return 0;
	else
		return Integer.parseInt(result.toString());
		
	}

	public int insertShoppingBasket(SqlSessionTemplate sqlSession, Payment pm) {
		
		return sqlSession.insert("shoppingBasket.insertShoppingBasket", pm);
	}

	public int updateShoppingBasket(SqlSessionTemplate sqlSession, Payment pm) {
		
		return sqlSession.update("shoppingBasket.updateShoppingBasket", pm);
	}

	public int updateBasketAmount(SqlSessionTemplate sqlSession, ShoppingBasket sb) {
		
		return sqlSession.update("shoppingBasket.updateBasketAmount", sb);
	}

	

}
