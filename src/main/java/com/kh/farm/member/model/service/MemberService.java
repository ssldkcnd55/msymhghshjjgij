package com.kh.farm.member.model.service;

import com.kh.farm.member.exception.LoginFailException;
import com.kh.farm.member.model.vo.Member;

public interface MemberService {

	int insertMember(Member member);

	Member loginCheck(Member member) throws LoginFailException;

}
