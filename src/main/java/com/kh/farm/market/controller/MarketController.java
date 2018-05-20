package com.kh.farm.market.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.farm.market.model.service.MarketService;
import com.kh.farm.market.model.vo.Market;

@Controller
public class MarketController {
@Autowired private MarketService marketService;

	@RequestMapping(value="marketList.do")
	public ModelAndView marketList(ModelAndView mv) {
		int page = 1;
		ArrayList<Market> list = marketService.selectMarketList(page);
		mv.setViewName("market/marketList");
		mv.addObject("list",list);
		return mv;
	}
	
	@RequestMapping(value="marketDetail.do")
	public ModelAndView marketDetail(ModelAndView mv, Market mk) {
		Market market = marketService.selectMarketInfo(mk.getMarket_no());
		mv.setViewName("market/marketDetail");
		mv.addObject("market",market);
		return mv;
		
	}
	@RequestMapping(value="ajaxMoreMarket.do", method=RequestMethod.POST)
	public void moreMarketList(HttpServletResponse response,@RequestParam("page") int page) throws IOException{
		List<Market> list = marketService.selectMarketList(page);
		JSONArray jarr = new JSONArray();
		
		//list를 jarr로 복사하기
		for(Market m : list) {
			//추출한 user를 json 객체에 담기
			JSONObject jmarket = new JSONObject();
			jmarket.put("market_title", m.getMarket_title());
			jmarket.put("market_no", m.getMarket_no());
			jmarket.put("market_note", m.getMarket_note());
			jmarket.put("market_img", m.getMarket_img());
			
			jarr.add(jmarket);
		}
		//전송용 최종 json 객체 선언
		JSONObject sendJson = new JSONObject();
		sendJson.put("list", jarr);
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.append(sendJson.toJSONString());
		out.flush();
		out.close();
	}
	@RequestMapping(value="insertMarketMake.do",method=RequestMethod.POST)
	public String insertMarket(Market market,HttpServletRequest request,
			@RequestParam(name = "upfile", required = false) MultipartFile file) {
		
		String path = request.getSession().getServletContext().getRealPath("resources/upload/marketUpload");
		
		try {
			file.transferTo(new File(path + "\\" + file.getOriginalFilename()));

			if (file.getOriginalFilename() != null) {
				// 첨부된 파일이 있을 경우, 폴더에 기록된 해당 파일의 이름바꾸기 처리함
				// 새로운 파일명 만들기 : '년월일시분초'
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
				String renameFileName = market.getMember_id()+"_"+sdf.format(new java.sql.Date(System.currentTimeMillis())) + "."
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
				market.setMarket_img(renameFileName);
			}
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		int insertMarket = marketService.insertMarket(market);
		return "forward:/marketList.do";
	}
}