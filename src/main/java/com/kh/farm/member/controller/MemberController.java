package com.kh.farm.member.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.farm.chat.model.service.ChatService;
import com.kh.farm.chat.model.vo.*;
import com.kh.farm.member.model.service.MemberService;
import com.kh.farm.member.model.service.MemberServiceImpl;
import com.kh.farm.member.model.vo.*;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private ChatService chatService;
	@Autowired
	private BCryptPasswordEncoder pwdEncoder;

	@RequestMapping(value = "signUp.do", method = RequestMethod.POST)
	public String signUp(Member member, HttpServletRequest request,
			@RequestParam(name = "upfile", required = false) MultipartFile file) {
		String path = request.getSession().getServletContext().getRealPath("resources/upload/memberUpload");
		member.setMember_pwd(pwdEncoder.encode(member.getMember_pwd()));
		try {
			file.transferTo(new File(path + "\\" + file.getOriginalFilename()));

			if (file.getOriginalFilename() != null) {
				// 첨부된 파일이 있을 경우, 폴더에 기록된 해당 파일의 이름바꾸기 처리함
				// 새로운 파일명 만들기 : '년월일시분초'
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
				String renameFileName = member.getMember_id()+"_"+sdf.format(new java.sql.Date(System.currentTimeMillis())) + "."
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
			e.printStackTrace();
		}
		int insertmember = memberService.insertMember(member);
		return "home";
	}
	
	
	@RequestMapping(value="login.do",method=RequestMethod.POST)
	public String loginCheck(Member member,HttpSession session) {
		
		String viewName = null;
		try {
			//로그인 멤버 정보 가져오기
			Member returnMember = memberService.loginCheck(member);
			//System.out.println("returnMember : " + returnMember);
			session.setAttribute("loginUser", returnMember);
			//로그인 멤버 채팅 정보 가져오기
			ArrayList<ChatList> chatList = (ArrayList<ChatList>)chatService.selectChatList(returnMember);
			session.setAttribute("chatList", chatList);
			System.out.println(returnMember.getMember_name()+chatList);
			//System.out.println(chatList);
			viewName = "home";
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("0");
			viewName = "member/login";
		}
		return viewName;
	}
	
	@RequestMapping("logout.do")
	public String logout(HttpSession session)
	{		session.removeAttribute("loginUser");
	session.removeAttribute("chatList");
		session.invalidate();
			
		return "home";
	}
	
	@RequestMapping("findId.do")
	public ModelAndView findId(Member member,ModelAndView mv)
	
	{
		
			Member MemberIdFind =memberService.selectFindId(member);
			
			if(MemberIdFind != null) {
				mv.setViewName("member/findId");
				mv.addObject("MemberIdFind",MemberIdFind);
			}else {
				mv.setViewName("member/findId");
				mv.addObject("NotFound","해당 정보에 대한 아이디가 존재하지 않음");
				System.out.println("존재하지 않니?");
			}
		return mv;
	}
	
	@RequestMapping("moveupdatePwd.do")
	public ModelAndView moveupdatePwd(ModelAndView mv, Member member) {
		 System.out.println(member.getMember_id());
		mv.setViewName("member/makeNewPwd");
		mv.addObject("member",member);
		return mv;
	}
	
	@RequestMapping("updatePwd.do")
	public ModelAndView updatePwd(ModelAndView mv, Member member) {
		member.setMember_pwd(pwdEncoder.encode(member.getMember_pwd()));
		int updatePwd = memberService.updatePwd(member);
		mv.setViewName("member/login");
		mv.addObject("message","비밀번호 수정 성공 !");
		System.out.println(updatePwd);
		return mv;
	}
}
