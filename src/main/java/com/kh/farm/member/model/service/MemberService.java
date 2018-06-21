package com.kh.farm.member.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.farm.visit.model.vo.Visit;
import com.kh.farm.auction.model.vo.Auction;
import com.kh.farm.market.model.vo.Market;
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
	
	Member selectAllcount();

	int insertNaverSignUp(Member member);

	int insertVisit(Member returnMember);

	List<Visit> selectVisitList(int type);

	List<Market> buygraph(Market market);

	int updateWarning(Member m);

	Member selectMemberInfo(String member_id);

	int selectMiscaryChatNo(String member_id);

	List<Market> newmarket(Market market);

	List<Auction> newauction(Auction auction);

	List<Market> allmarketAmount(Market market);

	List<Market> allbuyAmount(Market market);

	List<Market> buydategraph(Market market);

}
