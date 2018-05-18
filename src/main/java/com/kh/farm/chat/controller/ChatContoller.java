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
	
	@RequestMapping(value="chatHistory.do" , method=RequestMethod.POST)
	 @ResponseBody
	 public String selectChatHistory(HttpServletResponse response, Chat chat) throws IOException
	 {
		 response.setContentType("application/json; chatset=utf-8;");
		 ArrayList<ChatHistory> chatHistory = (ArrayList<ChatHistory>)chatService.selectChatHistory(chat);
		 Member you= memberService.selectMember(chat.getMember_id2());
		 System.out.println(you);
		 JSONArray jarr = new JSONArray();
		 for(ChatHistory c : chatHistory)
		 {
			 JSONObject j = new JSONObject();
			 j.put("chat_no", c.getChat_no());
			 j.put("member_id", c.getMember_id());
			 j.put("contents", URLEncoder.encode(c.getChat_history_contents(),"utf-8" ));
			 j.put("date", c.getChat_history_date());
			 j.put("alarm", c.getChat_history_alarm());
			 
			 jarr.add(j);
		 }
		 JSONObject json = new JSONObject();
		 json.put("ht", jarr);
		 json.put("name", URLEncoder.encode(you.getMember_name(),"utf-8"));
		 json.put("img", URLEncoder.encode(you.getMember_img(),"utf-8"));

		return json.toJSONString();
	 }

}
