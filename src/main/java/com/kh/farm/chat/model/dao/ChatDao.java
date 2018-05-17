package com.kh.farm.chat.model.dao;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.farm.chat.model.vo.*;
import com.kh.farm.member.model.vo.*;

@Repository
public class ChatDao {

	public List<ChatList> selectChatList(SqlSessionTemplate sqlSession, Member member) {

		return sqlSession.selectList("chat.selectChatList", member);
	}

	public List<ChatHistory> selectChatHistory(SqlSessionTemplate sqlSession, Chat chat) {

		return sqlSession.selectList("chat.selectChatHistory", chat);
	}
	
}
