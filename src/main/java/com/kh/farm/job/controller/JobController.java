
package com.kh.farm.job.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.farm.auction.model.vo.Auction;
import com.kh.farm.common.model.vo.PageNumber;
import com.kh.farm.job.model.service.JobService;
import com.kh.farm.job.model.vo.Job;
import com.kh.farm.notice.model.vo.Notice;

@Controller
public class JobController {
	@Autowired
	private JobService jobService;

	// 구인구직페이징처리
	@RequestMapping(value = "jobList.do")
	public void jobList(HttpServletResponse response, HttpServletRequest request) throws IOException {
		
		int limitPage = 10;
		int currentPage = 1;
		if (request.getParameter("page") != null) {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}

		int listCount = jobService.selectListcount();
		int startPage = ((int) ((double) currentPage / 5 + 0.8) - 1) * 5 + 1;
		int endPage = startPage + 4;
		int maxPage = (int) ((double) listCount / limitPage + 0.9);

		if (endPage > maxPage) {
			endPage = maxPage;
		}

		ArrayList<Job> jobList = jobService.selectJobList(currentPage);
		JSONObject json = new JSONObject();
		JSONArray jarr = new JSONArray();

		/*
		 * SimpleDateFormat sd = new SimpleDateFormat("yy/mm/dd"); Date date = new
		 * Date(); String today = sd.format(date); System.out.println(today);
		 */

		for (Job job : jobList) {

			JSONObject jsonobj = new JSONObject();
			jsonobj.put("rnum", job.getRnum());
			jsonobj.put("job_no", job.getJob_no());
			jsonobj.put("job_status", job.getJob_status());
			jsonobj.put("job_title", job.getJob_title());
			jsonobj.put("job_img", job.getJob_img());
			/* jsonobj.put("job_enddate", job.getJob_enddate().toString()); */
			jsonobj.put("job_addr", job.getJob_addr());
			jsonobj.put("member_id", job.getMember_id());
			jsonobj.put("job_date", job.getJob_date().toString());
			jsonobj.put("startPage", startPage);
			jsonobj.put("endPage", endPage);
			jsonobj.put("maxPage", maxPage);
			jsonobj.put("currentPage", currentPage);

			jarr.add(jsonobj);
		}

		json.put("list", jarr);
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(json.toString());
		out.flush();
		out.close();

	}
	
	// 구인구직 주소값	
	@RequestMapping(value = "jobaddr.do")
	public void jobaddr(HttpServletResponse response, HttpServletRequest request) throws IOException {
		
		String addr = request.getParameter("addr");
		
		System.out.println("넘어온 addr 값은 :" + addr);
		
		int limitPage = 10;
		int currentPage = 1;
		if (request.getParameter("page") != null) {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		System.out.println(currentPage);

		int listCount = jobService.selectListcount();
		int startPage = ((int) ((double) currentPage / 5 + 0.8) - 1) * 5 + 1;
		int endPage = startPage + 4;
		int maxPage = (int) ((double) listCount / limitPage + 0.9);

		if (endPage > maxPage) {
			endPage = maxPage;
		}

		ArrayList<Job> jobList = jobService.selectJobaddr(currentPage,addr);
		JSONObject json = new JSONObject();
		JSONArray jarr = new JSONArray();


		for (Job job : jobList) {

			JSONObject jsonobj = new JSONObject();
			jsonobj.put("rnum", job.getRnum());
			jsonobj.put("job_no", job.getJob_no());
			jsonobj.put("job_status", job.getJob_status());
			jsonobj.put("job_title", job.getJob_title());
			jsonobj.put("job_addr", job.getJob_addr());
			jsonobj.put("member_id", job.getMember_id());
			jsonobj.put("job_date", job.getJob_date().toString());
			jsonobj.put("startPage", startPage);
			jsonobj.put("endPage", endPage);
			jsonobj.put("maxPage", maxPage);
			jsonobj.put("currentPage", currentPage);

			jarr.add(jsonobj);
		}

		json.put("list", jarr);
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(json.toString());
		out.flush();
		out.close();

	}

	// 구인구직 글등록
	@RequestMapping(value = "jobMake.do", method = RequestMethod.POST)
	public String insertjob(HttpServletRequest request, Job job,
			@RequestParam(name = "upfile", required = false) MultipartFile file) {

		String path = request.getSession().getServletContext().getRealPath("resources/upload/jobUpload");

		try {
			file.transferTo(new File(path + "\\" + file.getOriginalFilename()));

			if (file.getOriginalFilename() != null) {
				// 첨부된 파일이 있을 경우, 폴더에 기록된 해당 파일의 이름바꾸기 처리함
				// 새로운 파일명 만들기 : '년월일시분초'
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
				String renameFileName = job.getMember_id() + "_"
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
				job.setJob_img(renameFileName);
			}
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}

		String tel1 = request.getParameter("job_tel1");
		String tel2 = request.getParameter("job_tel2");
		String tel3 = request.getParameter("job_tel3");

		String tel = tel1 + tel2 + tel3;

		job.setJob_tel(tel);

		int insertjob = jobService.insertJobMake(job);

		return "job/job";
	}

	// 구인구직 상세보기
	@RequestMapping(value = "jobDetail.do")
	public String noticeDetail(Model model, @RequestParam(value = "job_no") int job_no) {

		System.out.println("구인구인글넘버:" + job_no);
		Job job = jobService.jobDeatil(job_no);
		System.out.println(job.getJob_title());
		job.toString();
		if (job != null) {

			model.addAttribute("job", job);
			return "job/jobDetail";
		}
		return "에러페이지";
	}

	// 구인구직 검색
	@RequestMapping("jobserach.do")
	public void jobserach(HttpServletResponse response, HttpServletRequest request, PageNumber pp) throws IOException {

		int limitPage = 10;
		int currentPage = 1;
		if (request.getParameter("page") != null) {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		int listCount = jobService.selectListcount();
		int startPage = ((int) ((double) currentPage / 5 + 0.8) - 1) * 5 + 1;
		int endPage = startPage + 4;
		int maxPage = (int) ((double) listCount / limitPage + 0.9);

		if (endPage > maxPage) {
			endPage = maxPage;
		}
		ArrayList<Job> jobList = jobService.searchJobList(currentPage, pp);
		JSONObject json = new JSONObject();
		JSONArray jarr = new JSONArray();

		for (Job job : jobList) {
			JSONObject jsonobj = new JSONObject();

			jsonobj.put("rnum", job.getRnum());
			jsonobj.put("job_no", job.getJob_no());
			jsonobj.put("job_status", job.getJob_status());
			jsonobj.put("job_title", job.getJob_title());
			jsonobj.put("job_addr", job.getJob_addr());
			jsonobj.put("member_id", job.getMember_id());
			jsonobj.put("job_date", job.getJob_date().toString());
			jsonobj.put("startPage", startPage);
			jsonobj.put("endPage", endPage);
			jsonobj.put("maxPage", maxPage);
			jsonobj.put("currentPage", currentPage);

			jarr.add(jsonobj);
		}
		json.put("list", jarr);
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(json.toString());
		out.flush();
		out.close();

	}

	// 다중이미지업로드
	@RequestMapping("multiplePhotoUpload.do")
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
			String dftFilePath = request.getSession().getServletContext().getRealPath("resources/upload/jobUpload/");

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
			sFileInfo += "&sFileURL=" + "/farm/resources/upload/jobUpload/" + realFileNm;
			PrintWriter print = response.getWriter();
			print.print(sFileInfo);
			print.flush();
			print.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
