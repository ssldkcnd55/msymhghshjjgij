package com.kh.farm.chat.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.farm.chat.model.service.ChatService;
import com.kh.farm.chat.model.vo.*;
import com.kh.farm.market.model.vo.Market;
import com.kh.farm.member.model.service.MemberService;
import com.kh.farm.member.model.vo.Member;

@Controller
public class ChatContoller {
	@Autowired
	private ChatService chatService;
	@Autowired
	private MemberService memberService;

	@RequestMapping(value = "recentViewList.do", method = RequestMethod.POST)
	@ResponseBody
	public String selectRecentViewMarketList(HttpServletResponse response, @RequestParam(value = "marketNo[]") List<String> marketNo) throws IOException {
		response.setContentType("application/json; chatset=utf-8;");
		ArrayList<Market> mlist = new ArrayList<Market>();
		JSONArray jarr = new JSONArray();
		for (String s : marketNo) {
			Market m = new Market();
			m.setMarket_no(Integer.parseInt(s));
			m = chatService.selectRecentViewMarketList(m);
			JSONObject j = new JSONObject();
			
			j.put("no", m.getMarket_no());
			j.put("title", URLEncoder.encode(m.getMarket_title(), "utf-8"));
			j.put("img", URLEncoder.encode(m.getMarket_img(), "utf-8"));
			jarr.add(j);
		}
		JSONObject json = new JSONObject();
		json.put("ml", jarr);
		return json.toJSONString();
	}

	@RequestMapping(value = "chatHistory.do", method = RequestMethod.POST)
	@ResponseBody
	public String selectChatHistory(HttpServletResponse response, Chat chat) throws IOException {
		chatService.updateChatHistoryAlarm(chat);
		response.setContentType("application/json; chatset=utf-8;");
		ArrayList<ChatHistory> chatHistory = (ArrayList<ChatHistory>) chatService.selectChatHistory(chat);
		Member you = memberService.selectMember(chat.getMember_id2());
		int alarmCount = chatService.selectAlarmCount(chat.getMember_id1());
		JSONArray jarr = new JSONArray();
		for (ChatHistory c : chatHistory) {
			JSONObject j = new JSONObject();
			j.put("chat_no", c.getChat_no());
			j.put("member_id", c.getMember_id());
			j.put("contents", URLEncoder.encode(c.getChat_history_contents(), "utf-8"));
			j.put("date", c.getChat_history_date());
			j.put("alarm", c.getChat_history_alarm());

			jarr.add(j);
		}
		JSONObject json = new JSONObject();

		json.put("ht", jarr);
		json.put("name", URLEncoder.encode(you.getMember_name(), "utf-8"));
		json.put("img", URLEncoder.encode(you.getMember_img(), "utf-8"));
		json.put("alarmCount", alarmCount);
		return json.toJSONString();
	}

	@RequestMapping(value = "getChatList.do", method = RequestMethod.POST)
	@ResponseBody
	public String getChatList(HttpSession session, HttpServletResponse response) throws IOException {
		Member loginUser = (Member) session.getAttribute("loginUser");
		ArrayList<ChatList> chatList = (ArrayList<ChatList>) chatService.selectChatList(loginUser);
		response.setContentType("application/json; chatset=utf-8;");
		session.removeAttribute("chatList");
		session.setAttribute("chatList", chatList);

		JSONArray jarr = new JSONArray();
		for (ChatList c : chatList) {
			JSONObject j = new JSONObject();
			j.put("chat_no", c.getChat_no());
			j.put("member_id", c.getMember_id());
			j.put("member_name", URLEncoder.encode(c.getMember_name(), "utf-8"));
			j.put("member_img", URLEncoder.encode(c.getMember_img(), "utf-8"));
			j.put("contents", URLEncoder.encode(c.getChat_history_contents(), "utf-8"));
			j.put("date", c.getChat_history_date());
			j.put("alarm", c.getChat_history_alarm());
			jarr.add(j);
		}
		JSONObject json = new JSONObject();
		json.put("cl", jarr);

		return json.toJSONString();

	}

	@RequestMapping(value = "searchChatMember.do", method = RequestMethod.POST)
	@ResponseBody
	public String searchChatMember(@RequestParam(value = "sv") String sv, HttpServletResponse response)
			throws IOException {
		ArrayList<Member> list = (ArrayList<Member>) chatService.selectChatMember(sv);
		response.setContentType("application/json; chatset=utf-8;");

		JSONArray jarr = new JSONArray();
		for (Member m : list) {
			JSONObject j = new JSONObject();
			j.put("member_id", m.getMember_id());
			j.put("member_name", URLEncoder.encode(m.getMember_name(), "utf-8"));
			j.put("member_img", URLEncoder.encode(m.getMember_img(), "utf-8"));

			jarr.add(j);
		}
		JSONObject json = new JSONObject();
		json.put("ml", jarr);

		return json.toJSONString();

	}

	@RequestMapping(value = "insertChat.do", method = RequestMethod.POST)
	@ResponseBody
	public String insertChat(@RequestParam(value = "my_id") String my_id,
			@RequestParam(value = "your_id") String your_id, HttpServletResponse response) {

		Chat chat = new Chat();
		chat.setMember_id1(my_id);
		chat.setMember_id2(your_id);
		chat.setChat_no(chatService.selectChatNo(chat));
		JSONObject json = new JSONObject();
		if (chat.getChat_no() == 0) {
			// chat 생성 서비스
			chat.setChat_no(chatService.insertChat(chat));
		}
		System.out.println(chat.getChat_no());
		json.put("chat_no", chat.getChat_no());
		return json.toJSONString();
	}

}
