package com.kh.farm.message.controller;

import org.json.simple.JSONObject;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;

@Controller
public class MessageController {

	@RequestMapping(value = "kakaoMessage.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String kakao() {
		RestTemplate rest = new RestTemplate();
		JSONObject jsonl = new JSONObject();
		jsonl.put("web_url", "http://127.0.0.1:7777/farm");
		jsonl.put("mobile_web_url", "http://127.0.0.1:7777/farm");
		
		JSONObject jsonc = new JSONObject();
		jsonc.put("title", "알람");
		jsonc.put("description", "aaa");
		jsonc.put("image_url", "https://postfiles.pstatic.net/MjAxODA2MjBfMTAw/MDAxNTI5NDkwODEwMDQx._OCQLH2IQgRXriYMG2bX7v0cGJh7uvKsEfF8yJqN694g.qjmOUpN6rLr7LkAw_eoqjW20ulKJ9_NaI-FnfqCVn9Ag.PNG.ihk1547/Farmlogo.png?type=w773");
		jsonc.put("link", jsonl);
		
		JSONObject jsonm = new JSONObject();
		jsonm.put("object_type", "feed");
		jsonm.put("content", jsonc);
		jsonm.put("button_title", "바로가기");
	 
		MultiValueMap<String, String> map = new LinkedMultiValueMap<String, String>();
		map.add("template_object", jsonm.toString());
		HttpHeaders header = new HttpHeaders();

		header.add("Authorization", "Bearer kFNJzou2iy8oBZ6wHXglQ59dT9jVUIAiPNgz8go8BJ4AAAFkHF_9cA");

		HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<>(map, header);

		rest.postForObject("https://kapi.kakao.com/v2/api/talk/memo/default/send", request, String.class);
		return "home";
	}
	
	@RequestMapping(value = "kakaorefresh.do", method = { RequestMethod.POST, RequestMethod.GET })
	public void kakaoRefresh() {
		RestTemplate rest = new RestTemplate();
		MultiValueMap<String, String> map = new LinkedMultiValueMap<String, String>();
		map.add("grant_type", "refresh_token");
	    map.add("client_id", "ef1fc1dfcaeaab6bbd751c43264aae10");
	    map.add("refresh_token", "ZwJAhdMBstdo9Jzevs9F_gya0DkpuCDn1dukBQopdkgAAAFkHXxyzg");
	    
	    String str=rest.postForObject("https://kauth.kakao.com/oauth/token", map, String.class);
	    System.out.println(str.substring(str.indexOf(":")+2,str.indexOf(",")-1));
	}
	
}
