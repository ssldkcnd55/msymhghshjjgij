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

	int change_app(String member_id);

	int change_with(String member_id);
	
	String nowPwdCheck(String member_id);
	
	int updateAddr(Member member);

	List<Member> selectChangeList(int currentPage, int type);

	int selectChangeMemberCount(int type);

	List<Member> selectSearchMember(String keyword, int type, int currentPage);

	Member selectIdCheck(String mail_to);
	
	Member selectCheckId(Member member);

	int insertNaverSignUp(Member member);
}
