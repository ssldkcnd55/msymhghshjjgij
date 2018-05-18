package com.kh.farm.chat.model.service;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.farm.chat.model.dao.ChatDao;
import com.kh.farm.chat.model.vo.*;
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
	
}
