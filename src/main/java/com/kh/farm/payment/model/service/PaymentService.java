package com.kh.farm.payment.model.service;


import java.util.*;

import com.kh.farm.shoppingBasket.model.vo.*;

public interface PaymentService {

	ArrayList<ShowBasket> selectPaymentInfo(Map dm);

	ShowBasket selectPaymentInfo(ShoppingBasket sb);

}
