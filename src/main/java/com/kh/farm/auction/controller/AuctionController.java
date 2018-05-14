package com.kh.farm.auction.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.farm.auction.model.service.AuctionService;

@Controller
public class AuctionController {

	@Autowired private AuctionService auctionService;
}
