package com.kh.farm.chat.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

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

	@RequestMapping("moveMsg_image.do")
	public ModelAndView moveMsg_imagePage(ModelAndView mv,@RequestParam(value="img_name") String img_name,@RequestParam(value="chat_no") int chat_no )
	{	
		ArrayList<String> images=(ArrayList<String>)chatService.selectChatImages(chat_no);
		mv.addObject("images", images);
		mv.addObject("img_name", img_name);
		mv.setViewName("messenger/msg_image");
		return mv;
	}
	
	
	@RequestMapping("msg_img_down.do")
	public ModelAndView fileDownMethod(HttpServletRequest request, @RequestParam("filename") String fileName)
	{
	String path=	request.getSession().getServletContext().getRealPath("resources/upload/chatUpload");
		String filePath = path + "\\" + fileName;
		File downFile = new File(filePath);
		return new ModelAndView("msg_img_down","downFile",downFile);
	}
	
	@RequestMapping(value="msg_saveFile.do",method=RequestMethod.POST)
	public void msgSaveFile(@RequestParam(value="chat_room") String chat_room,@RequestParam(value="file") MultipartFile file,HttpServletResponse response,HttpServletRequest request) throws Exception
	{
		String reName=null;
		String path = request.getSession().getServletContext().getRealPath("resources/upload/chatUpload");
		if(file != null && file.getOriginalFilename()!="") {
		file.transferTo(new File( path+"\\"+file.getOriginalFilename()) );
		String oriName=file.getOriginalFilename();
		reName=chat_room+"_"+(new SimpleDateFormat("yyyyMMddHHmmss")).format(new java.sql.Date(System.currentTimeMillis()))+"."+ file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1);
		File oriFile=new File(path+"\\"+file.getOriginalFilename());
		File reFile = new File(path+"\\"+reName);
		if (!oriFile.renameTo(reFile)) {
			int read = -1;
			byte[] buf = new byte[1024];
			// 원본을 읽기 위한 파일스트림 생성
			FileInputStream fin = new FileInputStream(oriFile);
			// 읽은 내용 기록할 복사본 파일 출력용 파일스트림 생성
			FileOutputStream fout = new FileOutputStream(reFile);

			// 원본 읽어서 복사본에 기록 처리
			while ((read = fin.read(buf, 0, buf.length)) != -1) {
				fout.write(buf, 0, read);
			}
			fin.close();
			fout.close();
			oriFile.delete(); // 원본파일 삭제
		}
		}
		///
		PrintWriter out = response.getWriter();
		out.println(reName);
		out.flush();
		out.close();
	}
	
	@RequestMapping(value="msg_saveImg.do",method = RequestMethod.POST)
	public void msgSaveImg(@RequestParam(value="chat_room") String chat_room,@RequestParam(value="file") MultipartFile file,HttpServletResponse response,HttpServletRequest request) throws Exception
	{
		
		String reName=null;
		Long size = 0L;
		String oriName=null;
		String path = request.getSession().getServletContext().getRealPath("resources/upload/chatUpload");
		if(file != null && file.getOriginalFilename()!="") {
		file.transferTo(new File( path+"\\"+file.getOriginalFilename()) );
		oriName=file.getOriginalFilename();
		reName=chat_room+"_"+(new SimpleDateFormat("yyyyMMddHHmmss")).format(new java.sql.Date(System.currentTimeMillis()))+"."+ file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1);
		File oriFile=new File(path+"\\"+file.getOriginalFilename());
		size = oriFile.length();
		File reFile = new File(path+"\\"+reName);
		if (!oriFile.renameTo(reFile)) {
			int read = -1;
			byte[] buf = new byte[1024];
			// 원본을 읽기 위한 파일스트림 생성
			FileInputStream fin = new FileInputStream(oriFile);
			// 읽은 내용 기록할 복사본 파일 출력용 파일스트림 생성
			FileOutputStream fout = new FileOutputStream(reFile);

			// 원본 읽어서 복사본에 기록 처리
			while ((read = fin.read(buf, 0, buf.length)) != -1) {
				fout.write(buf, 0, read);
			}
			fin.close();
			fout.close();
			oriFile.delete(); // 원본파일 삭제
		}
		}
		///
		PrintWriter out = response.getWriter();
		JSONObject json=new JSONObject();
		json.put("oriName", oriName);
		json.put("reName", reName);
		json.put("size", size);
		out.println(json.toJSONString());
		out.flush();
		out.close();
	}
	
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

		json.put("chat_no", chat.getChat_no());
		return json.toJSONString();
	}

}
