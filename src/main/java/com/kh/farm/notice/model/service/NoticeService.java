package com.kh.farm.notice.model.service;

import java.util.ArrayList;

import com.kh.farm.notice.model.vo.Notice;
import com.kh.farm.qna.model.vo.MainQna;

public interface NoticeService {

	ArrayList<Notice> selectNoticeList(int currentPage);

	int selectNoticeCount();

	int insertNotice(Notice notice);

	Notice noticeDeatil(int notice_no);

	int updateNotice(Notice notice);

	int deleteNotice(int notice_no); 

	

}
