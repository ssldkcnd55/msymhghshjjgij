package com.kh.farm.member.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.farm.member.model.dao.MemberDao;
import com.kh.farm.member.model.vo.Member;
import com.kh.farm.member.exception.LoginFailException;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertMember(Member member) {
		// TODO Auto-generated method stub
		return memberDao.insertMember(member, sqlSession);
	}

	@Override
	public Member selectLoginCheck(Member member) throws LoginFailException {
		// TODO Auto-generated method stub
		return memberDao.loginCheck(member, sqlSession);
	}

	@Override
	public Member selectFindId(Member member) {
		// TODO Auto-generated method stub
		return memberDao.findId(member, sqlSession);
	}

	@Override
	public int updatePwd(Member member) {
		// TODO Auto-generated method stub
		return memberDao.updatePwd(member, sqlSession);
	}

	@Override
	public Member selectMember(String member_id2) {

		return memberDao.selectMember(member_id2, sqlSession);
	}

	@Override
	public List<Member> selectMemberList(int currentPage) {
		// TODO Auto-generated method stub
		return memberDao.selectMemberList(currentPage,sqlSession);
	}

	@Override
	public int selectMemberCount() {
		// TODO Auto-generated method stub
		return memberDao.selectMemberCount(sqlSession);
	}

}
