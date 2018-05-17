package com.kh.farm.chat.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.farm.chat.model.service.ChatService;
import com.kh.farm.chat.model.vo.*;
import com.kh.farm.member.model.vo.Member;

@Controller
public class ChatContoller {
 @Autowired private ChatService chatService;
 
 @RequestMapping("chatList.do")
 public String selectChatList(HttpSession session)
 {
	 
	 Member member=(Member)session.getAttribute("loginUser");
	ArrayList<ChatList> chatList= (ArrayList<ChatList>)chatService.selectChatList(member);
	 System.out.println(chatList);
	 return "home";
 }
 
 
}
