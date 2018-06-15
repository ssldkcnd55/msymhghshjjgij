package com.kh.farm.qna.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.farm.market.model.vo.Market;
import com.kh.farm.member.model.vo.Member;
import com.kh.farm.qna.model.service.QnaService;
import com.kh.farm.qna.model.vo.MainQna;
import com.kh.farm.qna.model.vo.Market_qna;



@Controller
public class QnaController {
	@Autowired private QnaService qnaService;
	
	@RequestMapping("cus_qna_list.do")
	public void selectCusQnaList(HttpServletResponse response,@RequestParam("page") int currentPage,Member member) throws IOException{
		
		JSONArray jarr =new JSONArray();
		
		ArrayList<Market_qna> QnaList = qnaService.selectCusQnaList(currentPage);
		int limitPage = 10;
		int listCount = qnaService.selectCusQnaListCount();
		
		int maxPage=(int)((double)listCount/limitPage+0.9); //ex) 41개면 '5'페이지나와야되는데 '5'를 계산해줌
		int startPage=((int)((double)currentPage/5+0.8)-1)*5+1;
		int endPage=startPage+5-1;
		
		if(maxPage<endPage) {
			endPage = maxPage;
		}
		for (Market_qna sq : QnaList) {
			if(member.getMember_id().equals(sq.getMember_id())) {
			JSONObject json = new JSONObject();
			json.put("rnum", sq.getRnum());
			json.put("market_qna_no", sq.getMarket_qna_no());
			json.put("member_id", sq.getMember_id());
			json.put("market_qna_question_date", sq.getMarket_qna_question_date().toString());
			json.put("market_qna_title", sq.getMarket_qna_title());
			json.put("startPage", startPage);
			json.put("endPage", endPage);
			json.put("maxPage", maxPage);
			json.put("currentPage",currentPage);
			jarr.add(json);
			}
		}
		
		JSONObject sendJson = new JSONObject();
		sendJson.put("list", jarr);
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.append(sendJson.toJSONString());
		out.flush();
		out.close();
		
	}

	@RequestMapping(value="qnaList.do")
	public void qnaList(Market mk, HttpServletResponse response,@RequestParam("page") int currentPage,@RequestParam(value="qnaSearch",required=false) String qnaSearch) throws IOException{
		
		JSONArray jarr =new JSONArray();
		
		ArrayList<Market_qna> qnaList = qnaService.selectQnaList(mk,currentPage,qnaSearch);
		int limitPage = 10;
		
		int listCount = qnaService.selectQnaCount(mk,qnaSearch);
		
		int maxPage=(int)((double)listCount/limitPage+0.9); //ex) 41개면 '5'페이지나와야되는데 '5'를 계산해줌
		int startPage=((int)((double)currentPage/5+0.8)-1)*5+1;
		int endPage=startPage+5-1;
		
		if(maxPage<endPage) {
			endPage = maxPage;
		}
		for (Market_qna sq : qnaList) {
			JSONObject jsq = new JSONObject();
			jsq.put("rnum", sq.getRnum());
			jsq.put("market_qna_no", sq.getMarket_qna_no());
			jsq.put("member_id", sq.getMember_id());
			jsq.put("market_qna_question_date", sq.getMarket_qna_question_date().toString());
			jsq.put("market_qna_title", sq.getMarket_qna_title());
			jsq.put("startPage", startPage);
			jsq.put("endPage", endPage);
			jsq.put("maxPage", maxPage);
			jsq.put("currentPage",currentPage);
			jarr.add(jsq);
		}
		
		JSONObject sendJson = new JSONObject();
		sendJson.put("list", jarr);
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.append(sendJson.toJSONString());
		out.flush();
		out.close();
	}
	@RequestMapping("marketQnaDetail.do")
	public ModelAndView marketQnaDetail(ModelAndView mv,@RequestParam("qna_no") int qna_no,@RequestParam(value="member_id", required=false) String member_id) {
		Market_qna qna = qnaService.selectQna(qna_no);
		qna.setMarket_qna_contents(qna.getMarket_qna_contents().replace("\"", "'"));
		mv.addObject("qna",qna);
		mv.addObject("member_id", member_id);
		mv.setViewName("market/marketQnaDetail");
		return mv;
	}
	@RequestMapping(value="mainqnaList.do")
	public void MainQnaList(HttpServletResponse response,@RequestParam("page") int currentPage,Member member,@RequestParam(value="qnaSearch", required=false) 
	String qnaSearch) throws IOException{
		
		JSONArray jarr =new JSONArray();
		System.out.println("컨트롤러:"+ qnaSearch);
		ArrayList<MainQna> qnaList = qnaService.selectMainQnaList(currentPage,qnaSearch);
		int limitPage = 10;
		System.out.println("111");
		int listCount = qnaService.selectMainQnaCount(qnaSearch);
		
		int maxPage=(int)((double)listCount/limitPage+0.9); //ex) 41개면 '5'페이지나와야되는데 '5'를 계산해줌
		int startPage=((int)((double)currentPage/5+0.8)-1)*5+1;
		int endPage=startPage+5-1;
		
		if(maxPage<endPage) {
			endPage = maxPage;
		}
		for (MainQna sq : qnaList) {
			JSONObject jsq = new JSONObject();
			jsq.put("rnum", sq.getRnum());
			jsq.put("main_qna_no", sq.getMain_qna_no());
			jsq.put("member_id", sq.getMember_id());
			jsq.put("main_qna_date", sq.getMain_qna_date().toString());
			jsq.put("main_qna_title", sq.getMain_qna_title());
			jsq.put("startPage", startPage);
			jsq.put("endPage", endPage);
			jsq.put("maxPage", maxPage);
			jsq.put("currentPage",currentPage);
			
			jarr.add(jsq);
			
	}
		
		JSONObject sendJson = new JSONObject();
		sendJson.put("list", jarr);
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.append(sendJson.toJSONString());
		out.flush();
		out.close();
		
	}
	
	@RequestMapping(value="qnaDetail.do")
	public ModelAndView qnaDetail(ModelAndView mv,@RequestParam("main_qna_no") int qna_no) {
		MainQna mq = qnaService.selectMainQnaDetail(qna_no);
		mq.setMain_qna_contents(mq.getMain_qna_contents().replace("\"", "'"));
		mv.addObject("main_qna",mq);
		mv.setViewName("qna/qnaDetail");
		return mv;
	}
	
	@RequestMapping(value="qnaAnswer.do", method=RequestMethod.POST )
	public String qnaAnswer(@RequestParam("main_qna_answer") String qna_answer, @RequestParam("main_qna_no") int qna_no) {
		MainQna mq = new MainQna();
		mq.setMain_qna_answer(qna_answer);
		mq.setMain_qna_no(qna_no);
		
		int mainQ = qnaService.updateAnswer(mq); 

		return "forward:/qnaDetail.do?main_qna_no="+qna_no;
	}
	@RequestMapping(value="marketQnaAnswer.do", method=RequestMethod.POST )
	public String marketQnaAnswer(Market_qna mq) {
		int marketQ = qnaService.updateMarketAnswer(mq); 

		return "forward:/marketQnaDetail.do?qna_no="+mq.getMarket_qna_no();
	}
	@RequestMapping(value ="deleteQnaAnswer.do")
	public String deleteQnaAnswer(@RequestParam("main_qna_no") int qanswer_no) {
		
		int deleteQnaAnswer = qnaService.deleteQnaAnswer(qanswer_no);
		return "forward:/qnaDetail.do?main_qna_no="+qanswer_no;
	}
	
	@RequestMapping(value ="qnaMake.do", method=RequestMethod.POST)
	public String qnaMake(MainQna mq) {
		
		int insertMainQna= qnaService.insertMainQna(mq);
		
		return "qna/qna"; 
		
	}
	@RequestMapping(value="qnaUpdateMove.do") 
	public ModelAndView qnaUpdateMove(ModelAndView mv, MainQna mq) {
		mv.addObject("main_qna",mq);
		mv.setViewName("qna/qnaUpdate");
		
		return mv;
	}
	
	@RequestMapping(value="qnaUpdate.do", method=RequestMethod.POST)
	public String qnaUpdate(MainQna mq) {
		int qnaUpdate = qnaService.updateMainQna(mq);
		
		return "forward:/qnaDetail.do?main_qna_no="+mq.getMain_qna_no();
	}
	
	@RequestMapping(value ="deleteMarketQnaAnswer.do")
	public String deleteMarketQnaAnswer(Market_qna mq) {
		
		int deleteQnaAnswer = qnaService.deleteMarketQnaAnswer(mq.getMarket_qna_no());
		return "forward:/marketQnaDetail.do?qna_no="+mq.getMarket_qna_no();
	}
	@RequestMapping(value="marketQnaUpdateMove.do") 
	public ModelAndView marketQnaUpdateMove(ModelAndView mv, Market_qna mq) {
		mv.addObject("qna",mq);
		mv.setViewName("market/marketQnaUpdate");
		
		return mv;
	}
	@RequestMapping(value="marketQnaUpdate.do", method=RequestMethod.POST)
	public String marketQnaUpdate(Market_qna mq) {
		int qnaUpdate = qnaService.updateMarketQna(mq);
		
		return "forward:/marketQnaDetail.do?qna_no="+mq.getMarket_qna_no();
	}
	@RequestMapping("marketQnaDelete.do")
	public String marketQnaDelete(Market_qna mq) {
		int qnaDelete = qnaService.deleteMarketQna(mq.getMarket_qna_no());
		return "forward:/marketDetail.do?market_no="+mq.getMarket_no();
	}
	@RequestMapping("mainQnaDelete.do")
	public String mainQnaDelete(MainQna mq) {
		int qnaDelete = qnaService.deleteMainQna(mq.getMain_qna_no());
		return "qna/qna";
	}
	
	// qna 다중 이미지 업로드
	@RequestMapping("qnamultiplePhotoUpload.do")
	public void multiplePhotoUpload(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("다중이미지업로드 컨트롤러에 들어옴");
		try {
			// 파일정보
			String sFileInfo = "";
			// 파일명을 받기 - 일반 원본파일명
			String filename = request.getHeader("file-name");
			// 파일 확장자
			String filename_ext = filename.substring(filename.lastIndexOf(".") + 1);
			// 확장자를소문자로 변경
			filename_ext = filename_ext.toLowerCase();
			// 파일 기본경로
			String dftFilePath = request.getSession().getServletContext().getRealPath("resources/upload/qnaUpload/");

			File file = new File(dftFilePath);
			if (!file.exists()) {
				file.mkdirs();
			}
			String realFileNm = "";
			SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
			String today = formatter.format(new java.util.Date());
			realFileNm = today + UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));
			String rlFileNm = dftFilePath + realFileNm;
			///////////////// 서버에 파일쓰기 /////////////////
			InputStream is = request.getInputStream();
			OutputStream os = new FileOutputStream(rlFileNm);
			int numRead;
			byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
			while ((numRead = is.read(b, 0, b.length)) != -1) {
				os.write(b, 0, numRead);
			}
			if (is != null) {
				is.close();
			}
			os.flush();
			os.close();
			sFileInfo += "&bNewLine=true";
			// img 태그의 이름쓰기
			sFileInfo += "&sFileName=" + filename;
			;
			sFileInfo += "&sFileURL=" + "/farm/resources/upload/qnaUpload/" + realFileNm;
			PrintWriter print = response.getWriter();
			print.print(sFileInfo);
			print.flush();
			print.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
}
