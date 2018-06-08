package com.kh.farm.login.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.kh.farm.login.bo.NaverLoginBO;
import com.kh.farm.member.exception.LoginFailException;
import com.kh.farm.member.model.service.MemberService;
import com.kh.farm.member.model.vo.Member;

@Controller
public class LoginController {
	@Autowired
	private MemberService memberService;
	

	private NaverLoginBO naverLoginBO;
	private String apiResult = null;

	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}

	// 로그인 첫 화면 요청 메소드
	@RequestMapping(value = "moveLogin.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(Model model, HttpSession session) {

		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		model.addAttribute("url", naverAuthUrl);
		
		return "member/login";
	}

	// 네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "callback.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
			throws IOException, LoginFailException {
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		// 로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginBO.getUserProfile(oauthToken);
		model.addAttribute("result", apiResult);
		Member member = new Member();
		member.setMember_id(apiResult.substring(apiResult.indexOf("\"email\"")+9,apiResult.indexOf(",\"name\"")-1));
		if(memberService.selectCheckId(member) != null) {
			session.setAttribute("loginUser", memberService.selectCheckId(member));
			session.setAttribute("check", "1");
			return "home";
			//apiResult.substring(apiResult.indexOf("\"email\"")+9,apiResult.indexOf(",\"name\"")-1);
		}else {
			return "member/naver_signUp";
		}
	}
}
