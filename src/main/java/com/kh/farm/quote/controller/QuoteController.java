package com.kh.farm.quote.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.MalformedURLException;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.util.URLEncoder;
import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class QuoteController {

	@RequestMapping(value = "QuoteApi.do", method = { RequestMethod.POST,
			RequestMethod.GET }, produces = "application/json; charset=utf8")
	@ResponseBody
	public void QuoteApi(HttpServletResponse response, HttpServletRequest request)
			throws ServletException, IOException {
		System.out.println("시세api접속");

		String productclscode = request.getParameter("productclscode");
		String stardate = request.getParameter("startdate");
		String endday = request.getParameter("endday");
		String itemcategorycode = request.getParameter("itemcategorycode");
		String itemcode = request.getParameter("itemcode");
		String kindcode = request.getParameter("kindcode");
		String productrankcode = request.getParameter("productrankcode");
		String countrycode = request.getParameter("countrycode");
		String convert = request.getParameter("convert");

		String addr = "http://www.kamis.or.kr/service/price/xml.do?action=periodProductList";
		String parameter = "";

		parameter = parameter + "&" + "p_productclscode=" + productclscode;
		parameter = parameter + "&" + "p_startday=" + stardate;
		parameter = parameter + "&" + "p_endday=" + endday;
		parameter = parameter + "&" + "p_itemcategorycode=" + itemcategorycode;
		parameter = parameter + "&" + "p_itemcode=" + itemcode;
		parameter = parameter + "&" + "p_kindcode=" + kindcode;
		parameter = parameter + "&" + "p_productrankcode=" + productrankcode;
		parameter = parameter + "&" + "p_countrycode=" + countrycode;
		parameter = parameter + "&" + "p_convert_kg_yn=" + convert;
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

		System.out.println(in);
		String str = bos.toString("utf-8");

		System.out.println(str);

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
