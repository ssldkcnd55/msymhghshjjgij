package com.kh.farm.chat.handler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.*;
import java.util.*;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kh.farm.chat.model.service.*;
import com.kh.farm.chat.model.vo.Chat;
import com.kh.farm.chat.model.vo.ChatHistory;

public class ChatHandler extends TextWebSocketHandler {

	private Map<String, WebSocketSession> wsMap = new HashMap<String, WebSocketSession>();
	
	@Autowired
	private ChatService chatService;


	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {

		String payloadMessage = (String) message.getPayload();
		Map<String, Object> map = session.getAttributes();

		
		//case 1  상대방이 접속중 and 채팅방 접속중
		//case 2  상대방 접속중이 and 채팅방 접속x
		//case 3 상대방 로그아웃 
		
		//메세지 명령 왔을 떄~
		if (map.get("state") != null && map.get("state").equals("msg")) {
			String chat_room2 = (String) map.get("chat_room2");
			String your_id = (String) map.get("your_id");
			if( wsMap.containsKey(your_id) )
			{
				if(wsMap.containsKey(chat_room2))
				{//case 1
					
					wsMap.get(chat_room2).sendMessage(new TextMessage("you" + payloadMessage));
					session.sendMessage(new TextMessage("meo" + payloadMessage));
					chatService.insertChatHistory(new ChatHistory(Integer.parseInt((String) map.get("chat_no")),
							(String) map.get("my_id"), payloadMessage, null, "Y"));
				}
				else
				{//case 2
					wsMap.get(your_id).sendMessage(new TextMessage("new"));
					if( map.get("state2") != null && map.get("state2").equals("sel") )
					{wsMap.get(your_id).sendMessage(new TextMessage("sel"));}
					else if (map.get("state2") != null && map.get("state2").equals("mom"))
					{wsMap.get(your_id).sendMessage(new TextMessage("mom"));}
					session.sendMessage(new TextMessage("mex" + payloadMessage));
					chatService.insertChatHistory(new ChatHistory(Integer.parseInt((String) map.get("chat_no")),
							(String) map.get("my_id"), payloadMessage, null, "N"));
					
				}
			}
			else
			{//case 3
				session.sendMessage(new TextMessage("mex" + payloadMessage));
				chatService.insertChatHistory(new ChatHistory(Integer.parseInt((String) map.get("chat_no")),
						(String) map.get("my_id"), payloadMessage, null, "N"));
			}
			
			
		}
		
		
		/*if (map.get("state") != null && map.get("state").equals("msg")) {
			
			String chat_room2 = (String) map.get("chat_room2");
			if (wsMap.containsKey(chat_room2)) {
				wsMap.get(chat_room2).sendMessage(new TextMessage("you" + payloadMessage));
				session.sendMessage(new TextMessage("meo" + payloadMessage));
				chatService.insertChatHistory(new ChatHistory(Integer.parseInt((String) map.get("chat_no")),
						(String) map.get("my_id"), payloadMessage, null, "Y"));
			}
			// 상대가 접속중이 아니라면 DB업데이트 ( CHAT_HISTORY_ALARM = 'N')
			else {
				session.sendMessage(new TextMessage("mex" + payloadMessage));
				chatService.insertChatHistory(new ChatHistory(Integer.parseInt((String) map.get("chat_no")),
						(String) map.get("my_id"), payloadMessage, null, "N"));

			}
		}*/
	}

	// 웹소켓 서버에 클라이언트가 접속하면 호출되는 메소드
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {

		Map<String, Object> map = session.getAttributes();
		String my_id = (String) map.get("my_id");
		if (map.get("state") != null && map.get("state").equals("msg")) {
			String chat_room1 = (String) map.get("chat_room1");
			String chat_room2 = (String) map.get("chat_room2");
			String chat_no = (String) map.get("chat_no");

			String your_id = (String) map.get("your_id");
			//////////////// DB에서 where chat_no = chat_no and member_id=your_id =>
			//////////////// CHAT_HISTORY_ALARM ='Y' 업데이트
			//chatService.updateChatHistoryAlarm(new Chat(Integer.parseInt(chat_no), my_id, your_id));
			if (wsMap.containsKey(chat_room1)) { // 내가 이미 접속중이면 replace
				wsMap.replace(chat_room1, session);
			} else {
				wsMap.put(chat_room1, session);
			}

			// 상대방 접속중
			if (wsMap.containsKey(your_id)) {
				//나에게 상대방의 접속중 알림
				session.sendMessage(new TextMessage("lin"));
				if( wsMap.containsKey(chat_room2)) {
				// 상대방에게 나의 접속 사실 알림
				wsMap.get(chat_room2).sendMessage(new TextMessage("cin"));
				}
			} else {
				// 나에게 상대방 접속종료 알림
				session.sendMessage(new TextMessage("lou"));
			}
			//카운트 리셋 메시지
			if(wsMap.containsKey(my_id))
			{	
				wsMap.get(my_id).sendMessage(new TextMessage("new"));
			}
		} else if (map.get("state") != null && map.get("state").equals("login")) {
			if (wsMap.containsKey(my_id)) {
				wsMap.replace(my_id, session);
			} else {
				wsMap.put(my_id, session);
			}
			ArrayList<String> friends = (ArrayList<String>) chatService.selectChatFriends(my_id);
			for (String s : friends) {
				if (wsMap.containsKey(s)) {
					wsMap.get(s).sendMessage(new TextMessage("lin"));
				}
			}
		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		Map<String, Object> map = session.getAttributes();
		String my_id = (String) map.get("my_id");
		// 채팅창 끌때 세션 제거
		if (map.get("state") != null && map.get("state").equals("msg")) {
			wsMap.remove((String) map.get("chat_room1"));

			// 상대방에게 접속종료 사실 알림
			String chat_room2 = (String) map.get("chat_room2");
			if (wsMap.containsKey(chat_room2)) {
				// wsMap.get(chat_room2).sendMessage(new TextMessage("mot"));
			}

		}
		else if (map.get("state")!=null && map.get("state").equals("login")) {
			ArrayList<String> friends = (ArrayList<String>) chatService.selectChatFriends((String) map.get("my_id"));
			for (String s : friends) {
				if (wsMap.containsKey(s)) {
					wsMap.get(s).sendMessage(new TextMessage("lou"));
				}
			}
			wsMap.remove(my_id);
		}

	}

	// 메시지 전송시나 접속해제시 오류가 발생할 때 호출되는 메소드

	@Override
	public void handleTransportError(WebSocketSession session,Throwable exception) throws Exception {

		super.handleTransportError(session, exception);

		System.out.println("전송오류 발생");

	}

}
