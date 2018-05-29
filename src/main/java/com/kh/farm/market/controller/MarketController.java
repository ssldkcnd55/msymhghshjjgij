package com.kh.farm.market.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.config.annotation.web.configurers.ExpressionUrlAuthorizationConfigurer.MvcMatchersAuthorizedUrl;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.farm.auction.model.vo.Auction;
import com.kh.farm.market.exception.DeleteFailException;
import com.kh.farm.market.model.service.MarketService;
import com.kh.farm.market.model.vo.*;
import com.kh.farm.payment.model.vo.*;
import com.kh.farm.qna.model.vo.Market_qna;
import com.kh.farm.shoppingBasket.model.vo.*;

@Controller
public class MarketController {
@Autowired private MarketService marketService;
	

	@RequestMapping(value="marketList.do")
	public ModelAndView marketList(ModelAndView mv,@RequestParam(value="search",required=false) String search) {
		int page = 1;
		ArrayList<Market> list = marketService.selectMarketList(page,search);
		mv.setViewName("market/marketList");
		mv.addObject("list",list);
		mv.addObject("search",search);
		System.out.println(search);
		
		return mv;
	}
	
	@RequestMapping(value="marketDetail.do")
	public ModelAndView marketDetail(ModelAndView mv, Market mk) {
		Market market = marketService.selectMarketInfo(mk.getMarket_no());
		market.setMarket_intro(market.getMarket_intro().replaceAll("\"", "'"));
		mv.setViewName("market/marketDetail");
		mv.addObject("market",market);
		return mv;
		
	}
	
	@RequestMapping(value="ajaxMoreMarket.do", method=RequestMethod.POST)
	public void moreMarketList(HttpServletResponse response,@RequestParam("page") int page,@RequestParam(value="search",required=false) String search) throws IOException{
		List<Market> list = marketService.selectMarketList(page,search);
		JSONArray jarr = new JSONArray();
		
		//list를 jarr로 복사하기
		for(Market m : list) {
			//추출한 user를 json 객체에 담기
			JSONObject jmarket = new JSONObject();
			jmarket.put("market_title", m.getMarket_title());
			jmarket.put("market_no", m.getMarket_no());
			jmarket.put("market_note", m.getMarket_note());
			jmarket.put("market_img", m.getMarket_img());
			jmarket.put("search", m.getSearch());
			
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
	
	@RequestMapping("reviewList.do")
	public void reiviewList(Market mk,HttpServletResponse response,@RequestParam("Rpage") int currentPage)
	throws IOException{
		JSONArray jarr = new JSONArray();
		
		ArrayList<Review> reviewList = marketService.selectReviewList(mk,currentPage);
		int limit = 10;
		int listCount = marketService.selectReviewCount(mk);
		int maxPage=(int)((double)listCount/limit+0.9); //ex) 41개면 '5'페이지나와야되는데 '5'를 계산해줌
		int startPage=((int)((double)currentPage/5+0.8)-1)*5+1;
		int endPage=startPage+5-1;
		
		if(maxPage<endPage) {
			endPage = maxPage;
		}
		
		for(Review rv : reviewList) {
			JSONObject jsq = new JSONObject();
			jsq.put("rnum",rv.getRnum());
			jsq.put("review_no",rv.getReview_no());
			jsq.put("review_title", rv.getReview_title());
			jsq.put("member_id", rv.getMember_id());
			jsq.put("review_date", rv.getReview_date().toString());
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
	
	@RequestMapping("reviewDeatil.do")
	public ModelAndView reviewDeatil(ModelAndView mv,@RequestParam() int review_no) {
		Review review = marketService.selectReviewDetail(review_no);
		review.setReview_contents(review.getReview_contents().replaceAll("\"", "'"));
		mv.addObject("review", review);
		mv.setViewName("market/marketReviewDetail");
		return mv;
		
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
	
	@RequestMapping(value="marketQnaMake.do", method=RequestMethod.POST)
	public String marketQnaMake (Market_qna qna) {
		int mk_no = qna.getMarket_no();
		System.out.println(qna.getMarket_no()+","+qna.getMarket_qna_title()+","+qna.getMarket_qna_contents()+","+qna.getMember_id());
		int insertMarket_qna = marketService.insertMarket_qna(qna);
		return "forward:/marketDetail.do?market_no="+mk_no;
	}
	
	@RequestMapping(value="MarketQnaMakeMove.do")
	public ModelAndView marketQnaMakeMove(ModelAndView mv, Market mk) {
		mv.addObject("market",mk);
		mv.setViewName("market/marketQnaMake");
		return mv;
		
	}
	
	@RequestMapping(value="writeReviewMove.do")
	public ModelAndView writeReviewMove(ModelAndView mv, Market mk) {
		mv.addObject("market",mk);
		mv.setViewName("market/writeReview");
		return mv;
	}
	
	@RequestMapping(value="writeReivew.do", method=RequestMethod.POST)
	public String writeReview (Review rv) {
		int rv_no = rv.getMarket_no();
		int insertReview = marketService.insertReview(rv);
		return "forward:/marketDetail.do?market_no="+rv_no;
	}
	@RequestMapping("dailyList.do")
	public void dailyList(Market market,HttpServletResponse response) throws IOException{
		JSONArray jarr =new JSONArray();
		
		ArrayList<Daily> dailyList = marketService.selectDailyList(market);
		
		for (Daily sq : dailyList) {
			int a = 0;
			int b = 0;
			while(a != -1) {
				a = sq.getDaily_contents().indexOf("<");
				if(a!=-1) {
					b = sq.getDaily_contents().indexOf(">");
					if(b!=-1) {
						String first = sq.getDaily_contents().substring(0, a);
						String second = sq.getDaily_contents().substring(b+1);
						sq.setDaily_contents(first+second);
					}
				}
			}
			JSONObject jsq = new JSONObject();
			jsq.put("daily_no", sq.getDaily_no());
			jsq.put("daily_title", sq.getDaily_title());
			jsq.put("daily_date", sq.getDaily_date().toString());
			jsq.put("daily_contents", sq.getDaily_contents().toString());
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
	@RequestMapping("dailyMakeMove.do")
	public ModelAndView dailyMakeMove(ModelAndView mv, Market market) {
		mv.addObject("market", market);
		mv.setViewName("market/marketDailyMake");
		return mv;
	}
	@RequestMapping("marketDailyMake.do")
	public String marketDailyMake(Daily daily) {
		int result = marketService.insertMarket_daily(daily);
		return "forward:/marketDetail.do?market_no="+daily.getMarket_no();
	}
	
	@RequestMapping("homeNewMarketList.do")
	public void homeNewMarketList(HttpServletResponse response) throws IOException{
		
		ArrayList<Market> list= marketService.selectHomeNewMarketList();
		JSONArray jarr = new JSONArray();
		
		for(Market m : list) {
			//추출한 user를 json 객체에 담기
			JSONObject jmarket = new JSONObject();
			jmarket.put("market_title", m.getMarket_title());
			jmarket.put("market_img",m.getMarket_img());
			jmarket.put("market_price", m.getMarket_price());
			jmarket.put("market_no", m.getMarket_no());
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
	
	@RequestMapping("homePopularMarketList.do")
	public void homePopularMarketList(HttpServletResponse response) throws IOException {
		ArrayList<Market> list= marketService.selectHomePopularMarketList();
		JSONArray jarr = new JSONArray();
		
		for(Market m : list) {
			//추출한 user를 json 객체에 담기
			JSONObject jmarket = new JSONObject();
			jmarket.put("market_title", m.getMarket_title());
			jmarket.put("market_img",m.getMarket_img());
			jmarket.put("market_price", m.getMarket_price());
			jmarket.put("market_no", m.getMarket_no());
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
	
	
	@RequestMapping("marketDailyDetail.do")
	public ModelAndView marketDailyDetail(ModelAndView mv,@RequestParam("daily_no")int daily_no) {
		Daily daily = marketService.selectDailyDetail(daily_no);
		mv.addObject("daily",daily);
		mv.setViewName("market/marketDailyDetail");
		return mv;
	}
	
	@RequestMapping("moveSearchList.do")
	public ModelAndView marketSearchList(ModelAndView mv,@RequestParam(value="search",required=false) String search) {
		Market market = marketService.selectSearchList(search);
		mv.addObject("market_search", mv);
		mv.setViewName("market/marketList");
		return mv;
	}
	
	@RequestMapping(value="ajaxReviewReply.do",method=RequestMethod.POST)
	public void ajaxReviewReply(@RequestParam("review_no")int review_no,HttpServletResponse response,@RequestParam("page") int currentPage ) throws IOException{
		ArrayList<Reply> list = marketService.selectReviewReply(review_no,currentPage);
		JSONArray jarr = new JSONArray();
		JSONArray jarr2 = new JSONArray();
		int limit = 10;
		int listCount = marketService.selectReviewReplyCount(review_no);
		System.out.println(listCount);
		int maxPage=(int)((double)listCount/limit+0.9); //ex) 41개면 '5'페이지나와야되는데 '5'를 계산해줌
		int startPage=((int)((double)currentPage/5+0.8)-1)*5+1;
		int endPage=startPage+5-1;
		if(maxPage<endPage) {
			endPage = maxPage;
		}
		ArrayList<Integer> replyNumber = new ArrayList<Integer>();
		for(Reply r : list) {
			//추출한 user를 json 객체에 담기
			replyNumber.add(r.getReply_no());
			JSONObject jReply = new JSONObject();
			jReply.put("reply_no", r.getReply_no());
			jReply.put("reply_contents",r.getReply_contents());
			jReply.put("reply_date", r.getReply_date().toString());
			jReply.put("member_id", r.getMember_id());
			jReply.put("startPage", startPage);
			jReply.put("endPage", endPage);
			jReply.put("maxPage", maxPage);
			jReply.put("currentPage",currentPage);
			jarr.add(jReply);
		}
		HashMap<String,ArrayList<Integer>> map = new HashMap<String,ArrayList<Integer>>();
		map.put("underReplyList", replyNumber);
		ArrayList<UnderReply> underList = marketService.selectReviewUnderReply(map);
		for(UnderReply ur : underList) {
			JSONObject jReply = new JSONObject();
			jReply.put("under_reply_no", ur.getUnder_reply_no());
			jReply.put("reply_no", ur.getReply_no());
			jReply.put("member_id", ur.getMember_id());
			jReply.put("under_reply_content", ur.getUnder_reply_content());
			jReply.put("under_reply_date", ur.getUnder_reply_date().toString());
			jarr2.add(jReply);
		}
		//전송용 최종 json 객체 선언
		JSONObject sendJson = new JSONObject();
		sendJson.put("list", jarr);
		sendJson.put("list2", jarr2);
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.append(sendJson.toJSONString());
		out.flush();
		out.close();
	}
	@RequestMapping(value="ajaxDailyReply.do",method=RequestMethod.POST)
	public void ajaxDailyReply(@RequestParam("daily_no")int daily_no,HttpServletResponse response,@RequestParam("page") int currentPage ) throws IOException{
		ArrayList<Reply> list = marketService.selectDailyReply(daily_no,currentPage);
		JSONArray jarr = new JSONArray();
		JSONArray jarr2 = new JSONArray();
		int limit = 10;
		int listCount = marketService.selectDailyReplyCount(daily_no);
		System.out.println(listCount);
		int maxPage=(int)((double)listCount/limit+0.9); //ex) 41개면 '5'페이지나와야되는데 '5'를 계산해줌
		int startPage=((int)((double)currentPage/5+0.8)-1)*5+1;
		int endPage=startPage+5-1;
		if(maxPage<endPage) {
			endPage = maxPage;
		}
		ArrayList<Integer> replyNumber = new ArrayList<Integer>();
		for(Reply r : list) {
			//추출한 user를 json 객체에 담기
			replyNumber.add(r.getReply_no());
			JSONObject jReply = new JSONObject();
			jReply.put("reply_no", r.getReply_no());
			jReply.put("reply_contents",r.getReply_contents());
			jReply.put("reply_date", r.getReply_date().toString());
			jReply.put("member_id", r.getMember_id());
			jReply.put("startPage", startPage);
			jReply.put("endPage", endPage);
			jReply.put("maxPage", maxPage);
			jReply.put("currentPage",currentPage);
			jarr.add(jReply);
		}
		HashMap<String,ArrayList<Integer>> map = new HashMap<String,ArrayList<Integer>>();
		map.put("underReplyList", replyNumber);
		ArrayList<UnderReply> underList = marketService.selectDailyUnderReply(map);
		for(UnderReply ur : underList) {
			JSONObject jReply = new JSONObject();
			jReply.put("under_reply_no", ur.getUnder_reply_no());
			jReply.put("reply_no", ur.getReply_no());
			jReply.put("member_id", ur.getMember_id());
			jReply.put("under_reply_content", ur.getUnder_reply_content());
			jReply.put("under_reply_date", ur.getUnder_reply_date().toString());
			jarr2.add(jReply);
		}
		//전송용 최종 json 객체 선언
		JSONObject sendJson = new JSONObject();
		sendJson.put("list", jarr);
		sendJson.put("list2", jarr2);
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.append(sendJson.toJSONString());
		out.flush();
		out.close();
	}
	@RequestMapping(value="marketReviewReply.do",method=RequestMethod.POST)
	public String marketReviewReplyInsert(Reply reply) {
		int insertReviewReply = marketService.insertReply(reply);
		return "forward:/reviewDeatil.do?review_no="+reply.getReview_no();
	}
	@RequestMapping(value="marketDailyReply.do",method=RequestMethod.POST)
	public String marketDailyReplyInsert(Reply reply) {
		int insertReviewReply = marketService.insertReply(reply);
		return "forward:/marketDailyDetail.do?daily_no="+reply.getDaily_no();
	}
	@RequestMapping(value="marketReviewUnderReply.do",method=RequestMethod.POST)
	public String marketReviewUnderReplyInsert(UnderReply reply,@RequestParam("review_no")int review_no) {
		int insertReviewReply = marketService.insertUnderReply(reply);
		return "forward:/reviewDeatil.do?review_no="+review_no;
	}
	@RequestMapping(value="marketDetailUnderReply.do",method=RequestMethod.POST)
	public String marketDetailUnderReplyInsert(UnderReply reply,@RequestParam("daily_no")int daily_no) {
		int insertReviewReply = marketService.insertUnderReply(reply);
		return "forward:/marketDailyDetail.do?daily_no="+daily_no;
	}
	@RequestMapping("marketReplyDelete.do")
	public String marketReplyDelete(Reply reply) {
		try {
			int deleteReply = marketService.deleteReply(reply);
		} catch (DeleteFailException e) {
			System.out.println("Exception발생");
			int replyNullUpdate = marketService.updateReplyNull(reply);
		}
		System.out.println("리뷰번호 : "+reply.getReview_no());
		if(reply.getReview_no() != 0) {
			return "forward:/marketDailyDetail.do?review_no="+reply.getReview_no();
		}else {
			return "forward:/reviewDeatil.do?daily_no="+reply.getDaily_no();
		}
	}
	@RequestMapping("marketUnderReplyDelete.do")
	public String marketUnderReplyDelete(UnderReply reply,@RequestParam(value="review_no",required=false) int review_no,
			@RequestParam(value="daily_no",required=false) int daily_no) {
		int deleteUnderReply = marketService.deleteUnderReply(reply);
		if(review_no != 0) {
			return "forward:/marketDailyDetail.do?review_no="+review_no;
		}else {
			return "forward:/reviewDeatil.do?daily_no="+daily_no;
		}
	}
}
