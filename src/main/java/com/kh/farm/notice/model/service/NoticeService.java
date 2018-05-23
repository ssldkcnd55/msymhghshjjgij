package com.kh.farm.notice.model.service;

import java.util.ArrayList;

import com.kh.farm.notice.model.vo.Notice;
import com.kh.farm.qna.model.vo.MainQna;

public interface NoticeService {

	ArrayList<Notice> selectNoticeList(int currentPage);

	int selectNoticeCount();

}
