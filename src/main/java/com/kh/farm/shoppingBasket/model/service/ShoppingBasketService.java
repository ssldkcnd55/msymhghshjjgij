package com.kh.farm.shoppingBasket.model.service;

import java.util.*;

import com.kh.farm.shoppingBasket.model.vo.*;

public interface ShoppingBasketService {

	List<ShowBasket> selectShoppingBasket(String member_id);

}
