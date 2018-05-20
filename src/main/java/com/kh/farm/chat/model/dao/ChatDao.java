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

	public int updateChatHistoryAlarm(SqlSessionTemplate sqlSession, Chat chat) {
		return sqlSession.update("chat.updateChatHistoryAlarm", chat);
	}

	public int insertChatHistory(SqlSessionTemplate sqlSession, ChatHistory chatHistory) {
		
		return sqlSession.insert("chat.insertChatHistory", chatHistory);
	}

	public List<Member> selectChatMember(SqlSessionTemplate sqlSession, String sv) {
		
		return sqlSession.selectList("chat.selectMemberByNameId", sv);
	}

	public int selectChatNo(SqlSessionTemplate sqlSession, Chat chat) {
		
		Object obj= sqlSession.selectOne("chat.selectChatNo", chat);
		if(obj!=null)
		{
			return ((Integer)obj).intValue();
		}
		else 
		{
			return 0;
		}
	
	}

	public int insertChat(SqlSessionTemplate sqlSession, Chat chat) {
		sqlSession.insert("chat.insertChat",chat)  ;

		return chat.getChat_no();
	}
	
}
