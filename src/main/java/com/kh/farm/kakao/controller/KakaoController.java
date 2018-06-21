package com.kh.farm.kakao.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;

import com.kh.farm.kakao.model.service.KakaoService;
import com.kh.farm.kakao.model.vo.Kakao;
import com.kh.farm.member.model.vo.Member;

@Controller
public class KakaoController {
	@Autowired
	private KakaoService kakaoService;

	@RequestMapping(value = "kakaoMessage.do", method = { RequestMethod.POST, RequestMethod.GET })
	public void kakao(HttpServletRequest req){
		final String cont = req.getParameter("content");
		final String ref = req.getParameter("refresh");
		if(!ref.equals("")) {
		RestTemplate rest = new RestTemplate();
		JSONObject jsonl = new JSONObject();
		jsonl.put("web_url", "http://127.0.0.1:7777/farm");
		jsonl.put("mobile_web_url", "http://127.0.0.1:7777/farm");
		
		JSONObject jsonc = new JSONObject();
		jsonc.put("title", "알람 메세지");
		jsonc.put("description", cont);
		jsonc.put("image_url", "https://postfiles.pstatic.net/MjAxODA2MjBfMTAw/MDAxNTI5NDkwODEwMDQx._OCQLH2IQgRXriYMG2bX7v0cGJh7uvKsEfF8yJqN694g.qjmOUpN6rLr7LkAw_eoqjW20ulKJ9_NaI-FnfqCVn9Ag.PNG.ihk1547/Farmlogo.png?type=w773");
		jsonc.put("link", jsonl);
		
		JSONObject jsonm = new JSONObject();
		jsonm.put("object_type", "feed");
		jsonm.put("content", jsonc);
		jsonm.put("button_title", "바로가기");
	 
		MultiValueMap<String, String> map = new LinkedMultiValueMap<String, String>();
		map.add("template_object", jsonm.toString());
		HttpHeaders header = new HttpHeaders();
    
		header.add("Authorization", "Bearer "+ref.trim());

		HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<>(map, header);

		rest.postForObject("https://kapi.kakao.com/v2/api/talk/memo/default/send", request, String.class);
		}
	}
	
	@RequestMapping(value = "kakaoRefresh.do", method = { RequestMethod.POST, RequestMethod.GET })
	public void kakaoRefresh(HttpServletResponse response,HttpSession session,Kakao kakao,Member member) throws IOException {
		member = (Member) session.getAttribute("loginUser");
		kakao.setKakao_id(member.getMember_id());
		List<Kakao> refresh= kakaoService.selectKakaoInfo(kakao);
		String re_token ="";
		String id="";
		String dd="";
		for (Kakao ka : refresh) {
			re_token = ka.getKakao_refresh();
			id=ka.getKakao_id();
			dd=ka.getKakao_access();
		}
		String retoken="1";
		if(!re_token.equals("")) {
		RestTemplate rest = new RestTemplate();
		MultiValueMap<String, String> map = new LinkedMultiValueMap<String, String>();
		map.add("grant_type", "refresh_token");
	    map.add("client_id", "ef1fc1dfcaeaab6bbd751c43264aae10");
	    map.add("refresh_token", re_token);
	    
	    String str=rest.postForObject("https://kauth.kakao.com/oauth/token", map, String.class);
	    retoken=str.substring(str.indexOf(":")+2,str.indexOf(",")-1);
		}
	    PrintWriter out = response.getWriter();
	    out.println(retoken);
	    out.flush();
	    out.close();
	}
	
	@RequestMapping(value = "kakaoInfo.do", method = { RequestMethod.POST, RequestMethod.GET })
	public void kakaoInfo(HttpServletResponse response,Kakao kakao) throws IOException {
		if(kakaoService.selectKakaoId(kakao) == null) {
			kakaoService.insertKakaoInfo(kakao);
		}else {
			kakaoService.updateKakaoInfo(kakao);
		}
	}
}
