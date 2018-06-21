package com.kh.farm.member.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.farm.member.model.dao.MemberDao;
import com.kh.farm.member.model.vo.Member;
import com.kh.farm.visit.model.vo.Visit;
import com.kh.farm.auction.model.vo.Auction;
import com.kh.farm.market.model.vo.Market;
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
		return memberDao.selectMemberList(currentPage, sqlSession);
	}

	@Override
	public int selectMemberCount() {
		// TODO Auto-generated method stub
		return memberDao.selectMemberCount(sqlSession);
	}

	@Override
	public int change_app(String member_id) {
		// TODO Auto-generated method stub
		return memberDao.change_app(sqlSession, member_id);
	}

	@Override
	public int change_with(String member_id) {
		// TODO Auto-generated method stub
		return memberDao.change_with(sqlSession, member_id);
	}

	@Override
	public String nowPwdCheck(String member_id) {
		// TODO Auto-generated method stub
		return memberDao.nowPwdCheck(member_id, sqlSession);
	}

	@Override
	public int updateAddr(Member member) {
		// TODO Auto-generated method stub
		return memberDao.updateAddr(member, sqlSession);
	}

	@Override
	public List<Member> selectChangeList(int currentPage, int type) {
		// TODO Auto-generated method stub

		switch (type) {
		case 1:
			return memberDao.selectMemberList(currentPage, sqlSession);
		case 2:
			return memberDao.selectFarmer(sqlSession, currentPage);
		case 3:
			return memberDao.selectCommon(sqlSession, currentPage);
		case 4:
			return memberDao.selectApproval(sqlSession, currentPage);
		case 5:
			return memberDao.selectWithdraw(sqlSession, currentPage);
		default:
			return memberDao.selectWarning(sqlSession, currentPage);
		}
	}

	@Override
	public int selectChangeMemberCount(int type) {

		switch (type) {
		case 2:
			return memberDao.selectFarmerCount(sqlSession);
		case 3:
			return memberDao.selectCommonCount(sqlSession);
		case 4:
			return memberDao.selectApprovalCount(sqlSession);
		case 5:
			return memberDao.selectWithdrawCount(sqlSession);
		default:
			return memberDao.selectWarningCount(sqlSession);
		}
	}

	@Override
	public List<Member> selectSearchMember(String keyword, int type, int currentPage) {

		switch (type) {
		case 1:
			return memberDao.selectMemberName(sqlSession, keyword, currentPage);
		default:
			return memberDao.selectMemberId(sqlSession, keyword, currentPage);
		}

	}

	@Override
	public Member selectIdCheck(String mail_to) {
		// TODO Auto-generated method stub
		return memberDao.selectIdCheck(sqlSession, mail_to);
	}

	@Override
	public Member selectCheckId(Member member) {
		return memberDao.selectCheckId(member, sqlSession);
	}

	@Override
	public int insertNaverSignUp(Member member) {
		// TODO Auto-generated method stub
		return memberDao.insertNaverSignUp(member, sqlSession);
	}

	@Override
	public int insertVisit(Member returnMember) {
		// TODO Auto-generated method stub
		return memberDao.insertVisit(returnMember, sqlSession);
	}

	@Override
	public List<Visit> selectVisitList(int type) {
		// TODO Auto-generated method stub
		return memberDao.selectVisitList(sqlSession, type);
	}

	@Override

	public List<Market> buygraph(Market market) {

		return memberDao.buygraph(sqlSession, market);
	}

	public int updateWarning(Member m) {
		// TODO Auto-generated method stub
		return memberDao.updateWarning(sqlSession, m);

	}

	@Override
	public Member selectMemberInfo(String member_id) {
		// TODO Auto-generated method stub
		return memberDao.selectMemberInfo(sqlSession, member_id);
	}

	@Override
	public int selectMiscaryChatNo(String member_id) {
		// TODO Auto-generated method stub
		return memberDao.selectMiscaryChatNo(sqlSession, member_id);
	}

	@Override
	public Member selectAllcount() {

		return memberDao.selectAllcount(sqlSession);
	}
	
	@Override

	public List<Market> newmarket(Market market) {

		return memberDao.newmarket(sqlSession, market);
	}
	@Override

	public List<Auction> newauction(Auction auction) {

		return memberDao.newauction(sqlSession, auction);
	}
	@Override

	public List<Market> allmarketAmount(Market market) {

		return memberDao.allmarketAmount(sqlSession, market);
	}
	@Override

	public List<Market> allbuyAmount(Market market) {

		return memberDao.allbuyAmount(sqlSession, market);
	}
	@Override

	public List<Market> buydategraph(Market market) {

		return memberDao.buydategraph(sqlSession, market);
	}

}
