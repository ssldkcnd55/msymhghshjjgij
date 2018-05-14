package com.kh.farm.market.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.farm.market.model.service.MarketService;

@Controller
public class MarketController {
@Autowired private MarketService marketService;
}
