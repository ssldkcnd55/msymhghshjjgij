package com.kh.farm.chat.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

@Component("msg_img_down")
public class FiledownloadView extends AbstractView {

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// controller 에서 뷰리졸버로 리턴된 model 정보 자동 전달됨
		File file = (File) model.get("downFile");
		String fileName = file.getName();
		response.setContentType("text/plain; charset=UTF-8");
		response.addHeader("Content-Disposition","attachment; filename=\"" +  new String(fileName.getBytes("UTF-8"), "ISO-8859-1") + "\"");
		response.setContentLength((int) file.length());

		OutputStream out = response.getOutputStream();
		FileInputStream fin = null;

		try {
			fin = new FileInputStream(file);
			FileCopyUtils.copy(fin, out);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (fin != null) {
				try {
					fin.close();
				} catch (Exception e) {
				}
			}
		} // try end;

		out.flush();
		out.close();

	}

}
