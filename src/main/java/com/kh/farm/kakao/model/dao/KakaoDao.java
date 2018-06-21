package com.kh.farm.kakao.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import com.kh.farm.kakao.model.vo.Kakao;

@Repository
public class KakaoDao {

	public Kakao selectKakaoId(Kakao kakao,SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("kakao.selectKakaoId",kakao);
	}

	public int insertKakaoInfo(Kakao kakao, SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.insert("kakao.insertKakaoInfo",kakao);
	}

	public int updateKakaoInfo(Kakao kakao, SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.update("kakao.updateKakaoInfo",kakao);
	}

	public List<Kakao> selectKakaoInfo(Kakao kakao, SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("kakao.selectKakaoInfo",kakao);
	}

}
