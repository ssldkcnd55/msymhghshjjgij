package com.kh.farm.chat.model.service;

import java.util.*;

import com.kh.farm.chat.model.vo.*;
import com.kh.farm.member.model.vo.*;

public interface ChatService {

	List<ChatList> selectChatList(Member member);
	List<ChatHistory> selectChatHistory(Chat chat);
	int updateChatHistoryAlarm(Chat chat);
	int insertChatHistory(ChatHistory chatHistory);
	List<Member> selectChatMember(String sv);
	int selectChatNo(Chat chat);
	int insertChat(Chat chat);
}
