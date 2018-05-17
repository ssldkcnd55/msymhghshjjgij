package com.kh.farm.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import com.kh.farm.member.exception.LoginFailException;
import com.kh.farm.member.model.vo.Member;

@Repository
public class MemberDao {

	@Autowired
	private BCryptPasswordEncoder pwdEncoder;
	
	public int insertMember(Member member,SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		int result = sqlSession.insert("member.insertMember", member);
		return result;
	}

	public Member loginCheck(Member member, SqlSessionTemplate sqlSession) throws LoginFailException{
		Member resultMember = sqlSession.selectOne("member.loginMember", member);
		if(resultMember != null) {
			if(pwdEncoder.matches(member.getMember_pwd(), resultMember.getMember_pwd())) {
				return resultMember;
			}else {
				//return null;
				throw new LoginFailException("로그인 실패");
			}
		}else {
			throw new LoginFailException("로그인 실패");
		}
	}
}
