package com.kh.farm.message.controller;

import org.json.simple.JSONObject;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;

public class MessageController {

	@RequestMapping(value = "message.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String test() {
		RestTemplate rest = new RestTemplate();
		JSONObject jsonl = new JSONObject();
		jsonl.put("web_url", "http://localhost:7777/farm/home.do");
		jsonl.put("mobile_web_url", "http://localhost:7777/farm/home.do");
		JSONObject jsonc = new JSONObject();
		jsonc.put("title", "제목");
		jsonc.put("description", "내용");
		jsonc.put("image_url", "");
		jsonc.put("image_width", 640);
		jsonc.put("image_height", 640);
		jsonc.put("link", jsonl);
		JSONObject jsonm = new JSONObject();
		jsonm.put("object_type", "feed");
		jsonm.put("content", jsonc);
		MultiValueMap<String, String> map = new LinkedMultiValueMap<String, String>();
		map.add("template_object", jsonm.toString());
		HttpHeaders header = new HttpHeaders();

		header.add("Authorization", "Bearer uuwZX8WW-F_C-EygdRzrWmVFy3LK6hKqtVjBfQopdgcAAAFjiusTgQ");

		HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<>(map, header);

		String str = rest.postForObject("https://kapi.kakao.com/v2/api/talk/memo/default/send", request, String.class);
		System.out.println(str);
		return "home";
	}
}
