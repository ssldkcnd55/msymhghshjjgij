package com.kh.farm.shoppingBasket.model.service;

import java.util.*;

import com.kh.farm.payment.model.vo.Payment;
import com.kh.farm.shoppingBasket.model.vo.*;

public interface ShoppingBasketService {

	List<ShowBasket> selectShoppingBasket(String member_id);

	int selectBasketCount(String member_id);

	void deleteSoppingBasket(Map dm);

	int selectBuyAmount(Payment pm);

	void insertShoppingBasket(Payment pm);

	void updateShoppingBasket(Payment pm);

	void updateBasketAmount(ShoppingBasket sb);

	

	

}
