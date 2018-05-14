package com.kh.farm.shoppingBasket.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.farm.shoppingBasket.model.service.ShoppingBasketService;

@Controller
public class ShoppingBasketController {
@Autowired private ShoppingBasketService shoppingBasketService;
}
