package com.kh.farm.member.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.farm.member.exception.LoginFailException;
import com.kh.farm.member.model.vo.Member;

public interface MemberService {

	int insertMember(Member member);

	Member selectLoginCheck(Member member) throws LoginFailException;

	Member selectFindId(Member member);

	int updatePwd(Member member);
	
	Member selectMember(String member_id2);

	List<Member> selectMemberList(int currentPage);

	int selectMemberCount();
}
