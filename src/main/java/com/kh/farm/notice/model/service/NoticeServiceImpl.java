package com.kh.farm.notice.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.farm.notice.model.dao.NoticeDao;
import com.kh.farm.notice.model.vo.Notice;
import com.kh.farm.qna.model.vo.MainQna;

@Service
public class NoticeServiceImpl implements NoticeService{
	@Autowired private NoticeDao noticeDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Override
	public ArrayList<Notice> selectNoticeList(int currentPage) {
		// TODO Auto-generated method stub
		return noticeDao.noticeList(sqlSession,currentPage);
	}
	@Override
	public int selectNoticeCount() {
		// TODO Auto-generated method stub
		return noticeDao.noticeCount(sqlSession);
	}
	@Override
	public int insertNotice(Notice notice) {
		// TODO Auto-generated method stub
		return noticeDao.insertNotice(sqlSession,notice);
	}
	@Override
	public Notice noticeDeatil(int notice_no) {
		// TODO Auto-generated method stub
		return noticeDao.noticeDeatil(sqlSession,notice_no);
	}
	@Override
	public int updateNotice(Notice notice) {
		// TODO Auto-generated method stub
		return noticeDao.updateNotice(sqlSession,notice);
	}
	@Override
	public int deleteNotice(int notice_no) {
		// TODO Auto-generated method stub
		return noticeDao.deleteNotice(sqlSession,notice_no);
	}
}
