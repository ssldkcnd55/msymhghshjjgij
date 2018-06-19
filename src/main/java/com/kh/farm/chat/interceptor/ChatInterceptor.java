package com.kh.farm.chat.interceptor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

import com.kh.farm.chat.model.service.ChatService;
import com.kh.farm.member.model.vo.*;

public class ChatInterceptor extends HttpSessionHandshakeInterceptor{

	
	 @Override

	    public boolean beforeHandshake(ServerHttpRequest request,ServerHttpResponse response, WebSocketHandler wsHandler,

	         Map<String, Object> attributes) throws Exception {     

	        // 위의 파라미터 중, attributes 에 값을 저장하면 웹소켓 핸들러 클래스의 WebSocketSession에 전달된다
	
		 HttpServletRequest hsr = ((ServletServerHttpRequest) request).getServletRequest() ;


	        /*String userId = hsr.getParameter("userid");

	        System.out.println("param, id:"+userId);

	        attributes.put("userId", userId);*/

	        // HttpSession 에 저장된 이용자의 아이디를 추출하는 경우
		 String my_id=((Member)hsr.getSession().getAttribute("loginUser")).getMember_id();
		 
		 if(hsr.getParameter("state")!=null && hsr.getParameter("state").equals("login"))
		 {	 attributes.put("my_id",my_id);
			 attributes.put("state", "login");
		 }else if( hsr.getParameter("state")!=null && hsr.getParameter("state").equals("msg"))
		 {
			 String your_id=(String)hsr.getParameter("your_id");
			 String chat_no=(String)hsr.getParameter("chat_no");
			 attributes.put("my_id",my_id);
			 attributes.put("chat_room1", chat_no+"_"+my_id);
			 attributes.put("chat_room2", chat_no+"_"+your_id);
			 attributes.put("your_id",your_id);
			 attributes.put("chat_no", chat_no);
			 attributes.put("state", "msg");
		 }else if(hsr.getParameter("state")!=null && hsr.getParameter("state").equals("mar")) {
			 String your_id=(String)hsr.getParameter("your_id");
			 String chat_no=(String)hsr.getParameter("chat_no");
			 attributes.put("your_id",your_id);
			 attributes.put("chat_no", chat_no);
			 attributes.put("my_id","system");
			 attributes.put("chat_room1", chat_no+"_"+"system");
			 attributes.put("chat_room2", chat_no+"_"+your_id);
			 attributes.put("state", "msg");
			 attributes.put("state2", "sel");
		 }
		 else if(hsr.getParameter("state")!=null && hsr.getParameter("state").equals("mom")) {
			 String your_id=(String)hsr.getParameter("your_id");
			 String chat_no=(String)hsr.getParameter("chat_no");
			 attributes.put("your_id",your_id);
			 attributes.put("chat_no", chat_no);
			 attributes.put("my_id","system");
			 attributes.put("chat_room1", chat_no+"_"+"system");
			 attributes.put("chat_room2", chat_no+"_"+your_id);
			 attributes.put("state", "msg");
			 attributes.put("state2", "mom");
		 }
	        return super.beforeHandshake(request, response, wsHandler, attributes);

	    }


	
	
	@Override
	public void afterHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler,
			Exception ex) {
		
		super.afterHandshake(request, response, wsHandler, ex);
	}
}
