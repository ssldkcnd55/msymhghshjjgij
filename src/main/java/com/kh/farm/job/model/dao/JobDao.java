package com.kh.farm.job.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.farm.common.model.vo.PageNumber;
import com.kh.farm.job.model.vo.Job;
import com.kh.farm.notice.model.vo.Notice;

@Repository
public class JobDao {

	public int listCount(SqlSessionTemplate sqlSession) {

		return sqlSession.selectOne("job.jobListCount");
	}

	public ArrayList<Job> selectJobList(int currentPage, SqlSessionTemplate sqlSession) {
		int startRow = (currentPage - 1) * 10 + 1;
		int endRow = startRow + 9;

		PageNumber pnum = new PageNumber();
		pnum.setStartRow(startRow);
		pnum.setEndRow(endRow);

		System.out.println("hi");

		List<Job> list = sqlSession.selectList("job.jobList", pnum);
		return (ArrayList<Job>) list;
	}

	public ArrayList<Job> searchJobList(int currentPage, SqlSessionTemplate sqlSession, PageNumber pp) {
		int startRow = (currentPage - 1) * 10 + 1;
		int endRow = startRow + 9;

		PageNumber pnum = new PageNumber();
		pnum.setStartRow(startRow);
		pnum.setEndRow(endRow);
		pnum.setJob_search(pp.getJob_search());

		List<Job> list = sqlSession.selectList("job.jobserach", pnum);
		return (ArrayList<Job>) list;
	}

	public int insertJobMake(SqlSessionTemplate sqlSession, Job job) {
		// TODO Auto-generated method stub
		return sqlSession.insert("insertjob", job);
	}

	public Job jobDeatil(SqlSessionTemplate sqlSession, int job_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("job.jobDetail", job_no);
	}

	public ArrayList<Job> selectJobaddr(int currentPage, SqlSessionTemplate sqlSession, String addr) {
		int startRow = (currentPage - 1) * 10 + 1;
		int endRow = startRow + 9;

		PageNumber pnum = new PageNumber();
		pnum.setStartRow(startRow);
		pnum.setEndRow(endRow);
		pnum.setAddr(addr);
		System.out.println("pnum startRoW 값:"+pnum.getStartRow());
		System.out.println("pnum endRoW 값:"+pnum.getEndRow());

		List<Job> list = sqlSession.selectList("job.jobaddr", pnum);
		return (ArrayList<Job>) list;

	}

}
