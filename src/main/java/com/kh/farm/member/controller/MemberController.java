package com.kh.farm.member.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Properties;
import java.util.UUID;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.ws.Response;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.farm.auction.model.vo.Auction;
import com.kh.farm.chat.model.service.ChatService;
import com.kh.farm.chat.model.vo.*;
import com.kh.farm.market.model.vo.Market;
import com.kh.farm.member.model.service.MemberService;
import com.kh.farm.member.model.service.MemberServiceImpl;
import com.kh.farm.member.model.vo.*;
import com.kh.farm.visit.model.vo.Visit;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private ChatService chatService;
	@Autowired
	private BCryptPasswordEncoder pwdEncoder;

	@RequestMapping("customerNaverMod.do")
	public void customerNaverMod(HttpServletResponse response, Member member, HttpSession session) throws IOException {

		int updateAddr = 0;
		if (member.getMember_addr() != null) {
			updateAddr = memberService.updateAddr(member);
		}

		PrintWriter out = response.getWriter();
		if (updateAddr > 0) {
			session.setAttribute("loginUser", member);
			out.print("o");
			out.flush();
			out.close();
		} else {
			out.print("x");
			out.flush();
			out.close();
		}
	}

	@RequestMapping(value = "naverSignUp.do")
	public void naverSignUp(Member member, HttpServletResponse response) throws Exception {

		int result = memberService.insertNaverSignUp(member);
		System.out.println(result);
		String str = "";
		if (result > 0) {
			str = "moveLogin.do";
		} else {
			str = "오류";
		}
		PrintWriter out = response.getWriter();
		out.println(str);
		out.flush();
		out.close();

	}

	@RequestMapping(value = "signUp.do", method = RequestMethod.POST)
	public String signUp(Member member, HttpServletRequest request,

			/*
			 * @RequestParam(name = "upfile", required = false) MultipartFile file,
			 * 
			 * @RequestParam("category") String category) {
			 */

			@RequestParam(name = "upfile", required = false) MultipartFile file,
			@RequestParam("category") String category) {
		System.out.println("주소 : " + member.getMember_addr());

		String path = request.getSession().getServletContext().getRealPath("resources/upload/memberUpload");
		member.setMember_pwd(pwdEncoder.encode(member.getMember_pwd()));
		member.setMember_category(category);

		try {
			file.transferTo(new File(path + "\\" + file.getOriginalFilename()));

			if (file.getOriginalFilename() != null) {
				// 첨부된 파일이 있을 경우, 폴더에 기록된 해당 파일의 이름바꾸기 처리함
				// 새로운 파일명 만들기 : '년월일시분초'
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
				String renameFileName = member.getMember_id() + "_"
						+ sdf.format(new java.sql.Date(System.currentTimeMillis())) + "."
						+ file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1);

				// 파일명 바꾸려면 File객체의 renameTo() 사용함
				File originFile = new File(path + "//" + file.getOriginalFilename());
				File renameFile = new File(path + "//" + renameFileName);

				// 파일 이름바꾸기 실행함
				// 이름바꾸기 실패할 경우에는 직접 바꾸기함
				// 직접바꾸기는 원본파일에 대한 복사본 파일을 만든 다음 원본 삭제함
				if (!originFile.renameTo(renameFile)) {
					int read = -1;
					byte[] buf = new byte[1024];
					// 원본을 읽기 위한 파일스트림 생성
					FileInputStream fin = new FileInputStream(originFile);
					// 읽은 내용 기록할 복사본 파일 출력용 파일스트림 생성
					FileOutputStream fout = new FileOutputStream(renameFile);

					// 원본 읽어서 복사본에 기록 처리
					while ((read = fin.read(buf, 0, buf.length)) != -1) {
						fout.write(buf, 0, read);
					}
					fin.close();
					fout.close();
					originFile.delete(); // 원본파일 삭제
				}
				member.setMember_img(renameFileName);
			}
		} catch (IllegalStateException | IOException e) {
			member.setMember_img("default.png");
		}
		int insertmember = memberService.insertMember(member);
		/// 'system'과 채팅방 생성

		Chat chat = new Chat();
		chat.setMember_id1(member.getMember_id());
		chat.setMember_id2("system");
		chatService.insertChat(chat);

		///
		return "home";
	}

	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public ModelAndView loginCheck(ModelAndView mv, Member member, HttpSession session, HttpServletRequest request) {

		try {
			// 로그인 멤버 정보 가져오기
			Member returnMember = memberService.selectLoginCheck(member);
			if (returnMember.getMember_approval().equals("Y")) {
				// System.out.println("returnMember : " + returnMember);
				String ip = getClientIP(request);
				System.out.println("ip : " + ip);
				returnMember.setIp(ip);
				int visit = memberService.insertVisit(returnMember);
				session.setAttribute("loginUser", returnMember);

				// 로그인 멤버 채팅 정보 가져오기
				ArrayList<ChatList> chatList = (ArrayList<ChatList>) chatService.selectChatList(returnMember);
				session.setAttribute("chatList", chatList);

				// System.out.println(chatList);
				mv.setViewName("home");
			} else {
				mv.addObject("message", "승인되지 않은 판매자입니다.");
				mv.setViewName("member/login");
			}
		} catch (Exception e) {
			mv.addObject("message", "로그인 실패! 아이디와 비밀번호를 확인해 주세요");
			mv.setViewName("member/login");
		}
		return mv;
	}

	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		session.removeAttribute("loginUser");
		session.removeAttribute("chatList");
		session.removeAttribute("totalCount");
		session.removeAttribute("todayCount");
		session.invalidate();

		return "home";
	}

	@RequestMapping("findId.do")
	public ModelAndView findId(Member member, ModelAndView mv)

	{

		Member MemberIdFind = memberService.selectFindId(member);

		if (MemberIdFind != null) {
			mv.setViewName("member/findId");
			mv.addObject("MemberIdFind", MemberIdFind);
		} else {
			mv.setViewName("member/findId");
			mv.addObject("NotFound", "해당 정보에 대한 아이디가 존재하지 않음");
			System.out.println("존재하지 않니?");
		}
		return mv;
	}

	@RequestMapping("moveupdatePwd.do")
	public ModelAndView moveupdatePwd(ModelAndView mv, Member member) {
		System.out.println(member.getMember_id());
		mv.setViewName("member/makeNewPwd");
		mv.addObject("member", member);
		return mv;
	}

	@RequestMapping("updatePwd.do")
	public ModelAndView updatePwd(ModelAndView mv, Member member) {
		member.setMember_pwd(pwdEncoder.encode(member.getMember_pwd()));
		int updatePwd = memberService.updatePwd(member);
		mv.setViewName("member/login");
		mv.addObject("message", "비밀번호 수정 성공 !");
		System.out.println(updatePwd);
		return mv;
	}

	@RequestMapping("memberList.do")
	public void memberList(HttpServletResponse response, @RequestParam("page") int currentPage) throws IOException {
		JSONArray jarr = new JSONArray();
		List<Member> memberList = memberService.selectMemberList(currentPage);
		int limitPage = 10;
		System.out.println("111");
		int listCount = memberService.selectMemberCount();

		int maxPage = (int) ((double) listCount / limitPage + 0.9); // ex) 41개면 '5'페이지나와야되는데 '5'를 계산해줌
		int startPage = ((int) ((double) currentPage / 5 + 0.8) - 1) * 5 + 1;
		int endPage = startPage + 5 - 1;

		if (maxPage < endPage) {
			endPage = maxPage;
		}
		for (Member m : memberList) {
			JSONObject json = new JSONObject();
			json.put("rnum", m.getRnum());
			json.put("member_id", m.getMember_id());
			json.put("member_category", m.getMember_category());
			json.put("member_name", m.getMember_name());
			json.put("member_approval", m.getMember_approval());
			json.put("member_withdraw", m.getMember_withdraw());
			json.put("member_warning_count", m.getMember_warning_count());
			json.put("startPage", startPage);
			json.put("endPage", endPage);
			json.put("maxPage", maxPage);
			json.put("currentPage", currentPage);
			jarr.add(json);
		}

		JSONObject sendJson = new JSONObject();
		sendJson.put("list", jarr);
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.append(sendJson.toJSONString());
		System.out.println(sendJson.toJSONString());
		out.flush();
		out.close();
	}

	@RequestMapping(value = "change_app.do")
	@ResponseBody
	public void change_app(HttpServletResponse response, @RequestParam("member_id") String member_id, Member member)
			throws IOException {
		System.out.println("승인변경 메소드 실행!!!");
		System.out.println("member_id : " + member_id);
		int result = memberService.change_app(member_id);
		String member_id2 = member_id;
		System.out.println(member_id2);
		member = memberService.selectMember(member_id2);
		response.setContentType("application/json; charset=utf-8;");
		JSONObject json = new JSONObject();
		json.put("member_id", member.getMember_id());
		json.put("member_approval", member.getMember_approval());
		System.out.println(json.toJSONString());

		PrintWriter out = response.getWriter();
		out.print(json.toJSONString());
		out.flush();
		out.close();
	}

	@RequestMapping(value = "change_withdraw.do")
	@ResponseBody
	public void change_with(HttpServletResponse response, @RequestParam("member_id") String member_id, Member member)
			throws IOException {
		System.out.println("탈퇴변경 메소드 실행!!!");
		System.out.println("member_id : " + member_id);
		int result = memberService.change_with(member_id);
		String member_id2 = member_id;
		System.out.println(member_id2);
		member = memberService.selectMember(member_id2);
		response.setContentType("application/json; charset=utf-8;");
		JSONObject json = new JSONObject();
		json.put("member_id", member.getMember_id());
		json.put("member_withdraw", member.getMember_withdraw());
		System.out.println(json.toJSONString());

		PrintWriter out = response.getWriter();
		out.print(json.toJSONString());
		out.flush();
		out.close();
	}

	@RequestMapping("nowPwdCheck.do")
	public void nowPwdCheck(@RequestParam("MEMBER_ID") String member_id, @RequestParam("MEMBER_PWD") String member_pwd,
			HttpServletResponse response) {
		String dbpwd = memberService.nowPwdCheck(member_id);
		String pwd = member_pwd;
		String result = "";

		if (pwdEncoder.matches(pwd, dbpwd)) {
			result = "ok";
		} else {
			result = "no";
		}

		PrintWriter out = null;
		try {
			out = response.getWriter();
			out.print(result);
			out.flush();
			out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	@RequestMapping("customerMod.do")
	public void customerMod(HttpServletResponse response, Member member, HttpSession session) throws IOException {

		int updatePwd = 0;
		int updateAddr = 0;

		if (member.getMember_pwd() != "") {
			member.setMember_pwd(pwdEncoder.encode(member.getMember_pwd()));
			member.setMember_id(member.getMember_id());
			updatePwd = memberService.updatePwd(member);
		}

		if (member.getMember_addr() != null) {
			member.setMember_addr(member.getMember_addr());
			member.setMember_id(member.getMember_id());
			updateAddr = memberService.updateAddr(member);
		}
		Member returnMember = memberService.selectIdCheck(member.getMember_id());
		PrintWriter out = response.getWriter();
		if (updatePwd > 0 || updateAddr > 0) {
			session.setAttribute("loginUser", returnMember);
			out.print("o");
			out.flush();
			out.close();
		} else {
			out.print("x");
			out.flush();
			out.close();
		}
	}

	@RequestMapping("changeList.do")
	@ResponseBody
	public void changeList(HttpServletResponse response, @RequestParam("page") int currentPage,
			@RequestParam("type") int type) throws IOException {
		JSONArray jarr = new JSONArray();
		List<Member> changeList = memberService.selectChangeList(currentPage, type);
		int limitPage = 10;
		int listCount = memberService.selectChangeMemberCount(type);

		int maxPage = (int) ((double) listCount / limitPage + 0.9); // ex) 41개면 '5'페이지나와야되는데 '5'를 계산해줌
		int startPage = ((int) ((double) currentPage / 5 + 0.8) - 1) * 5 + 1;
		int endPage = startPage + 5 - 1;

		if (maxPage < endPage) {
			endPage = maxPage;
		}
		for (Member m : changeList) {
			JSONObject json = new JSONObject();
			json.put("rnum", m.getRnum());
			json.put("member_id", m.getMember_id());
			json.put("member_category", m.getMember_category());
			json.put("member_name", m.getMember_name());
			json.put("member_approval", m.getMember_approval());
			json.put("member_withdraw", m.getMember_withdraw());
			json.put("member_warning_count", m.getMember_warning_count());
			json.put("startPage", startPage);
			json.put("endPage", endPage);
			json.put("maxPage", maxPage);
			json.put("currentPage", currentPage);
			json.put("type", type);
			jarr.add(json);
		}

		JSONObject sendJson = new JSONObject();
		sendJson.put("list", jarr);
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.append(sendJson.toJSONString());
		out.flush();
		out.close();
	}

	// 회원검색
	@RequestMapping("searchMember.do")
	@ResponseBody
	public void searchMember(HttpServletResponse response, @RequestParam("keyword") String keyword,
			@RequestParam("type") int type, @RequestParam("page") int currentPage) throws IOException {
		System.out.println("회원검색 메소드 실행!!! keyword :" + keyword);
		JSONArray jarr = new JSONArray();
		List<Member> memberList = memberService.selectSearchMember(keyword, type, currentPage);
		int limitPage = 10;
		int listCount = memberService.selectMemberCount();
		int maxPage = (int) ((double) listCount / limitPage + 0.9); // ex) 41개면 '5'페이지나와야되는데 '5'를 계산해줌
		int startPage = ((int) ((double) currentPage / 5 + 0.8) - 1) * 5 + 1;
		int endPage = startPage + 5 - 1;

		if (maxPage < endPage) {
			endPage = maxPage;
		}
		for (Member m : memberList) {
			JSONObject json = new JSONObject();
			json.put("rnum", m.getRnum());
			json.put("member_id", m.getMember_id());
			json.put("member_category", m.getMember_category());
			json.put("member_name", m.getMember_name());
			json.put("member_approval", m.getMember_approval());
			json.put("member_withdraw", m.getMember_withdraw());
			json.put("member_warning_count", m.getMember_warning_count());
			json.put("startPage", startPage);
			json.put("endPage", endPage);
			json.put("maxPage", maxPage);
			json.put("currentPage", currentPage);
			json.put("type", type);
			jarr.add(json);
		}

		JSONObject sendJson = new JSONObject();
		sendJson.put("list", jarr);
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.append(sendJson.toJSONString());
		out.flush();
		out.close();
	}

	@RequestMapping(value = "sendmail.do", method = RequestMethod.POST)
	public void sendMail(HttpServletResponse response, @RequestParam("email") String mail_to) {
		Member returnMember = memberService.selectIdCheck(mail_to);
		int vCode = 0;
		if (returnMember == null) {
			try {

				String mail_from = "JakMoolFarm" + "<jakmoolfarm@gmail.com>";
				String title = null;
				String contents = null;
				// 인증번호 보내기
				title = "JakMoolFarm VERIFICATION CODE EMAIL";
				vCode = (int) (Math.random() * 8999 + 1000);
				contents = "VERIFICATION CODE : " + vCode;
				mail_from = new String(mail_from.getBytes("UTF-8"), "UTF-8");
				mail_to = new String(mail_to.getBytes("UTF-8"), "UTF-8");
				Properties props = new Properties();
				props.put("mail.transport.protocol", "smtp");
				props.put("mail.smtp.host", "smtp.gmail.com");
				props.put("mail.smtp.port", "587");
				props.put("mail.smtp.starttls.enable", "true");
				props.put("mail.smtp.socketFactory.port", "587");
				props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
				props.put("mail.smtp.socketFactory.fallback", "false");
				props.put("mail.smtp.auth", "true");
				Authenticator auth = new SMTPAuthenticator();
				Session sess = Session.getDefaultInstance(props, auth);
				MimeMessage msg = new MimeMessage(sess);
				msg.setFrom(new InternetAddress(mail_from));
				msg.setRecipient(Message.RecipientType.TO, new InternetAddress(mail_to));
				msg.setSubject(title, "UTF-8");
				msg.setContent(contents, "text/html; charset=UTF-8");
				msg.setHeader("Content-type", "text/html; charset=UTF-8");
				Transport.send(msg);
				PrintWriter out = response.getWriter();
				out.append(String.valueOf(vCode));
			} catch (Exception e) {
				e.printStackTrace();

			} finally {

			}
		} else {

		}
	}

	@RequestMapping(value = "sellerSendmail.do", method = RequestMethod.POST)
	public void sellerSendMail(HttpServletResponse response, @RequestParam("email") String mail_to) {
		try {

			String mail_from = "JakMoolFarm" + "<jakmoolfarm@gmail.com>";
			String title = null;
			String contents = null;
			// 인증번호 보내기
			title = "JakMoolFarm 판매자 승인";
			contents = "JakMoolFarm 판매자 승인이 완료되었습니다.";
			mail_from = new String(mail_from.getBytes("UTF-8"), "UTF-8");
			mail_to = new String(mail_to.getBytes("UTF-8"), "UTF-8");
			Properties props = new Properties();
			props.put("mail.transport.protocol", "smtp");
			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.port", "587");
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.smtp.socketFactory.port", "587");
			props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.socketFactory.fallback", "false");
			props.put("mail.smtp.auth", "true");
			Authenticator auth = new SMTPAuthenticator();
			Session sess = Session.getDefaultInstance(props, auth);
			MimeMessage msg = new MimeMessage(sess);
			msg.setFrom(new InternetAddress(mail_from));
			msg.setRecipient(Message.RecipientType.TO, new InternetAddress(mail_to));
			msg.setSubject(title, "UTF-8");
			msg.setContent(contents, "text/html; charset=UTF-8");
			msg.setHeader("Content-type", "text/html; charset=UTF-8");
			Transport.send(msg);
		} catch (Exception e) {
			e.printStackTrace();

		} finally {

		}

	}

	// 접속자 ip 가져오기
	public String getClientIP(HttpServletRequest request) {

		String ip = request.getHeader("X-FORWARDED-FOR");

		if (ip == null || ip.length() == 0) {
			ip = request.getHeader("Proxy-Client-IP");
		}

		if (ip == null || ip.length() == 0) {
			ip = request.getHeader("WL-Proxy-Client-IP"); // 웹로직
		}

		if (ip == null || ip.length() == 0) {
			ip = request.getRemoteAddr();
		}

		return ip;
		/* <<<<<<< HEAD */
	}

	/*
	 * @RequestMapping(value = "visitChart.do")
	 * 
	 * @ResponseBody public void visitChart(HttpServletResponse
	 * response, @RequestParam("type") int type) throws IOException { JSONArray jarr
	 * = new JSONArray(); System.out.println(type); List<Visit> visitList =
	 * memberService.selectVisitList(type); visitList.toString();
	 * System.out.println("방문자수 카운터 실행"); int count = 0; if (type == 1) { if (count
	 * < 7) { for (Visit v : visitList) { JSONObject json = new JSONObject();
	 * json.put("count", v.getVisit_count()); json.put("date",
	 * v.getVisit_date().toString()); jarr.add(json); count++; } }
	 * 
	 * } else { if (count < 12) { for (Visit v : visitList) { JSONObject json = new
	 * JSONObject(); json.put("count", v.getVisit_count()); json.put("date",
	 * v.getVisit_month().toString()); jarr.add(json); count++; } } }
	 * System.out.println("22222"); JSONObject sendJson = new JSONObject();
	 * jarr.toJSONString(); sendJson.put("list", jarr);
	 * response.setContentType("application/json; charset=utf-8"); PrintWriter out =
	 * response.getWriter(); System.out.println("3333");
	 * 
	 * out.append(sendJson.toJSONString()); out.flush(); out.close(); }
	 * 
	 * 
	 * }
	 */

	@RequestMapping(value = "visitChart.do")
	@ResponseBody
	public void visitChart(HttpServletResponse response, @RequestParam("type") int type) throws IOException {
		JSONArray jarr = new JSONArray();
		System.out.println(type);
		List<Visit> visitList = memberService.selectVisitList(type);
		visitList.toString();
		System.out.println("방문자수 카운터 실행");
		int count = 0;

		// count => 0 // data =>

		if (type == 1) {
			for (Visit v : visitList) {
				JSONObject json = new JSONObject();
				json.put("count", v.getVisit_count());
				json.put("date", v.getVisit_date().toString());
				jarr.add(json);
				count++;
				if (count == 7)
					break;
			}

		} else {

			for (Visit v : visitList) {
				JSONObject json = new JSONObject();
				json.put("count2", v.getVisit_count());
				json.put("month", v.getVisit_month());
				jarr.add(json);
				count++;
				if (count == 6)
					break;

			}
		}
		System.out.println("22222");
		JSONObject sendJson = new JSONObject();
		jarr.toJSONString();
		sendJson.put("list", jarr);
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		System.out.println("3333");

		out.append(sendJson.toJSONString());
		out.flush();
		out.close();
	}

	// 상품판매량 그래프
	@RequestMapping(value = "mybuy.do")
	public void mybuygraph(HttpServletResponse response, Market market) throws IOException {
		List<Market> marketlist = memberService.buygraph(market);
		JSONArray jarr = new JSONArray();
		for (Market m : marketlist) {
			JSONObject json = new JSONObject();
			json.put("market_title", m.getMarket_title());
			json.put("buy_amount", m.getBuy_amount());
			json.put("market_no", m.getMarket_no());

			jarr.add(json);
		}

		JSONObject sendJson = new JSONObject();
		sendJson.put("list", jarr);
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.append(sendJson.toJSONString());
		out.flush();
		out.close();

	}

	@RequestMapping("selectSelInfo.do")
	public void sellerInfo(@RequestParam("member_id") String member_id, HttpServletResponse response)
			throws IOException {
		System.out.println(member_id);
		Member member = memberService.selectMemberInfo(member_id);
		JSONObject json = new JSONObject();
		json.put("member_id", member.getMember_id());
		json.put("member_name", member.getMember_name());
		json.put("member_addr", member.getMember_addr());
		json.put("point_point", member.getUserpoint());

		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.append(json.toJSONString());
		out.flush();
		out.close();
	}

	// admin 총회원수/총 판매 등록수/총 경매 등록수
	@RequestMapping(value = "countAll.do")
	public void selectAllcount(Member member, HttpServletResponse response) throws IOException {
		System.out.println("회원수조회들어옴");
		Member result = memberService.selectAllcount();

		System.out.println("result값:" + result.getMembercount());

		JSONObject json = new JSONObject();

		json.put("membercount", result.getMembercount());
		json.put("marketcount", result.getMarketcount());
		json.put("auctioncount", result.getAuctioncount());
		json.put("visitcount", result.getVisitcount());

		System.out.println(json.toJSONString());

		response.setContentType("application/json; charset=utf-8;");
		PrintWriter out = response.getWriter();
		out.print(json.toJSONString());
		out.flush();
		out.close();

	}

	// admin 최신판매 조회
	@RequestMapping(value = "newmarketDate.do")
	public void newmarketDate(Market market, HttpServletResponse response) throws IOException {
		System.out.println("최신판매조회 들어옴");
		List<Market> result = memberService.newmarket(market);
		System.out.println("판매조회 result 값:" + result);
		JSONArray jarr = new JSONArray();
		for (Market m : result) {
			JSONObject json = new JSONObject();
			json.put("market_title", m.getMarket_title());
			json.put("market_releasedate", m.getMarket_releasedate().toString());
			json.put("member_id", m.getMember_id());
			jarr.add(json);
		}

		JSONObject sendJson = new JSONObject();
		sendJson.put("list", jarr);
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.append(sendJson.toJSONString());
		out.flush();
		out.close();

	}

	// admin 최신경매 조회
	@RequestMapping(value = "newauctionDate.do")
	public void newauctionDate(Auction auction, HttpServletResponse response) throws IOException {
		System.out.println("최신경매조회 들어옴");
		List<Auction> result = memberService.newauction(auction);
		System.out.println("판매조회 result 값:" + result);
		JSONArray jarr = new JSONArray();
		for (Auction a : result) {
			JSONObject json = new JSONObject();
			json.put("auction_title", a.getAuction_title());
			json.put("member_id", a.getMember_id());
			json.put("auction_status", a.getAuction_status());
			jarr.add(json);
		}

		JSONObject sendJson = new JSONObject();
		sendJson.put("list", jarr);
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.append(sendJson.toJSONString());
		out.flush();
		out.close();

	}

	// 총판매금액 조회
	@RequestMapping(value = "AllmarketAmount.do")
	public void marketAmount(Market market, HttpServletResponse response) throws IOException {
		System.out.println("총판매금액조회들어옴");
		List<Market> marketlist = memberService.allmarketAmount(market);
		JSONArray jarr = new JSONArray();
		for (Market m : marketlist) {
			JSONObject json = new JSONObject();

			json.put("market_amount", m.getMarket_amount());

			jarr.add(json);
		}

		JSONObject sendJson = new JSONObject();
		sendJson.put("list", jarr);
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.append(sendJson.toJSONString());
		out.flush();
		out.close();
	}

	// 총판매개수 조회
	@RequestMapping(value = "AllbuyAmount.do")
	public void buyAmount(Market market, HttpServletResponse response) throws IOException {
		System.out.println("총판매개수조회들어옴");
		List<Market> marketlist = memberService.allbuyAmount(market);
		JSONArray jarr = new JSONArray();
		for (Market m : marketlist) {
			JSONObject json = new JSONObject();

			json.put("buy_amount", m.getBuy_amount());

			jarr.add(json);
		}

		JSONObject sendJson = new JSONObject();
		sendJson.put("list", jarr);
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.append(sendJson.toJSONString());
		out.flush();
		out.close();
	}

	// 일별판매량 그래프
	@RequestMapping(value = "buydategraph.do")
	public void buydategraph(HttpServletResponse response, Market market) throws IOException {
		List<Market> marketlist = memberService.buydategraph(market);
		JSONArray jarr = new JSONArray();
		for (Market m : marketlist) {
			JSONObject json = new JSONObject();
			json.put("market_title", m.getMarket_title());
			json.put("buy_amount", m.getBuy_amount());
			json.put("buy_date", m.getBuy_date().toString());
			jarr.add(json);
		}
		JSONObject sendJson = new JSONObject();
		sendJson.put("list", jarr);
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.append(sendJson.toJSONString());
		out.flush();
		out.close();

	}

}
