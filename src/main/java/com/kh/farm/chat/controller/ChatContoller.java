package com.kh.farm.chat.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.farm.chat.model.service.ChatService;
import com.kh.farm.chat.model.vo.*;
import com.kh.farm.member.model.service.MemberService;
import com.kh.farm.member.model.vo.Member;

@Controller
public class ChatContoller {
	@Autowired
	private ChatService chatService;
	@Autowired
	private MemberService memberService;

	

}
