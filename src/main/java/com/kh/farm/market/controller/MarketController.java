package com.kh.farm.market.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.farm.auction.model.vo.Auction;
import com.kh.farm.common.model.vo.PageNumber;
import com.kh.farm.market.exception.DeleteFailException;
import com.kh.farm.market.model.service.MarketService;
import com.kh.farm.market.model.vo.*;
import com.kh.farm.payment.model.vo.*;
import com.kh.farm.qna.model.vo.Market_qna;
import com.kh.farm.shoppingBasket.model.vo.*;

@Controller
public class MarketController {
	@Autowired
	private MarketService marketService;
	
	@RequestMapping("market_seller_history_list.do")
	public void selectSellerPaymentHistory(HttpServletResponse response,@RequestParam("page") int currentPage,PageNumber pa)
			throws IOException {
		JSONArray jarr = new JSONArray();

		ArrayList<Market> MarketList = marketService.selectSellerMarketHistory(currentPage,pa);
		System.out.println(";;"+MarketList);
		int limitPage = 10;	
		int listCount = marketService.selectSellerMarketHistoryCount();
		int maxPage = (int) ((double) listCount / limitPage + 0.9); // ex) 41개면 '5'페이지나와야되는데 '5'를 계산해줌
		int startPage = ((int) ((double) currentPage / 5 + 0.8) - 1) * 5 + 1;
		int endPage = startPage + 5 - 1;

		if (maxPage < endPage) {
			endPage = maxPage;
		}
		for (Market ac : MarketList) {
			JSONObject json = new JSONObject();
			json.put("rnum", ac.getRnum());
			json.put("market_title", ac.getMarket_title());
			json.put("market_no", ac.getMarket_no());
			json.put("market_complete", ac.getMarket_complete());
			json.put("startPage", startPage);
			json.put("endPage", endPage);
			json.put("maxPage", maxPage);
			json.put("currentPage", currentPage);
			jarr.add(json);
		}

		JSONObject sendJson = new JSONObject();
		sendJson.put("list", jarr);
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.append(sendJson.toJSONString());
		out.flush();
		out.close();

	}

	@RequestMapping(value = "marketList.do")
	public ModelAndView marketList(ModelAndView mv, @RequestParam(value = "search", required = false) String search) {
		int page = 1;
		String ctype = null;
		String cname = null;
		String sort = "market_no";
		System.out.println(search);
		ArrayList<Market> list = marketService.selectMarketList(page, search, ctype, cname, sort);
		mv.setViewName("market/marketList");
		mv.addObject("list", list);
		mv.addObject("search", search);

		return mv;
	}

	@RequestMapping(value = "marketDetail.do")
	public ModelAndView marketDetail(ModelAndView mv, Market mk) {
		Market market = marketService.selectMarketInfo(mk.getMarket_no());
		market.setMarket_intro(market.getMarket_intro().replaceAll("\"", "'"));
		mv.setViewName("market/marketDetail");
		mv.addObject("market", market);
		return mv;

	}
	
	@RequestMapping(value = "ajaxMoreMarket.do", method = RequestMethod.POST)
	public void moreMarketList(HttpServletResponse response, @RequestParam("page") int page,
			@RequestParam(value = "search", required = false) String search,
			@RequestParam(value = "ctype", required = false) String ctype,
			@RequestParam(value = "cname", required = false) String cname,
			@RequestParam(value = "sort", required = false) String sort) throws IOException {
		System.out.println("ajax sort : " + sort);
		List<Market> list = marketService.selectMarketList(page, search, ctype, cname, sort);
		JSONArray jarr = new JSONArray();
		JSONArray jarr2 = new JSONArray();

		// list를 jarr로 복사하기
		for (Market m : list) {
			// 추출한 user를 json 객체에 담기
			JSONObject jmarket = new JSONObject();
			jmarket.put("market_title", m.getMarket_title());
			jmarket.put("market_no", m.getMarket_no());
			jmarket.put("market_note", m.getMarket_note());
			jmarket.put("market_img", m.getMarket_img());
			jmarket.put("search", m.getSearch());
			jmarket.put("market_amount", m.getMarket_amount());
			jmarket.put("remaining", m.getRemaining());
			
			jmarket.put("market_price", m.getMarket_price());
			jmarket.put("sort", sort);

			jarr.add(jmarket);
		}
		// 전송용 최종 json 객체 선언
		JSONObject sendJson = new JSONObject();
		sendJson.put("list", jarr);
		List<Category> list2 = new ArrayList<Category>();
		if (ctype != null) {
			list2 = marketService.selectCategory(ctype);
			for (Category c : list2) {
				JSONObject jmarket = new JSONObject();
				jmarket.put("category_no", c.getCategory_no());
				jmarket.put("category_name", c.getCategory_name());
				jmarket.put("category_main", c.getCategory_main());
				jarr2.add(jmarket);
			}
			sendJson.put("list2", jarr2);
		}
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.append(sendJson.toJSONString());
		out.flush();
		out.close();
	}

	@RequestMapping("ajaxCategory.do")
	public void categoryList(HttpServletResponse response) throws IOException {
		List<Category> list = marketService.selectCategoryList();
		JSONArray jarr = new JSONArray();

		// list를 jarr로 복사하기
		for (Category c : list) {
			JSONObject jmarket = new JSONObject();
			jmarket.put("category_main", c.getCategory_main());

			jarr.add(jmarket);
		}
		JSONObject sendJson = new JSONObject();
		sendJson.put("list", jarr);
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.append(sendJson.toJSONString());
		out.flush();
		out.close();
	}
	
	@RequestMapping("ajaxCategoryName.do")
	public void categoryNameList(HttpServletResponse response,@RequestParam("category_main") String category_main) throws IOException {
		List<Category> list = marketService.selectCategoryNameList(category_main);
		JSONArray jarr = new JSONArray();

		// list를 jarr로 복사하기
		for (Category c : list) {
			JSONObject jmarket = new JSONObject();
			jmarket.put("category_name", c.getCategory_name());
			jmarket.put("category_no", c.getCategory_no());

			jarr.add(jmarket);
		}
		JSONObject sendJson = new JSONObject();
		sendJson.put("list", jarr);
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.append(sendJson.toJSONString());
		out.flush();
		out.close();
	}
	@RequestMapping("reviewList.do")
	public void reiviewList(Market mk,HttpServletResponse response,@RequestParam("Rpage") int currentPage, @RequestParam(value="reviewSearch",required=false) String reviewSearch)
	throws IOException{

		JSONArray jarr = new JSONArray();
		
		ArrayList<Review> reviewList = marketService.selectReviewList(mk,currentPage,reviewSearch);

		int limit = 10;
		int listCount = marketService.selectReviewCount(mk,reviewSearch);
		int maxPage=(int)((double)listCount/limit+0.9); //ex) 41개면 '5'페이지나와야되는데 '5'를 계산해줌
		int startPage=((int)((double)currentPage/5+0.8)-1)*5+1;
		int endPage=startPage+5-1;
		
		if(maxPage<endPage) {
			endPage = maxPage;
		}

		for (Review rv : reviewList) {
			JSONObject jsq = new JSONObject();
			jsq.put("rnum", rv.getRnum());
			jsq.put("review_no", rv.getReview_no());
			jsq.put("review_title", rv.getReview_title());
			jsq.put("member_id", rv.getMember_id());
			jsq.put("review_date", rv.getReview_date().toString());
			jsq.put("startPage", startPage);
			jsq.put("endPage", endPage);
			jsq.put("maxPage", maxPage);
			jsq.put("currentPage",currentPage);
			jsq.put("reviewSearch",reviewSearch);
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
	public ModelAndView reviewDeatil(ModelAndView mv, @RequestParam() int review_no) {
		Review review = marketService.selectReviewDetail(review_no);
		review.setReview_contents(review.getReview_contents().replaceAll("\"", "'"));
		mv.addObject("review", review);
		mv.setViewName("market/marketReviewDetail");
		return mv;

	}

	@RequestMapping(value = "insertMarketMake.do", method = RequestMethod.POST)
	public String insertMarket(Market market, HttpServletRequest request,
			@RequestParam(name = "upfile", required = false) MultipartFile file) {
		String path = request.getSession().getServletContext().getRealPath("resources/upload/marketUpload");

		try {
			file.transferTo(new File(path + "\\" + file.getOriginalFilename()));

			if (file.getOriginalFilename() != null) {
				// 첨부된 파일이 있을 경우, 폴더에 기록된 해당 파일의 이름바꾸기 처리함
				// 새로운 파일명 만들기 : '년월일시분초'
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
				String renameFileName = market.getMember_id() + "_"
						+ sdf.format(new java.sql.Date(System.currentTimeMillis())) + "."
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

	@RequestMapping(value = "marketQnaMake.do", method = RequestMethod.POST)
	public String marketQnaMake(Market_qna qna) {
		int mk_no = qna.getMarket_no();
		System.out.println(qna.getMarket_no() + "," + qna.getMarket_qna_title() + "," + qna.getMarket_qna_contents()
				+ "," + qna.getMember_id());
		int insertMarket_qna = marketService.insertMarket_qna(qna);
		return "forward:/marketDetail.do?market_no=" + mk_no;
	}

	@RequestMapping(value = "MarketQnaMakeMove.do")
	public ModelAndView marketQnaMakeMove(ModelAndView mv, Market mk) {
		mv.addObject("market", mk);
		mv.setViewName("market/marketQnaMake");
		return mv;

	}

	@RequestMapping(value = "writeReviewMove.do")
	public ModelAndView writeReviewMove(ModelAndView mv, Market mk) {
		mv.addObject("market", mk);
		mv.setViewName("market/writeReview");
		return mv;
	}

	@RequestMapping(value = "writeReivew.do", method = RequestMethod.POST)
	public String writeReview(Review rv) {
		int rv_no = rv.getMarket_no();
		int insertReview = marketService.insertReview(rv);
		return "forward:/marketDetail.do?market_no=" + rv_no;
	}

	@RequestMapping("dailyList.do")
	public void dailyList(Market market, HttpServletResponse response) throws IOException {
		JSONArray jarr = new JSONArray();

		ArrayList<Daily> dailyList = marketService.selectDailyList(market);

		for (Daily sq : dailyList) {
			int a = 0;
			int b = 0;
			while (a != -1) {
				a = sq.getDaily_contents().indexOf("<");
				if (a != -1) {
					b = sq.getDaily_contents().indexOf(">");
					if (b != -1) {
						String first = sq.getDaily_contents().substring(0, a);
						String second = sq.getDaily_contents().substring(b + 1);
						sq.setDaily_contents(first + second);
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
		return "forward:/marketDetail.do?market_no=" + daily.getMarket_no();
	}

	@RequestMapping("homeNewMarketList.do")
	public void homeNewMarketList(HttpServletResponse response) throws IOException {

		ArrayList<Market> list = marketService.selectHomeNewMarketList();
		JSONArray jarr = new JSONArray();

		for (Market m : list) {
			// 추출한 user를 json 객체에 담기
			JSONObject jmarket = new JSONObject();
			jmarket.put("market_title", m.getMarket_title());
			jmarket.put("market_img", m.getMarket_img());
			jmarket.put("market_price", m.getMarket_price());
			jmarket.put("market_no", m.getMarket_no());
			jarr.add(jmarket);

		}
		// 전송용 최종 json 객체 선언
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
		ArrayList<Market> list = marketService.selectHomePopularMarketList();
		JSONArray jarr = new JSONArray();

		for (Market m : list) {
			// 추출한 user를 json 객체에 담기
			JSONObject jmarket = new JSONObject();
			jmarket.put("market_title", m.getMarket_title());
			jmarket.put("market_img", m.getMarket_img());
			jmarket.put("market_price", m.getMarket_price());
			jmarket.put("market_no", m.getMarket_no());
			jarr.add(jmarket);

		}
		// 전송용 최종 json 객체 선언
		JSONObject sendJson = new JSONObject();
		sendJson.put("list", jarr);
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.append(sendJson.toJSONString());
		out.flush();
		out.close();

	}

	@RequestMapping("marketDailyDetail.do")
	public ModelAndView marketDailyDetail(ModelAndView mv, @RequestParam("daily_no") int daily_no) {
		Daily daily = marketService.selectDailyDetail(daily_no);
		mv.addObject("daily", daily);
		mv.setViewName("market/marketDailyDetail");
		return mv;
	}

	@RequestMapping("moveSearchList.do")
	public ModelAndView marketSearchList(ModelAndView mv,
			@RequestParam(value = "search", required = false) String search) {
		Market market = marketService.selectSearchList(search);
		mv.addObject("market_search", mv);
		mv.setViewName("market/marketList");
		return mv;
	}

	@RequestMapping(value = "ajaxReviewReply.do", method = RequestMethod.POST)
	public void ajaxReviewReply(@RequestParam("review_no") int review_no, HttpServletResponse response,
			@RequestParam("page") int currentPage) throws IOException {
		ArrayList<Reply> list = marketService.selectReviewReply(review_no, currentPage);
		JSONArray jarr = new JSONArray();
		JSONArray jarr2 = new JSONArray();
		int limit = 10;
		int listCount = marketService.selectReviewReplyCount(review_no);
		System.out.println(listCount);
		int maxPage = (int) ((double) listCount / limit + 0.9); // ex) 41개면 '5'페이지나와야되는데 '5'를 계산해줌
		int startPage = ((int) ((double) currentPage / 5 + 0.8) - 1) * 5 + 1;
		int endPage = startPage + 5 - 1;
		if (maxPage < endPage) {
			endPage = maxPage;
		}
		ArrayList<Integer> replyNumber = new ArrayList<Integer>();
		for (Reply r : list) {
			// 추출한 user를 json 객체에 담기
			replyNumber.add(r.getReply_no());
			JSONObject jReply = new JSONObject();
			jReply.put("reply_no", r.getReply_no());
			jReply.put("reply_contents", r.getReply_contents());
			jReply.put("reply_date", r.getReply_date().toString());
			jReply.put("member_id", r.getMember_id());
			jReply.put("startPage", startPage);
			jReply.put("endPage", endPage);
			jReply.put("maxPage", maxPage);
			jReply.put("currentPage", currentPage);
			jarr.add(jReply);
		}
		HashMap<String, ArrayList<Integer>> map = new HashMap<String, ArrayList<Integer>>();
		map.put("underReplyList", replyNumber);
		JSONObject sendJson = new JSONObject();
		try {
			ArrayList<UnderReply> underList = marketService.selectReviewUnderReply(map);
			for (UnderReply ur : underList) {
				JSONObject jReply = new JSONObject();
				jReply.put("under_reply_no", ur.getUnder_reply_no());
				jReply.put("reply_no", ur.getReply_no());
				jReply.put("member_id", ur.getMember_id());
				jReply.put("under_reply_content", ur.getUnder_reply_content());
				jReply.put("under_reply_date", ur.getUnder_reply_date().toString());
				jarr2.add(jReply);
			}
			sendJson.put("list2", jarr2);
		} catch (DeleteFailException e) {

		}

		// 전송용 최종 json 객체 선언

		sendJson.put("list", jarr);

		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.append(sendJson.toJSONString());
		out.flush();
		out.close();
	}

	@RequestMapping(value = "ajaxDailyReply.do", method = RequestMethod.POST)
	public void ajaxDailyReply(@RequestParam("daily_no") int daily_no, HttpServletResponse response,
			@RequestParam("page") int currentPage) throws IOException {
		ArrayList<Reply> list = marketService.selectDailyReply(daily_no, currentPage);
		JSONArray jarr = new JSONArray();
		JSONArray jarr2 = new JSONArray();
		int limit = 10;
		int listCount = marketService.selectDailyReplyCount(daily_no);
		System.out.println(listCount);
		int maxPage = (int) ((double) listCount / limit + 0.9); // ex) 41개면 '5'페이지나와야되는데 '5'를 계산해줌
		int startPage = ((int) ((double) currentPage / 5 + 0.8) - 1) * 5 + 1;
		int endPage = startPage + 5 - 1;
		if (maxPage < endPage) {
			endPage = maxPage;
		}
		ArrayList<Integer> replyNumber = new ArrayList<Integer>();
		for (Reply r : list) {
			// 추출한 user를 json 객체에 담기
			replyNumber.add(r.getReply_no());
			JSONObject jReply = new JSONObject();
			jReply.put("reply_no", r.getReply_no());
			jReply.put("reply_contents", r.getReply_contents());
			jReply.put("reply_date", r.getReply_date().toString());
			jReply.put("member_id", r.getMember_id());
			jReply.put("startPage", startPage);
			jReply.put("endPage", endPage);
			jReply.put("maxPage", maxPage);
			jReply.put("currentPage", currentPage);
			jarr.add(jReply);
		}
		HashMap<String, ArrayList<Integer>> map = new HashMap<String, ArrayList<Integer>>();
		map.put("underReplyList", replyNumber);
		JSONObject sendJson = new JSONObject();
		try {
			ArrayList<UnderReply> underList = marketService.selectDailyUnderReply(map);
			for (UnderReply ur : underList) {
				JSONObject jReply = new JSONObject();
				jReply.put("under_reply_no", ur.getUnder_reply_no());
				jReply.put("reply_no", ur.getReply_no());
				jReply.put("member_id", ur.getMember_id());
				jReply.put("under_reply_content", ur.getUnder_reply_content());
				jReply.put("under_reply_date", ur.getUnder_reply_date().toString());
				jarr2.add(jReply);
			}
			sendJson.put("list2", jarr2);
		} catch (DeleteFailException e) {

		}
		// 전송용 최종 json 객체 선언

		sendJson.put("list", jarr);

		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.append(sendJson.toJSONString());
		out.flush();
		out.close();
	}

	@RequestMapping(value = "marketReviewReply.do", method = RequestMethod.POST)
	public String marketReviewReplyInsert(Reply reply) {
		int insertReviewReply = marketService.insertReply(reply);
		return "forward:/reviewDeatil.do?review_no=" + reply.getReview_no();
	}

	@RequestMapping(value = "marketDailyReply.do", method = RequestMethod.POST)
	public String marketDailyReplyInsert(Reply reply) {
		int insertReviewReply = marketService.insertReply(reply);
		return "forward:/marketDailyDetail.do?daily_no=" + reply.getDaily_no();
	}

	@RequestMapping(value = "marketReviewReplyUpdate.do", method = RequestMethod.POST)
	public String marketReviewReplyUpdate(Reply reply) {
		int updateReviewReply = marketService.updateReviewReply(reply);
		return "forward:/reviewDeatil.do?daily_no=" + reply.getReview_no();
	}

	@RequestMapping(value = "marketDailyReplyUpdate.do", method = RequestMethod.POST)
	public String marketDailyReplyUpdate(Reply reply) {
		int updateDailyReply = marketService.updateDailyReply(reply);
		return "forward:/marketDailyDetail.do?daily_no=" + reply.getDaily_no();
	}

	@RequestMapping(value = "marketReviewUnderReplyUpdate.do", method = RequestMethod.POST)
	public String marketReviewUnderReplyUpdate(UnderReply reply, @RequestParam("review_no") int review_no) {
		int updateReviewUnderReply = marketService.updateReviewUnderReply(reply);
		return "forward:/reviewDeatil.do?daily_no=" + review_no;
	}

	@RequestMapping(value = "marketDailyUnderReplyUpdate.do", method = RequestMethod.POST)
	public String marketDailyUnderReplyUpdate(UnderReply reply, @RequestParam("daily_no") int daily_no) {
		int updateDailyUnderReply = marketService.updateReviewUnderReply(reply);
		return "forward:/marketDailyDetail.do?daily_no=" + daily_no;
	}

	@RequestMapping(value = "marketReviewUnderReply.do", method = RequestMethod.POST)
	public String marketReviewUnderReplyInsert(UnderReply reply, @RequestParam("review_no") int review_no) {
		int insertReviewReply = marketService.insertUnderReply(reply);
		return "forward:/reviewDeatil.do?review_no=" + review_no;
	}

	@RequestMapping(value = "marketDailyUnderReply.do", method = RequestMethod.POST)
	public String marketDailyUnderReplyInsert(UnderReply reply, @RequestParam("daily_no") int daily_no) {
		int insertReviewReply = marketService.insertUnderReply(reply);
		return "forward:/marketDailyDetail.do?daily_no=" + daily_no;
	}

	@RequestMapping("marketReplyDelete.do")
	public String marketReplyDelete(Reply reply) {
		try {
			int deleteReply = marketService.deleteReply(reply);
		} catch (DeleteFailException e) {
			int replyNullUpdate = marketService.updateReplyNull(reply);
		}
		System.out.println("리뷰번호 : " + reply.getReview_no());
		if (reply.getReview_no() != 0) {
			return "forward:/reviewDeatil.do?review_no=" + reply.getReview_no();
		} else {
			return "forward:/marketDailyDetail.do?daily_no=" + reply.getDaily_no();
		}
	}

	@RequestMapping("marketUnderReplyDelete.do")
	public String marketUnderReplyDelete(UnderReply reply, @RequestParam("no") int no, @RequestParam("type") int type) {
		int deleteUnderReply = marketService.deleteUnderReply(reply);
		if (type == 0) {
			return "forward:/marketDailyDetail.do?daily_no=" + no;
		} else {
			return "forward:/reviewDeatil.do?review_no=" + no;
		}
	}

	@RequestMapping("marketDailyUpdateMove.do")
	public ModelAndView marketDailyUpdateMove(ModelAndView mv, @RequestParam("daily_no") int daily_no) {
		Daily daily = marketService.selectDailyDetail(daily_no);
		mv.addObject("daily", daily);
		mv.setViewName("market/marketDailyUpdate");
		return mv;
	}

	@RequestMapping("marketReviewUpdateMove.do")
	public ModelAndView marketReviewUpdateMove(ModelAndView mv, @RequestParam("review_no") int review_no) {
		Review review = marketService.selectReviewDetail(review_no);
		mv.addObject("review", review);
		mv.setViewName("market/marketReviewUpdate");
		return mv;
	}

	@RequestMapping(value = "marketDailyUpdate.do", method = RequestMethod.POST)
	public String marketDailyUpdate(Daily daily) {
		int updateDaily = marketService.updateDaily(daily);
		return "forward:/marketDailyDetail.do?daily_no=" + daily.getDaily_no();
	}

	@RequestMapping(value = "marketReviewUpdate.do", method = RequestMethod.POST)
	public String marketDailyUpdate(Review review) {
		int updateReview = marketService.updateReview(review);
		return "forward:/reviewDeatil.do?review_no=" + review.getReview_no();
	}

	@RequestMapping("marketDailyDelete.do")
	public String marketDailyDelete(Daily daily) {
		int deleteDaily = marketService.deleteDaily(daily);
		return "forward:/marketDetail.do?market_no=" + daily.getMarket_no();
	}

	@RequestMapping("marketReviewDelete.do")
	public String marketDailyDelete(Review review) {
		int deleteReview = marketService.deleteReview(review);
		return "forward:/marketDetail.do?market_no=" + review.getMarket_no();
	}

	@RequestMapping(value = "sellerMarketList.do", method = RequestMethod.POST)
	public void sellerMarketList(@RequestParam("member_id") String member_id,@RequestParam("market_no") int market_no, HttpServletResponse response)
			throws IOException {
		List<Market> list = marketService.selectSellerMarketList(member_id,market_no);
		int sellerMarketCount = marketService.selectSellerMarketCount(member_id,market_no);

		JSONArray jarr = new JSONArray();
		
		// list를 jarr로 복사하기
		for (Market m : list) {
			// 추출한 user를 json 객체에 담기
			JSONObject jmarket = new JSONObject();
			jmarket.put("market_title", m.getMarket_title());
			jmarket.put("market_note", m.getMarket_note());
			jmarket.put("market_no", m.getMarket_no());
			jmarket.put("market_img", m.getMarket_img());
			jmarket.put("market_price", m.getMarket_price());
			jmarket.put("count", sellerMarketCount);

			jarr.add(jmarket);
		}
		// 전송용 최종 json 객체 선언
		JSONObject sendJson = new JSONObject();
		sendJson.put("list", jarr);

		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.append(sendJson.toJSONString());
		out.flush();
		out.close();
	}
	


	// 장터 다중 이미지업로드
	@RequestMapping("marketmultiplePhotoUpload.do")
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
			String dftFilePath = request.getSession().getServletContext().getRealPath("resources/upload/marketUpload/");

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
			sFileInfo += "&sFileURL=" + "/farm/resources/upload/marketUpload/" + realFileNm;
			PrintWriter print = response.getWriter();
			print.print(sFileInfo);
			print.flush();
			print.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	@RequestMapping("marketUpdateMove.do")
	public ModelAndView marketUpdate(ModelAndView mv,@RequestParam("market_no") int market_no) {
		Market market = marketService.selectMarketInfo(market_no);
		mv.addObject("market",market);
		mv.setViewName("market/marketUpdate");
		return mv;
	}
	@RequestMapping("marketDelete.do")
	public String marketDelete(@RequestParam("market_no") int market_no) {
		int marketDelete = marketService.updateMarketDel(market_no);
		return "forward:/marketList.do";
	}
	@RequestMapping(value="updateMarket.do",method=RequestMethod.POST)
	public String updateMarket(Market market,HttpServletRequest request,
			@RequestParam(name = "upfile", required = false) MultipartFile file) {
		String path = request.getSession().getServletContext().getRealPath("resources/upload/marketUpload");

		try {
			file.transferTo(new File(path + "\\" + file.getOriginalFilename()));

			if (file.getOriginalFilename() != null) {
				// 첨부된 파일이 있을 경우, 폴더에 기록된 해당 파일의 이름바꾸기 처리함
				// 새로운 파일명 만들기 : '년월일시분초'
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
				String renameFileName = market.getMember_id() + "_"
						+ sdf.format(new java.sql.Date(System.currentTimeMillis())) + "."
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
		} catch (IllegalStateException | IOException e) {}

		int updateMarket = marketService.updateMarket(market);
		
		return "forward:/marketDetail.do?market_no="+market.getMarket_no();
	}
}
