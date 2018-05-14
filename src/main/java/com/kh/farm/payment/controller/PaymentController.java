package com.kh.farm.payment.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.farm.payment.model.service.PaymentService;

@Controller
public class PaymentController {
@Autowired private PaymentService paymentService;
}
