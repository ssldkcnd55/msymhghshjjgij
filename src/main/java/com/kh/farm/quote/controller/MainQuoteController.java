package com.kh.farm.quote.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import net.sf.json.JSONObject;

@Controller
public class MainQuoteController {
	@RequestMapping(value = "MainQuoteApi.do", method = { RequestMethod.POST,
			RequestMethod.GET }, produces = "application/json; charset=utf8")
	@ResponseBody
	public void QuoteApi(HttpServletResponse response, HttpServletRequest request)
			throws ServletException, IOException {

		String addr = "http://www.kamis.co.kr/service/price/xml.do?action=dailySalesList";
		String parameter = "";

		parameter = parameter + "&" + "p_cert_key=111";
		parameter = parameter + "&" + "p_cert_id=222";
		parameter = parameter + "&" + "p_returntype=json";
			
		addr = addr + parameter;

		URL url = new URL(addr);

		InputStream in = url.openStream();

		ByteArrayOutputStream bos = new ByteArrayOutputStream();
		IOUtils.copy(in, bos);
		in.close();
		bos.close();

		String str = bos.toString("utf-8");
		
		JSONObject json = new JSONObject();
		json.put("data", str);

		PrintWriter out = response.getWriter();

		byte[] b = str.getBytes("UTF-8");
		String s = new String(b, "UTF-8");

		out.println(s);
		out.flush();
		out.close();

	}
}
