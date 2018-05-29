package com.kh.farm.auction.controller;


import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.farm.auction.model.service.AuctionService;
import com.kh.farm.auction.model.vo.Auction;
import com.kh.farm.auction.model.vo.AuctionHistory;
import com.kh.farm.auction.model.vo.AuctionQnA;
import com.kh.farm.market.model.vo.Market;
import com.kh.farm.market.model.vo.Review;
import com.kh.farm.member.model.vo.Member;

import net.sf.json.JSONArray;

@Controller
public class AuctionController {

	@Autowired private AuctionService auctionService;
	
	/*경매 등록시 DB저장*/
	@RequestMapping(value="insertAuctionMake.do", method=RequestMethod.POST)
	public String insertAuctionMake(Auction auction,HttpServletResponse response,HttpServletRequest request,
			@RequestParam(name = "upfile", required = false) MultipartFile file){
		String path = request.getSession().getServletContext().getRealPath("resources/upload/auctionUpload");
		
		try {
			file.transferTo(new File(path + "\\" + file.getOriginalFilename()));

			if (file.getOriginalFilename() != null) {
				// 첨부된 파일이 있을 경우, 폴더에 기록된 해당 파일의 이름바꾸기 처리함
				// 새로운 파일명 만들기 : '년월일시분초'
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
				String renameFileName = auction.getMember_id()+"_"+sdf.format(new java.sql.Date(System.currentTimeMillis())) + "."
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
				auction.setAuction_img(renameFileName);
			}
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		int insertAuctionMake =  auctionService.insertAuctionMake(auction);
		/*System.out.println("insertAuctionMake : "+insertAuctionMake);*/
		
		//mv.addObject("auction", insertAuctionMake);
		/*mv.setViewName("/farm/AuctionList_controller.do");*/
		return "forward:/AuctionList_controller.do";
		
	}
	
	/*경매 메인 list뿌려주기*/
	@RequestMapping(value="AuctionList_controller.do")
	public ModelAndView AuctionList(ModelAndView mv){	
		int page = 1;
		List<Auction> AuctionList =  auctionService.selectAuctionList(page);
		/*System.out.println(AuctionList.size());*/
		mv.setViewName("auction/auctionList");
		mv.addObject("list",AuctionList);
		return mv;
		
	}
	
	/*경매 디테일*/
	@RequestMapping(value="AuctionDetail.do")
	public String selectAuctionDetail(Model model, @RequestParam(value="auction_no") int auction_no) {
		Auction selectAuctionDetail = auctionService.selectAuctionDetail(auction_no);
		model.addAttribute("auction", selectAuctionDetail);
		return "auction/auctionDetail";
	}
	
	/*경매 메인 더보기 */
	@RequestMapping(value="moreAuctionList.do",method=RequestMethod.POST)
	public void moreMarketList(HttpServletResponse response, @RequestParam("page") int page) throws IOException{
		System.out.println("auction more...");
		List<Auction> list = auctionService.selectAuctionList(page);
		JSONArray jarr = new JSONArray();
		
		//list를 jarr로 복사하기
		for(Auction a : list) {
			//추출한 user를 json 객체에 담기
			JSONObject jauction = new JSONObject();
			jauction.put("auction_title", a.getAuction_title());
			jauction.put("auction_no", a.getAuction_no());
			jauction.put("auction_note", a.getAuction_note());
			jauction.put("auction_img", a.getAuction_img());
			
			jarr.add(jauction);
		}
		//전송용 최종 json 객체 선언
		jarr.toString();
		JSONObject sendJson = new JSONObject();
		sendJson.put("list", jarr);
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.append(sendJson.toJSONString());
		out.flush();
		out.close();
	}
	
	/*삭제*/
	@RequestMapping(value="auctionDelete.do")
	public String deleteAuction(Model model, @RequestParam(value="auction_no") int auction_no) {
		Auction deleteAuction = auctionService.deleteAuction(auction_no);
		model.addAttribute("auction", deleteAuction);
		return "forward:/AuctionList_controller.do";
	}
	
	/*수정버튼 정보들고 수정화면으로 이동*/
	@RequestMapping(value="auctionModify.do")
	public String ModifyAuction(Model model, @RequestParam(value="auction_no") int auction_no) {
		Auction selectModifyAuction = auctionService.selectModifyAuction(auction_no);
		selectModifyAuction.toString();
		model.addAttribute("auction", selectModifyAuction);
		return "auction/auctionModify";
	}
	
	/*수정 등록 */
	@RequestMapping(value="updateAuctionMake.do",method=RequestMethod.POST)
	public String updateAuctionMake(Model model, @RequestParam(value="auction_no") int auction_no,
			@RequestParam(name = "upfile", required = false) MultipartFile file, @RequestParam(name = "auction_img") String auction_img,
			 Auction auction,HttpServletResponse response,HttpServletRequest request) {
		
		if(file.getOriginalFilename() == null) {
			auction.setAuction_img(auction_img); 
		}
		
		String path = request.getSession().getServletContext().getRealPath("resources/upload/auctionUpload");
		
		try {
			
			if (file.getOriginalFilename() != null && !file.getOriginalFilename().equals("")) {
				//file.transferTo(new File(path + "\\" + file.getOriginalFilename()));
				// 첨부된 파일이 있을 경우, 폴더에 기록된 해당 파일의 이름바꾸기 처리함
				// 새로운 파일명 만들기 : '년월일시분초'
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
				String renameFileName = auction.getMember_id()+"_"+sdf.format(new java.sql.Date(System.currentTimeMillis())) + "."
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
				auction.setAuction_img(renameFileName);
			}
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		int updateAuctionMake = auctionService.updateAuctionMake(auction);
		
		System.out.println("updateAuctionMake : "+updateAuctionMake);
		
		return "forward:/AuctionDetail.do";
	}
	/*QnA 등록 페이지이동*/
	@RequestMapping(value="moveAuctionQnAMake.do")
	public ModelAndView moveAuctionQnAMake(ModelAndView mv, Auction auction) {
		mv.addObject("auction", auction);
		mv.setViewName("auction/auctionWriteQnA");
		return mv;
	}
	
	/*QnA 등록*/
	@RequestMapping(value="AuctionQnAMake.do",method=RequestMethod.POST)
	public String insertAuctionQnAMake(AuctionQnA auctionqna) {
		int at_no=auctionqna.getAuction_no();
		/*System.out.println("Auction_no : "+auctionqna.getAuction_no()+" / "+"tilte : "+auctionqna.getAuction_qna_title()+"member_id : "+auctionqna.getMember_id()
		+" / "+"note : "+auctionqna.getAuction_qna_contents()+" / "+"qna_no : "+auctionqna.getAuction_qna_no());*/
		int insertAuctionQnAMake = auctionService.insertAuctionQnAMake(auctionqna);
		/*System.out.println("insertAuctionQnAMake : "+insertAuctionQnAMake );*/
		return "redirect:/AuctionDetail.do?auction_no="+at_no;
	}
	
	/*경매 QnAList뿌리기*/
	@RequestMapping(value="AuctionQnAList.do")
	public void AuctionQnAList(Auction auction,HttpServletResponse response,@RequestParam("page") int currentPage) 
		throws IOException{
		JSONArray jarr = new JSONArray();
		ArrayList<AuctionQnA> list = auctionService.selectAuctionQnAList(auction,currentPage);
		/*System.out.println("list : "+list.toString());*/
		int limitPage = 10;
		int listCount = auctionService.selectAuctionQnACount(auction);
		/*System.out.println("listCount : "+listCount);*/
		int maxPage=(int)((double)listCount/limitPage+0.9); //ex) 41개면 '5'페이지나와야되는데 '5'를 계산해줌
		int startPage=((int)((double)currentPage/5+0.8)-1)*5+1;
		int endPage=startPage+5-1;
		
		if(maxPage<endPage) {
			endPage = maxPage;
		}
		
		for(AuctionQnA aq : list) {
			JSONObject jsq = new JSONObject();
			jsq.put("rnum", aq.getRnum());
			jsq.put("auction_qna_no",aq.getAuction_qna_no());
			jsq.put("auction_qna_title", aq.getAuction_qna_title());
			jsq.put("member_id", aq.getMember_id());
			jsq.put("auction_qna_question_date", aq.getAuction_qna_question_date().toString());
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
	
	/*경매 QnA Detail 이동*/
	@RequestMapping(value="moveauctionQnADetail.do")
	public ModelAndView moveAuctionQnADetail(ModelAndView mv, @RequestParam("auction_qna_no") int auction_qna_no) {
		AuctionQnA auctionQnADetail = auctionService.selectAuctionQnADetail(auction_qna_no);
		/*System.out.println("qna_no? : "+auctionQnADetail.getAuction_qna_no());*/
		mv.addObject("auctionqna", auctionQnADetail);
		mv.setViewName("auction/auctionQnADetail");
		return mv;
	}
	
	/*경매 QnA 데테일에서 수정 버튼*/
	@RequestMapping(value="moveAuctionQnAModify.do")
	public ModelAndView moveAuctionQnAModify(ModelAndView mv,@RequestParam(value="auction_qna_no") int auction_qna_no) {
		AuctionQnA auctionqua = auctionService.selectshowAuctionQnAModify(auction_qna_no);
		/*System.out.println("qna_no? : "+auctionQnADetail.getAuction_qna_no());*/
		mv.addObject("auctionqna", auctionqua);
		mv.setViewName("auction/auctionQnAModify");
		return mv;
	}
	
	//경매 QnA 수정
	@RequestMapping(value="registerAuctionQnAModify.do")
	public String registerAuctionQnAModify(AuctionQnA auctionqna) {
		int updateauctionqua = auctionService.updateAuctionQnA(auctionqna);
		return "redirect:/moveauctionQnADetail.do?auction_qna_no="+auctionqna.getAuction_qna_no();
		
	}
	//경매 판매자 QnA 답변 등록
	@RequestMapping(value="updateauctionQnA_Answer.do" ,method=RequestMethod.POST)
	public String updateauctionQnA_Answer(AuctionQnA auctionqna) {
		System.out.println("답글내용 : "+auctionqna.getAuction_qna_answer()+" / "+"댓글 시간 : "+auctionqna.getAuction_qna_answer_date());
		int updateauctionQnA_Answer = auctionService.updateauctionQnA_Answer(auctionqna);
		
		System.out.println("updateauctionQnA_Answer :"+updateauctionQnA_Answer);
		return "redirect:/moveauctionQnADetail.do?auction_qna_no="+auctionqna.getAuction_qna_no();
		
	}
	
	/*home.jsp 경매 리스트*/
	@RequestMapping(value="homeAuctionList.do")
	public void homeAuctionList(HttpServletResponse response) throws IOException {
		ArrayList<Auction> list= auctionService.selectHomeAuctionList();
		JSONArray jarr = new JSONArray();
		
		for(Auction a : list) {
			//추출한 user를 json 객체에 담기
			JSONObject jauction = new JSONObject();
			jauction.put("auction_title", a.getAuction_title());
			jauction.put("auction_img", a.getAuction_img());
			jauction.put("auction_startprice", a.getAuction_startprice());
			jauction.put("auction_directprice", a.getAuction_directprice());
			jauction.put("auction_no", a.getAuction_no());
			jarr.add(jauction);
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
	
	/*경매 판매자 QnA답변 수정*/
	@RequestMapping(value="seller_QnAanswer_Modify.do",method=RequestMethod.POST)
	@ResponseBody
	public void seller_QnAanswer_Modify(HttpServletResponse response,AuctionQnA auctionqna,
			@RequestParam(value="auction_qna_no")int auction_qna_no)throws IOException{
		System.out.println("Qna 답변 수정 실행!!!!!");
		System.out.println("auction_qna_no : "+auction_qna_no+" / "+"답변 : "+auctionqna.getAuction_qna_answer());
		int seller_QnAanswer_Modify = auctionService.updateSellerAuctionQnAanswer(auctionqna);
		System.out.println("seller_QnAanswer_Modify : "+seller_QnAanswer_Modify);
		AuctionQnA result = auctionService.selectseller_QnAanswer(auction_qna_no);
		System.out.println("restult : "+result.getAuction_no()+" / "+result.getAuction_qna_answer());
			
			 response.setContentType("application/json; charset=utf-8;");
			 JSONObject json = new JSONObject();
			 String answer = result.getAuction_qna_answer();
			 json.put("auction_qna_answer", answer);
			 json.put("auction_qna_answer_date", result.getAuction_qna_answer_date().toString());
			 System.out.println(json.toJSONString());
		
        
       
        PrintWriter out = response.getWriter();
        out.print(json.toJSONString());
        out.flush();
        out.close();
        //return json.toJSONString();
		
	}
	
	//경매 답글 삭제
	@RequestMapping(value="delete_auction_qna_answer.do")
	public String delete_auction_qna_answer(@RequestParam(value="auction_qna_no") int auction_qna_no) {
		int result = auctionService.delete_auction_qna_answer(auction_qna_no);
		return "redirect:/moveauctionQnADetail.do?auction_qna_no="+auction_qna_no;
	}
	
	
	/*경매 입찰 가격 비교*/
	@RequestMapping(value="checkAuction_history_price.do",method=RequestMethod.POST)
	public void checkAuction_history_price(HttpServletResponse response,@RequestParam(value="auction_no") int auction_no) 
	throws IOException{
		System.out.println(auction_no);
		AuctionHistory checkauctionhistoryprice = auctionService.selectcheckAuction_history_price(auction_no);
		System.out.println("checkauctionhistoryprice111 : "+checkauctionhistoryprice.getAuction_history_price());
		
		/*mv.addObject("checkprice", checkauctionhistoryprice);
		mv.setViewName("auction/auctionDetail");
		return mv;*/
		
		 response.setContentType("application/json; charset=utf-8;");
        JSONObject json = new JSONObject();
        int price = checkauctionhistoryprice.getAuction_history_price();
        System.out.println("price : "+price);
        json.put("price", price);
        
        System.out.println(json.toJSONString());
    
      PrintWriter out = response.getWriter();
      out.print(json.toJSONString());
      out.flush();
      out.close();
		
	}
	
	
	//경매 입찰 등록 
	@RequestMapping(value="insertAuctionBidding.do")
	public String insertAuctionBidding(AuctionHistory auctionhistory) {
		System.out.println("111");
		int makeauctionhistory = auctionService.insertAuctionBidding(auctionhistory);
		System.out.println("makeauctionhistory : "+makeauctionhistory);
		/*ArrayList<AuctionHistory> selectAuctionBiddingList = auctionService.selectAuctionBiddingList(auctionhistory.getAuction_no());*/
		return "redirect:/AuctionDetail.do?auction_no="+auctionhistory.getAuction_no();
		
	}
	
}
