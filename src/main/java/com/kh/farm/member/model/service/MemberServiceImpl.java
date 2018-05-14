package com.kh.farm.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.farm.member.model.dao.MemberDao;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired private MemberDao memberDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
}
