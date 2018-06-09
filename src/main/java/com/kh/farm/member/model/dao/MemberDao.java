package com.kh.farm.member.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import com.kh.farm.common.model.vo.PageNumber;
import com.kh.farm.member.exception.LoginFailException;
import com.kh.farm.member.model.vo.Member;

@Repository
public class MemberDao {

	@Autowired
	private BCryptPasswordEncoder pwdEncoder;
	
	public Member selectCheckId(Member member,SqlSessionTemplate sqlsession) {
		Member memberId=sqlsession.selectOne("member.selectCheckId",member);
		return memberId;
	}
	
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

	public Member findId(Member member, SqlSessionTemplate sqlSession) {
		
		Member memberId = sqlSession.selectOne("member.findId",member);
		
		return memberId;
	}

	public int updatePwd(Member member, SqlSessionTemplate sqlSession) {
		System.out.println(member.getMember_id());
		System.out.println(member.getMember_pwd());
		int result = sqlSession.update("member.updatePwd",member);
		System.out.println("111");
		return result;
	}

	public Member selectMember(String member_id2, SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("member.selectMember", member_id2);
	}

	public List<Member> selectMemberList(int currentPage, SqlSessionTemplate sqlSession) {
		int startRow =(currentPage-1)*10+1; //1~10, 11~20 계산할 거 ex) 1, 11, 21, 31,)
		int endRow = startRow+9;
		PageNumber pnum = new PageNumber();
		pnum.setStartRow(startRow);
		pnum.setEndRow(endRow);
		return sqlSession.selectList("member.selectMemberList", pnum);
	}

	public int selectMemberCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		int listCount = sqlSession.selectOne("member.memberCount");
		return listCount;
	}

	public int change_app(SqlSessionTemplate sqlSession, String member_id) {
		// TODO Auto-generated method stub
		return sqlSession.update("member.change_approval", member_id);
	}

	public int change_with(SqlSessionTemplate sqlSession, String member_id) {
		// TODO Auto-generated method stub
		return sqlSession.update("member.change_withdraw", member_id);
	}
	
	public String nowPwdCheck(String member_id,SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("member.nowPwdCheck",member_id);
	}

	public int updateAddr(Member member, SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.update("member.updateAddr", member);
	}

	public List<Member> selectFarmer(SqlSessionTemplate sqlSession, int currentPage) {
		int startRow =(currentPage-1)*10+1; //1~10, 11~20 계산할 거 ex) 1, 11, 21, 31,)
		int endRow = startRow+9;
		PageNumber pnum = new PageNumber();
		pnum.setStartRow(startRow);
		pnum.setEndRow(endRow);
		return sqlSession.selectList("member.selectFarmer", pnum);
	}

	public List<Member> selectCommon(SqlSessionTemplate sqlSession, int currentPage) {
		int startRow =(currentPage-1)*10+1; //1~10, 11~20 계산할 거 ex) 1, 11, 21, 31,)
		int endRow = startRow+9;
		PageNumber pnum = new PageNumber();
		pnum.setStartRow(startRow);
		pnum.setEndRow(endRow);
		return sqlSession.selectList("member.selectCommon", pnum);
	}

	public List<Member> selectApproval(SqlSessionTemplate sqlSession, int currentPage) {
		int startRow =(currentPage-1)*10+1; //1~10, 11~20 계산할 거 ex) 1, 11, 21, 31,)
		int endRow = startRow+9;
		PageNumber pnum = new PageNumber();
		pnum.setStartRow(startRow);
		pnum.setEndRow(endRow);
		return sqlSession.selectList("member.selectApproval", pnum);
	}

	public List<Member> selectWithdraw(SqlSessionTemplate sqlSession, int currentPage) {
		int startRow =(currentPage-1)*10+1; //1~10, 11~20 계산할 거 ex) 1, 11, 21, 31,)
		int endRow = startRow+9;
		PageNumber pnum = new PageNumber();
		pnum.setStartRow(startRow);
		pnum.setEndRow(endRow);
		return sqlSession.selectList("member.selectWithdraw", pnum);
	}

	public List<Member> selectWarning(SqlSessionTemplate sqlSession, int currentPage) {
		int startRow =(currentPage-1)*10+1; //1~10, 11~20 계산할 거 ex) 1, 11, 21, 31,)
		int endRow = startRow+9;
		PageNumber pnum = new PageNumber();
		pnum.setStartRow(startRow);
		pnum.setEndRow(endRow);
		return sqlSession.selectList("member.selectWarning", pnum);
	}

	public int selectFarmerCount(SqlSessionTemplate sqlSession) {
		int listCount = sqlSession.selectOne("member.FarmerCount");
		return listCount;
	}

	public int selectCommonCount(SqlSessionTemplate sqlSession) {
		int listCount = sqlSession.selectOne("member.CommonCount");
		return listCount;
	}

	public int selectApprovalCount(SqlSessionTemplate sqlSession) {
		int listCount = sqlSession.selectOne("member.ApprovalCount");
		return listCount;
	}

	public int selectWithdrawCount(SqlSessionTemplate sqlSession) {
		int listCount = sqlSession.selectOne("member.WithdrawCount");
		return listCount;
	}

	public int selectWarningCount(SqlSessionTemplate sqlSession) {
		int listCount = sqlSession.selectOne("member.memberCount");
		return listCount;
	}

	public List<Member> selectMemberName(SqlSessionTemplate sqlSession, String keyword, int currentPage) {
		int startRow =(currentPage-1)*10+1; //1~10, 11~20 계산할 거 ex) 1, 11, 21, 31,)
		int endRow = startRow+9;
		PageNumber pnum = new PageNumber();
		pnum.setStartRow(startRow);
		pnum.setEndRow(endRow);
		pnum.setKeyword(keyword);
		return sqlSession.selectList("member.selectMemberName", pnum);
	}

	public List<Member> selectMemberId(SqlSessionTemplate sqlSession, String keyword, int currentPage) {
		int startRow =(currentPage-1)*10+1; //1~10, 11~20 계산할 거 ex) 1, 11, 21, 31,)
		int endRow = startRow+9;
		PageNumber pnum = new PageNumber();
		pnum.setStartRow(startRow);
		pnum.setEndRow(endRow);
		pnum.setKeyword(keyword);
		return sqlSession.selectList("member.selectMemberId", pnum);
	}

	public Member selectIdCheck(SqlSessionTemplate sqlSession, String mail_to) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("member.selectIdCheck",mail_to);
	}

	public int insertNaverSignUp(Member member, SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.insert("member.insertNaverSignUp",member);
	}

	
}
