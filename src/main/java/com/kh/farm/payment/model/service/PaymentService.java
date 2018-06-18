package com.kh.farm.payment.model.service;


import java.util.*;

import com.kh.farm.common.model.vo.PageNumber;
import com.kh.farm.payment.model.vo.Payment;
import com.kh.farm.shoppingBasket.model.vo.*;

public interface PaymentService {

	ArrayList<ShowBasket> selectPaymentInfo(Map dm);

	ShowBasket selectPaymentInfo(ShoppingBasket sb);

	int insertFirstPayment(Payment pm);

	int insertNewPayment(Payment pm);

	int deleteFirstPayment(int group_no);
	
	ArrayList<Payment> selectPaymentHistory(int currentPage);

	int selectPaymentHistoryCount();

	int deleteShoppingBasket(Payment pm);

	List<Integer> selectChatNo(Map map);

	int selectChatNo(String your_id);

	Payment selectOrderDeliveryDetail(int buy_no);
	
	ArrayList<Payment> selectSellerPaymentHistory(int currentPage,PageNumber pa);

	int selectSellerPaymentHistoryCount();

	int updateBuyComplete(int buy_no);

	int insertPoint(int buy_no);

	int updateBuyTransport(Payment payment);
}
