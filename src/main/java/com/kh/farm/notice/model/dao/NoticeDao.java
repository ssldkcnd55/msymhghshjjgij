package com.kh.farm.notice.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.farm.common.model.vo.PageNumber;
import com.kh.farm.notice.model.vo.Notice;
import com.kh.farm.qna.model.vo.MainQna;

@Repository
public class NoticeDao {

	public ArrayList<Notice> noticeList(SqlSessionTemplate sqlSession, int currentPage) {
		// TODO Auto-generated method stub
		int startRow =(currentPage-1)*10+1; //1~10, 11~20 계산할 거 ex) 1, 11, 21, 31,)
		int endRow = startRow+9;
		PageNumber pnum = new PageNumber();
		pnum.setStartRow(startRow);
		pnum.setEndRow(endRow);
		List<Notice> sq = sqlSession.selectList("notice.noticeList",pnum);
		return (ArrayList)sq;
	}

	public int noticeCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		int listCount = sqlSession.selectOne("notice.noticeCount");
		return listCount;
	}

	public int insertNotice(SqlSessionTemplate sqlSession, Notice notice) {
		// TODO Auto-generated method stub
		return sqlSession.insert("insertNotice",notice);
	}

	public Notice noticeDeatil(SqlSessionTemplate sqlSession, int notice_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("notice.noticeDetail", notice_no);
	}

	public int updateNotice(SqlSessionTemplate sqlSession, Notice notice) {
		// TODO Auto-generated method stub
		return sqlSession.update("updateNotice",notice);
	}

	public int deleteNotice(SqlSessionTemplate sqlSession, int notice_no) {
		// TODO Auto-generated method stub
		return sqlSession.delete("deleteNotice",notice_no);
	}

}
