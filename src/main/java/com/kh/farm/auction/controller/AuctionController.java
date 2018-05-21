package com.kh.farm.auction.controller;


import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.farm.auction.model.service.AuctionService;
import com.kh.farm.auction.model.vo.Auction;
import com.kh.farm.member.model.vo.Member;

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
		System.out.println("insertAuctionMake : "+insertAuctionMake);
		
		//mv.addObject("auction", insertAuctionMake);
		/*mv.setViewName("/farm/AuctionList_controller.do");*/
		return "forward:/AuctionList_controller.do";
		
	}
	
	/*경매 메인 list뿌려주기*/
	@RequestMapping(value="AuctionList_controller.do")
	public String AuctionList(Auction auction, Model model){		
		List<Auction> AuctionList =  auctionService.selectAuctionList();
		System.out.println(AuctionList.size());
		model.addAttribute("auctionlist", AuctionList);
		return "auction/auctionList";	
	}
	
	/*경매 디테일*/
	@RequestMapping(value="AuctionDetail.do")
	public String selectAuctionDetail(Model model, @RequestParam(value="auction_no") int auction_no) {
		Auction selectAuctionDetail = auctionService.selectAuctionDetail(auction_no);
		model.addAttribute("auction", selectAuctionDetail);
		return "auction/auctionDetail";
	}
	
	
}
