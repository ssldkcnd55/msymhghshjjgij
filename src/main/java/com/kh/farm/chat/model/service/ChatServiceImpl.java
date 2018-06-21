package com.kh.farm.chat.model.service;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.farm.chat.model.dao.ChatDao;
import com.kh.farm.chat.model.vo.*;
import com.kh.farm.market.model.vo.Market;
import com.kh.farm.member.model.vo.*;

@Service
public class ChatServiceImpl implements ChatService {

	@Autowired
	private ChatDao chatDao;
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<ChatList> selectChatList(Member member) {

		return chatDao.selectChatList(sqlSession, member);
	}

	@Override
	public List<ChatHistory> selectChatHistory(Chat chat) {

		return chatDao.selectChatHistory(sqlSession, chat);
	}

	@Override
	public int updateChatHistoryAlarm(Chat chat) {
		return chatDao.updateChatHistoryAlarm(sqlSession,chat);
	}

	@Override
	public int insertChatHistory(ChatHistory chatHistory) {
		return chatDao.insertChatHistory(sqlSession,chatHistory);
	}

	@Override
	public List<Member> selectChatMember(String sv) {
		
		return chatDao.selectChatMember(sqlSession,sv);
	}

	@Override
	public int selectChatNo(Chat chat) {
		
		return chatDao.selectChatNo(sqlSession,chat);
	}

	@Override
	public int insertChat(Chat chat) {
		
		return chatDao.insertChat(sqlSession,chat);
	}

	@Override
	public List<String> selectChatFriends(String member_id) {
		
		return chatDao.selectChatFriends(sqlSession,member_id);
	}

	@Override
	public int selectAlarmCount(String member_id) {
		
		return chatDao.selectAlarmCount(sqlSession,member_id);
	}

	@Override
	public Market selectRecentViewMarketList(Market m) {
	
		return chatDao.selectRecentViewMarketList(sqlSession,m);
	}

	@Override
	public List<String> selectChatImages(int chat_no) {
	
		return chatDao.selectChatImages(sqlSession,chat_no);
	}
	
	
}
