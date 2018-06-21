package com.kh.farm.chat.model.service;

import java.util.*;

import com.kh.farm.chat.model.vo.*;
import com.kh.farm.market.model.vo.Market;
import com.kh.farm.member.model.vo.*;

public interface ChatService {

	List<ChatList> selectChatList(Member member);
	List<ChatHistory> selectChatHistory(Chat chat);
	int updateChatHistoryAlarm(Chat chat);
	int insertChatHistory(ChatHistory chatHistory);
	List<Member> selectChatMember(String sv);
	int selectChatNo(Chat chat);
	int insertChat(Chat chat);
	List<String> selectChatFriends(String member_id);
	int selectAlarmCount(String member_id);
	Market selectRecentViewMarketList(Market m);
	List<String> selectChatImages(int chat_no);
}
