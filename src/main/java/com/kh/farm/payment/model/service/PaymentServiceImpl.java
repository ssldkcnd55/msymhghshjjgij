package com.kh.farm.payment.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.farm.payment.model.dao.PaymentDao;

@Service
public class PaymentServiceImpl implements PaymentService{
@Autowired private PaymentDao paymentDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
}
