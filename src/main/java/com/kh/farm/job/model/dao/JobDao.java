package com.kh.farm.job.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.farm.common.model.vo.PageNumber;
import com.kh.farm.job.model.vo.Job;

@Repository
public class JobDao {

	public int listCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("job.jobListCount");
	}

	public ArrayList<Job> selectJobList(int currentPage, SqlSessionTemplate sqlSession) {
		int startRow =(currentPage-1) * 10 + 1;
		int endRow = startRow +9;
		
		PageNumber pnum =  new PageNumber();
		pnum.setStartRow(startRow);
		pnum.setEndRow(endRow);
		
		
		 List<Job> list =sqlSession.selectList("job.jobList",pnum);
		 return (ArrayList<Job>)list;
	}

}
