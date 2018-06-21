package com.kh.farm.weather.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.farm.member.model.service.MemberService;
import com.kh.farm.member.model.vo.Member;

import jxl.Sheet;
import jxl.Workbook;

/**
 * Handles requests for the application home page.
 */
@Controller
public class WeatherController {
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value = "Weather.do", method = RequestMethod.GET, produces = "application/json; application/text; application/xml; charset=utf8")
	@ResponseBody
	public void Weather(HttpServletResponse response, @RequestParam("id") String rid) throws ServletException, IOException {
		response.setContentType("application/json; charset=utf-8");
		String oneAddr="서울특별시";
		String twoAddr="강남구";
		if(!rid.equals("")) {
		Member id = memberService.selectIdCheck(rid);
		String memAddr = id.getMember_addr();
		if(memAddr.substring(0,memAddr.indexOf(" ")).equals("서울")) {
			oneAddr="서울특별시";
		}else {
			oneAddr = memAddr.substring(0,memAddr.indexOf(" "));
		}
		twoAddr = memAddr.substring(memAddr.indexOf(" ")+1,memAddr.indexOf("구 ")+1);
		}

		String addr = "http://newsky2.kma.go.kr/service/SecndSrtpdFrcstInfoService2/ForecastSpaceData?serviceKey=";
		String serviceKey = "hp%2F%2F3ly9hcciezptAxLaI4RcV63nphv5o4S12L6dmZX3PzG0AzaUKF1ddLslCxp3HH5V9GaezX2ZgNG8Nyuqhw%3D%3D";
		String parameter = "";
		String nx="";
		String ny="";
		PrintWriter out = response.getWriter();
		Calendar calendar = Calendar.getInstance();
		Date date = calendar.getTime();
		String base_date = new SimpleDateFormat("yyyyMMdd").format(date);
		String bt = new SimpleDateFormat("kkmm").format(date);
		int base_time = Integer.parseInt(bt);

		/* 02:10, 05:10, 08:10, 11:10, 14:10, 20:10, 23:10 */
		if (base_time < 0210) {
			base_time = 2310;
		} else if (base_time < 0510) {
			base_time = 0210;
		} else if (base_time < 810) {
			base_time = 0510;
		} else if (base_time < 1110) {
			base_time = 810;
		} else if (base_time < 1410) {
			base_time = 1110;
		} else if (base_time < 2010) {
			base_time = 1410;
		} else if (base_time < 2310) {
			base_time = 2010;
		}

		int check=0;
		File file = new File(this.getClass().getResource(".").getPath() + "weather_info.xls");

		if (!file.exists()) {
			System.out.println("파일이 없습니다.");
		}

		Workbook workbook = null;
		Sheet sheet = null;

		try {

			workbook = Workbook.getWorkbook(file);
			sheet = workbook.getSheet(0);
			int row = sheet.getRows();
			int col = sheet.getColumns();

			for (int i = 0; i < row; i++) {
				for (int j = 0; j < col; j++) {
					if(sheet.getCell(j, i).getContents().equals(oneAddr) && sheet.getCell(j+1, i).getContents().equals(twoAddr)) {
						nx=""+sheet.getCell(j+3, i).getContents();
						ny=""+sheet.getCell(j+4, i).getContents();
						check=1;
						break;
					}
				}
				if(check==1) {
					break;
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (workbook != null) {
					workbook.close();
				}
			} catch (Exception e) {
			}
		}


		parameter = parameter + "&" + "base_date=" + base_date;
		if (base_time == 810) {
			parameter = parameter + "&" + "base_time=0" + base_time;
		} else {
			parameter = parameter + "&" + "base_time=" + base_time;
		}
		parameter = parameter + "&" + "nx="+nx+"&ny="+ny;
		parameter = parameter + "&" + "numOfRows=15&pageSize=15&pageNo=1&startPage=1";
		parameter = parameter + "&" + "_type=json";
		addr = addr + serviceKey + parameter;
		URL url = new URL(addr);

		InputStream in = url.openStream();

		ByteArrayOutputStream bos = new ByteArrayOutputStream();
		IOUtils.copy(in, bos);
		in.close();
		bos.close();

		String str = bos.toString("UTF-8");

		JSONObject json = new JSONObject();
		json.put("data", str);

		byte[] b = str.getBytes("UTF-8");
		String s = new String(b, "UTF-8");
		out.println(s);
		out.flush();
		out.close();

	}

}