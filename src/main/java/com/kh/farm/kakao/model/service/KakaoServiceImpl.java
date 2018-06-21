package com.kh.farm.kakao.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.farm.kakao.model.dao.KakaoDao;
import com.kh.farm.kakao.model.vo.Kakao;

@Service
public class KakaoServiceImpl implements KakaoService {
	@Autowired
	private KakaoDao kakaoDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public Kakao selectKakaoId(Kakao kakao) {
		// TODO Auto-generated method stub
		return kakaoDao.selectKakaoId(kakao,sqlSession);
	}

	@Override
	public int insertKakaoInfo(Kakao kakao) {
		// TODO Auto-generated method stub
		return kakaoDao.insertKakaoInfo(kakao,sqlSession);
	}

	@Override
	public int updateKakaoInfo(Kakao kakao) {
		// TODO Auto-generated method stub
		return kakaoDao.updateKakaoInfo(kakao,sqlSession);
	}

	@Override
	public List<Kakao> selectKakaoInfo(Kakao kakao) {
		// TODO Auto-generated method stub
		return kakaoDao.selectKakaoInfo(kakao,sqlSession);
	}
	
	
	
}
